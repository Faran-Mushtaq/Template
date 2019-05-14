//
//  CalendarComponent.swift
//  SalonDesBeaute
//
//  Created by High- Sierra 13.6 on 07/12/2018.
//  Copyright © 2018 High- Sierra 13.6. All rights reserved.
//

import UIKit

class CalendarComponent: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblTitle: BaseUILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblMonth: BaseUILabel!
    
    var setLayOut : (()-> Void)?
    
    var numDays: Int?
    var Days = [String]()
    var Dates = [String]()
    var date = Date()
    var _dates: [Date] = [Date]()
    
    var isCalendarOpen = false
    
    @IBOutlet weak var collectionViewHeightConstraint: BaseLayoutConstraint!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commomInit()
    }
    
    
    
    func commomInit(){
        Bundle.main.loadNibNamed("CalendarComponent", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        self.translatesAutoresizingMaskIntoConstraints = false
        //self.backgroundColor = .clear
        
        setCollectionView()
    }
    
    func setCollectionView()  {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = flowLayout
        collectionView.register( UINib.init(nibName: "CalendarComponentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CalendarComponentCollectionViewCell")
         collectionView.clipsToBounds = true
    }
    
    func setupCalendar(){
        self.numDays = GetNumberOfDays(year: Int(self.date.yearAsString())!, month: Int(self.date.monthAsString())!)
         self.lblMonth.text = "\(self.date.monthNameAsString()), \(self.date.dateAsString()), \(self.date.yearAsString())"
     
        initDates()
        DispatchQueue.main.async {
            self.getCurrentDateSlots()
        }
    }
    
    
    @IBAction func showCalendar(_ sender: UIButton) {
        
        if isCalendarOpen == false {
            isCalendarOpen = true
            collectionViewHeightConstraint.constant = 55
        }else {
             isCalendarOpen = false
             collectionViewHeightConstraint.constant = 0
        }
      
       // self.numDays = GetNumberOfDays(year: Int(self.date.yearAsString())!, month: Int(self.date.monthAsString())!)
       // self.lblMonth.text = "\(self.date.monthNameAsString()), \(self.date.dateAsString()), \(self.date.yearAsString())"
       // initDates()
        setLayOut?()
       
       
    }
    
    
}
extension CalendarComponent : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        
        self.date = self._dates[indexPath.row]
       self.lblMonth.text = "\(self.date.monthNameAsString()), \(self.date.dateAsString()), \(self.date.yearAsString())"
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.collectionViewHeightConstraint.constant = 0
//            self.setLayOut?()
//        }
       
    }
}

extension CalendarComponent : UICollectionViewDataSource {
    
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self._dates.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarComponentCollectionViewCell", for: indexPath) as! CalendarComponentCollectionViewCell
            
            cell.lblDate.text = self.Dates[indexPath.row]
            cell.lblDay.text = self.Days[indexPath.row]
            return cell
        }
    
    }
    
extension CalendarComponent : UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: DesignUtility.getValueFromRatio(52), height: collectionView.frame.height)
        }
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0 //DesignUtility.getValueFromRatio(8)
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        }
}

extension CalendarComponent {
    
    @IBAction func PreviousAction(_ sender: UIButton) {
        
        // print(Date().monthAsString())
       //  print(self.date.monthAsString())
       //  print(Date().yearAsString())
       // print(self.date.yearAsString())
        
        
        if Date().monthAsString() != self.date.monthAsString() ||  Date().yearAsString() != self.date.yearAsString()  {
            
            self.date = self.date.incrementMonths(numberOfMonths: -1)
            if Date().monthAsString() != self.date.monthAsString()  &&  Date().yearAsString() != self.date.yearAsString(){
               // self.Dates.removeAll()
               // self.Days.removeAll()
              //  self._dates.removeAll()
                
               
               
                self.numDays = GetNumberOfDays(year: Int(self.date.yearAsString())!, month: Int(self.date.monthAsString())!)
              self.lblMonth.text = "\(self.date.monthNameAsString()), \(self.date.dateAsString()), \(self.date.yearAsString())"
                initDates()
            }else{
                setDatesAndCalendarForCurrentMonth()
            }
        }else{
            
            setDatesAndCalendarForCurrentMonth()
            
        }
    }
    
    func setDatesAndCalendarForCurrentMonth() {
        self.Dates.removeAll()
        self.Days.removeAll()
        self._dates.removeAll()
        
        
     
        self.numDays = GetNumberOfDays(year: Int(self.date.yearAsString())!, month: Int(self.date.monthAsString())!)
        
        for i in 0..<self.numDays! {
            let date = self.date.startOfMonth()
            self._dates.append(date.incrementDays(numberOfDays: i))
            self.Dates.append(self.date.startOfMonth().incrementDays(numberOfDays: i).dateAsString())
            self.Days.append(self.date.startOfMonth().incrementDays(numberOfDays: i).dayAsString())
        }
        
        var index = Int( Date().dateAsString()) ?? 0
        
        if index != 0 {
            index = index - 1
        }
        let array = Array(self._dates[index..<self._dates.count])
        self._dates = array
        
        
        let arrayDates = Array(self.Dates[index..<self.Dates.count])
        self.Dates = arrayDates
        
        
        let arrayDays = Array(self.Days[index..<self.Days.count])
        self.Days = arrayDays
       self.lblMonth.text = "\(self.date.monthNameAsString()), \(self.date.dateAsString()), \(self.date.yearAsString())"
        self.collectionView.reloadData()
    }
    
    @IBAction func NextAction(_ sender: UIButton) {
        self.date = self.date.incrementMonths(numberOfMonths: 1)
        
//        self.Dates.removeAll()
//        self.Days.removeAll()
//
//        self._dates.removeAll()
        
       self.numDays = GetNumberOfDays(year: Int(self.date.yearAsString())!, month: Int(self.date.monthAsString())!)
      self.lblMonth.text = "\(self.date.monthNameAsString()), \(self.date.dateAsString()), \(self.date.yearAsString())"
       
        initDates()
        
        
    }
    
    
    
    func GetNumberOfDays(year: Int, month: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        
        return numDays
    }
    
    func initDates() {
        
        self._dates.removeAll()
        self.Dates.removeAll()
        self.Days.removeAll()
        
        for i in 0..<self.numDays! {
            let date = self.date.startOfMonth()
            self._dates.append(date.incrementDays(numberOfDays: i))
            self.Dates.append(self.date.startOfMonth().incrementDays(numberOfDays: i).dateAsString())
            self.Days.append(self.date.startOfMonth().incrementDays(numberOfDays: i).dayAsString())
        }
      //
        self.collectionView.reloadData()
    }
    
    
    func getCurrentDateSlots() {
        
        
        var index = Int( Date().dateAsString()) ?? 0
        
        if index != 0 {
            index = index - 1
        }
        let array = Array(self._dates[index..<self._dates.count])
        self._dates = array
        
        
        let arrayDates = Array(self.Dates[index..<self.Dates.count])
        self.Dates = arrayDates
        
        
        let arrayDays = Array(self.Days[index..<self.Days.count])
        self.Days = arrayDays
        
        
        let indexPath = IndexPath.init(item: 0, section: 0)
        self.collectionView.reloadData()
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
    }
}
