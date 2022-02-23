//
//  OpenSeaAPI.swift
//  OpenSeaCollection
//
//  Created by PeiChun on 2022/2/23.
//

import Foundation

enum OpenSeaAPI {
    case assets(currentPage: Int, limit: Int = 20)
}

extension OpenSeaAPI: NetworkService {
    var baseURL: URL {
        return URL(string: "https://api.opensea.io/api/v1")!
    }
    
    var path: String {
        switch self {
        case .assets:
            return "/assets"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .assets:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return ["X-API-KEY": "5b294e9193d240e39eefc5e6e551ce83"]
    }
    
    var parameters: [String : Any] {
        switch self {
        case .assets(let currentPage, let limit):
            return [
                "owner": "0x960DE9907A2e2f5363646d48D7FB675Cd2892e91",
                "limit": "\(limit)",
                "offset": "\(currentPage)"
            ]
        }
    }
    
    var timeout: TimeInterval{
        return 15
    }

}
