//
//  WeatherResponse.swift
//  VacationPlanner
//
//  Created by Danilo on 24/07/2018.
//  Copyright © 2018 Danilo Bias Lago. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherResponse: NSObject {
   
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let cities = "weather"
    }
    
    // MARK: Properties
    public var wheaters: [Weather]?
    
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
        if let items = json.array { wheaters = items.map { Weather(json: $0) } }
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = wheaters { dictionary[SerializationKeys.cities] = value.map { $0.dictionaryRepresentation() } }
        return dictionary
    }
}

