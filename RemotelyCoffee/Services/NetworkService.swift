//
//  NetworkService.swift
//  RemotelyCoffee
//
//  Created by Stephanie on 2/16/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "pr6FIDXyCcsBzd85lKNyz8dHleQAzLCuGxOX2n91Z4dJbOXTFPVV0TmyM7OLmrG-i49eUmBv-nPfri9xcygc0CIwMsAZO5x29SiWBfpPr8lUN6x8JbKv52OfBRhKXnYx"

enum YelpService {
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long: Double)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String {
            switch self{
            case .search:
                return "/search"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(
                    parameters: ["latitude": lat, "longitude": long, "limit": 5], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}
