//
//  OpenSeaAPI.swift
//  OpenSeaCollection
//
//  Created by PeiChun on 2022/2/23.
//

import Foundation

enum OpenSeaAPI {
    case assets(address: String = "0x960DE9907A2e2f5363646d48D7FB675Cd2892e91", currentPage: Int, limit: Int = 20)
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
    
    var headers: [String: String]? {
        return ["X-API-KEY": "\(APIKey.openSeaAPIKey)"]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .assets(let address, let currentPage, let limit):
            return [
                "owner": "\(address)",
                "limit": "\(limit)",
                "offset": "\(currentPage)"
            ]
        }
    }
    
    var timeout: TimeInterval {
        return 15
    }

}
