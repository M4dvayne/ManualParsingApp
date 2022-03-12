//placeName: zipData["placename"] as? String,
//longitude: zipData["longitude"] as? String,
//state: zipData["state"] as? String,
//stateAbbreviation: zipData["stateAbbreviation"] as? String,
//latitude: zipData["latitude"] as? String
//
//  NetworkManager.swift
//  ManualParsingApp
//
//  Created by Вячеслав Кремнев on 08.03.2022.
//


import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchZipInfo(completion: @escaping (ZipCode) -> Void) {
        
        AF.request(Link.json.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    print(value)
                    guard let receivedValue = ZipCode.getZipInfo(from: value) else {return}
                    DispatchQueue.main.async {
                        completion(receivedValue)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
}


