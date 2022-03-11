//
//  Model.swift
//  ManualParsingApp
//
//  Created by Вячеслав Кремнев on 08.03.2022.
//

import Foundation

struct ZipCode: Decodable {
    
    let postCode: String?
    let country: String?
    let countryAbbreviation: String?
    let places: Place?
    
    enum CodingKeys: String, CodingKey {
        case postCode = "post code"
        case country
        case countryAbbreviation = "country abbreviation"
        case places
    }
    
    init (value: [String: Any]) {
        postCode = value["post сode"] as? String
        country = value["country"] as? String
        countryAbbreviation = value["country abbreviation"] as? String
        let placesDictionary = value["places"] as? [String: Any] ?? [:]
        places = Place(value: placesDictionary)
    }
    
    
    static func getZipInfo(from value: Any) -> [ZipCode]? {
        var zipInformation: [ZipCode] = []
        
        guard let value = value as? [String: Any] else {return []}
        
        for zipValue in value {
            
            let zipItem = ZipCode(value: value)
            zipInformation.append(zipItem)
        }
        
        return zipInformation
    }
}

struct Place: Decodable {
    
    let placeName: String?
    let longitude: String?
    let state: String?
    let stateAbbreviation: String?
    let latitude: String?
    
    enum CodingKeys: String, CodingKey {
        case placeName = "place name"
        case longitude, state
        case stateAbbreviation = "state abbreviation"
        case latitude
    }
    
    init(value: [String: Any]) {
        placeName = value["place name"] as? String
        longitude = value["longitude"] as? String
        state = value["state"] as? String
        stateAbbreviation = value["state abbreviation"] as? String
        latitude = value["latitude"] as? String
    }
}
enum Link: String {
    
    case json = "https://api.zippopotam.us/us/90210"
}


