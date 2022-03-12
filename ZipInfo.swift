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
    let places: [Place]?
    
    init (value: [String: Any]) {
        postCode = value["post code"] as? String
        country = value["country"] as? String
        countryAbbreviation = value["country abbreviation"] as? String
        let placesDict = value["places"] as? [[String: Any]] ?? [[:]]
        places = Place.getPlaceInfo(from: placesDict)
    }
    
    static func getZipInfo(from value: Any) -> ZipCode? {
        guard let valueDictionary = value as? [String: Any] else {return nil}
        let zipInfo = ZipCode(value: valueDictionary)
        
        return zipInfo
    }
}

struct Place: Decodable {
    
    let placeName: String?
    let longitude: String?
    let state: String?
    let stateAbbreviation: String?
    let latitude: String?
    
    init(value: [String: Any]) {
        placeName = value["place name"] as? String
        longitude = value["longitude"] as? String
        state = value["state"] as? String
        stateAbbreviation = value["state abbreviation"] as? String
        latitude = value["latitude"] as? String
    }
    static func getPlaceInfo(from value: Any) -> [Place]? {
        guard let placeDictionary = value as? [String: Any] else {return []}
        let placeInfo = Place(value: placeDictionary)

        return [placeInfo]
        //Я так и не смог добраться до вложенности "places", уже даже запускал дебагер и пытался отследить данные, но что-то никак, я понимаю что поставив [] вокруг placeInfo я не возвращаю массив, в общем с этим методом я не разобрался, поэтому во избежание нервного срыва отправляю как есть) удалось получить только значения из модели ZipCode, очень интересно узнать ошибку!
    }
}

enum Link: String {
    
    case json = "https://api.zippopotam.us/us/90210"
}


