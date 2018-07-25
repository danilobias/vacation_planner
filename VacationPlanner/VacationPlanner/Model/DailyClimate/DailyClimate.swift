//
//  DailyClimate.swift
//
//  Created by Danilo Bias Lago on 23/07/2018
//  Copyright (c) Danilo Bias. All rights reserved.
//

import Foundation
import SwiftyJSON

public class DailyClimate {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let date = "date"
        static let temperature = "temperature"
        static let weather = "weather"
        static let woeid = "woeid"
    }
    
    // MARK: Properties
    public var dateString: String?
    public var temperature: Temperature?
    public var weather: String?
    public var woeid: String?
    public var date: Date?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        dateString = DateUtils.formatDateSimple(dateStr: json[SerializationKeys.date].string!)
        temperature = Temperature(json: json[SerializationKeys.temperature])
        weather = json[SerializationKeys.weather].string
        woeid = json[SerializationKeys.woeid].string
        date = DateUtils.getDateFromString(strDate: dateString!)
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = dateString { dictionary[SerializationKeys.date] = value }
        if let value = temperature { dictionary[SerializationKeys.temperature] = value.dictionaryRepresentation() }
        if let value = weather { dictionary[SerializationKeys.weather] = value }
        if let value = woeid { dictionary[SerializationKeys.woeid] = value }
        return dictionary
    }
    
}
