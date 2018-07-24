//
//  Temperature.swift
//
//  Created by Danilo Bias Lago on 23/07/2018
//  Copyright (c) Danilo Bias. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Temperature {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let min = "min"
        static let unit = "unit"
        static let max = "max"
    }
    
    // MARK: Properties
    public var min: Int?
    public var unit: String?
    public var max: Int?
    
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
        min = json[SerializationKeys.min].int
        unit = json[SerializationKeys.unit].string
        max = json[SerializationKeys.max].int
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = min { dictionary[SerializationKeys.min] = value }
        if let value = unit { dictionary[SerializationKeys.unit] = value }
        if let value = max { dictionary[SerializationKeys.max] = value }
        return dictionary
    }
    
}
