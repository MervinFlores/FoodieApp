//
//  TimeUtils.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/23/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import Foundation
import Argo

class TimeUtils {
    
    // utilities class; not needed to be instantiated.
    private init() { }
    
    public static func decodedDateFromTimestamp(_ fromTimestamp: Double?) -> Argo.Decoded<Date> {
        let asDate = Date.convertFromTimestamp(fromTimestamp)
        return .fromOptional(asDate)
    }
    
    public static func decodedDateFromString(_ val: String?, format: Date.Format) -> Argo.Decoded<Date> {
        let asDate = Date.convertFromString(format: format, dateStr: val)
        return .fromOptional(asDate)
        
    }
    
    public static func decodedStringFromTimestamp(_ fromTimestamp: Int?) -> Argo.Decoded<String?> {
            return .fromOptional("\(fromTimestamp!)")
    }
}

extension Date {
    
    enum Format: String {
        case birthday = "dd/MM/yyyy"
        case fbBirthday = "MM/dd/yyyy"
    }
    
    static func convertFromTimestamp(_ fromTimestamp: Double?) -> Date? {
        guard let timestamp = fromTimestamp else {
            return nil
        }
        return Date(timeIntervalSince1970: timestamp)
    }
    
    static func convertFromString(format: Format, dateStr: String?, timezone: TimeZone? = nil) -> Date? {
        guard let val = dateStr else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.timeZone = timezone != nil ? timezone : TimeZone.current
        
        return formatter.date(from: val)
    }
    
    func toString(format: Format, timezone: TimeZone? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.timeZone = timezone != nil ? timezone : TimeZone.current
        
        return formatter.string(from: self)
    }
    
    func getMaximumPickerDate() -> Date? {
        return (Calendar.current as NSCalendar).date(byAdding: .year, value: -14, to: Date(), options: [])!
    }
}
