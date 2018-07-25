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
    
    static func getDateFromString(strDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: strDate)
    }
}
