//
//  Date+Extensions.swift


import UIKit
import MOLH
extension Date {
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier:"en")
        return dateFormatter.string(from: self)
    }
    
    func toString(_ withCustomeFormat : String? = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"en")
        dateFormatter.dateFormat = withCustomeFormat
        return dateFormatter.string(from: self)
    }
    
    
    
    
    //    func toString() -> String {
    //        let df = DateFormatter()
    //        df.locale = Locale.init(identifier: "en_GB")
    //        df.dateFormat = "yyyy-MM-dd"
    //        return df.string(from: self)
    //    }
    
    func timeAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("hh:mm")
        return df.string(from: self)
    }
    
    func monthNameAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMMM")
        return df.string(from: self)
    }
    
    func dayAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("EEE")
        return df.string(from: self)
    }
    
    func dayFullNameAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("EEEE")
        return df.string(from: self)
    }
    
    func dateAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("dd")
        return df.string(from: self)
    }
    
    func dateWMonthAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("dd , MMM")
        return df.string(from: self)
    }
    
    func yearAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("yyyy")
        return df.string(from: self)
    }
    
    func monthAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MM")
        return df.string(from: self)
    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    func incrementDays(numberOfDays: Int) -> Date {
        let date = Calendar.current.date(byAdding: .day, value: numberOfDays, to: self)
        return date!
    }
    
    func incrementMonths(numberOfMonths: Int) -> Date {
        let date = Calendar.current.date(byAdding: .month, value: numberOfMonths, to: self)
        return date!
    }
    
    func get12HoursFormateTime(_ time : String) -> String {
        
        let dateAsString = time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.dateFormat = "h:mm a"
        let Date12 = dateFormatter.string(from: date!)
        return Date12
    }
    
    
    
 
}
