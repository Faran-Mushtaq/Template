//
//  PickerView.swift
//  SalonDesBeaute
//
//  Created by High- Sierra 13.6 on 04/12/2018.
//  Copyright © 2018 High- Sierra 13.6. All rights reserved.
//

import UIKit

class PickerView: UIPickerView {
  
    var items = [String]() {
        didSet{
           reloadAllComponents()
            if numberOfRows(inComponent: 0) > 0 {
                selectRow(0, inComponent: 0, animated: false)
            }
        }
    }
    var customModelArray = [Any]()
   var didSelectPickerRow: ((_ title : String, _ indexNo : Int) -> Void)?
    var doneTapped : (()->Void)?
    var cancelTapped : (()->Void)?

    
    // MARK: - Initializers
    override init(frame: CGRect){
        
          super.init(frame: frame)
        // UIPickerView
     //   self.dropDownPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: 216))
       self.delegate = self
       self.dataSource = self
      //  self.dropDownPickerView.backgroundColor = UIColor.clear
    
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    func setupToolBar(_ textField : UITextField)  {
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.darkGray // UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneClick() {
     doneTapped?()
    }
    @objc func cancelClick() {
      cancelTapped?()
    }
    

}
extension PickerView : UIPickerViewDataSource , UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didSelectPickerRow?(items[row] , row)
    }
    
    
}
