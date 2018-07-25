//
//  Mask.swift
//  VacationPlanner
//
//  Created by Danilo on 25/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import Foundation

enum DateType {
    case simple
    case simpleString
    case complex
    case complexComplete
    case complexOnlyTime
}


class DateUtils: NSObject {

    // MARK: - Date
    static func updateDate(strDate: String? = nil, date: Date? = nil, type: DateType) -> String? {
        var dateFormatted: String?
        
        switch type {
        case .simple:
            dateFormatted = formatDateSimple(date: date ?? Date())
        case .simpleString:
            dateFormatted = formatDateSimple(dateStr: strDate ?? "")
        case .complex:
            dateFormatted = formatDateComplex(dateStr: strDate ?? "")
        case .complexComplete:
            dateFormatted = formatDateComplete(dateStr: strDate ?? "")
        case .complexOnlyTime:
            dateFormatted = formatTimeComplexOnlyTime(dateStr: strDate ?? "")
        }
        
        return dateFormatted
    }
    
    static func getYearFrom(strDate: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let convertStrToDate = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "yyyy"
        
        if let date = convertStrToDate {
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
    static func formatDateSimple(date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
    static func formatDateSimple(dateStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let convertStrToDate = dateFormatter.date(from: dateStr)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        if let date = convertStrToDate {
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    static func formatDateComplex(dateStr: String?) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "dd/MM/yyyy"
        
        if dateStr == "" {
            return ""
        }
        
        if let dateString = dateStr {
            let date = dateFormatter.date(from: dateString)
            return dateFormatterString.string(from: date!)
        }
        
        return ""
    }
    
    static func formatDateComplete(dateStr: String?) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterDay = DateFormatter()
        let dateFormatterMiddle = DateFormatter()
        let dateFormatterTime = DateFormatter()
        
        dateFormatterDay.dateFormat = "dd"
        dateFormatterMiddle.dateFormat = "MMMM yyyy"
        dateFormatterTime.dateFormat = "HH:mm"
        
        if let dateString = dateStr {
            let date = dateFormatter.date(from: dateString)
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .medium
            return dateFormatterDay.string(from: date!) + " de " + dateFormatterMiddle.string(from: date!) + " às " + dateFormatterTime.string(from: date!)
        }
        return ""
    }
    
    static func formatTimeComplexOnlyTime(dateStr: String?) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "HH:mm"
        
        if let dateString = dateStr {
            let date = dateFormatter.date(from: dateString)
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: date!)
        }
        return ""
    }
    
    static func getDateFromString(strDate: String, format: String? = nil) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format ?? "dd/MM/yyyy"
        return dateFormatter.date(from: strDate)
    }
}

extension Date {
    
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the amount of nanoseconds from another date
    func nanoseconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.nanosecond], from: date, to: self).nanosecond ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        if nanoseconds(from: date) > 0 { return "\(nanoseconds(from: date))ns" }
        return ""
    }
}
