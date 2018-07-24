//
//  Cities.swift
//
//  Created by Danilo Bias Lago on 23/07/2018
//  Copyright (c) Danilo Bias. All rights reserved.
//

import Foundation
import SwiftyJSON

public class City {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let district = "district"
        static let woeid = "woeid"
        static let stateAcronym = "state_acronym"
        static let province = "province"
        static let country = "country"
    }
    
    // MARK: Properties
    public var district: String?
    public var woeid: String?
    public var stateAcronym: String?
    public var province: String?
    public var country: String?
    
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
        district = json[SerializationKeys.district].string
        woeid = json[SerializationKeys.woeid].string
        stateAcronym = json[SerializationKeys.stateAcronym].string
        province = json[SerializationKeys.province].string
        country = json[SerializationKeys.country].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = district { dictionary[SerializationKeys.district] = value }
        if let value = woeid { dictionary[SerializationKeys.woeid] = value }
        if let value = stateAcronym { dictionary[SerializationKeys.stateAcronym] = value }
        if let value = province { dictionary[SerializationKeys.province] = value }
        if let value = country { dictionary[SerializationKeys.country] = value }
        return dictionary
    }
    
}
