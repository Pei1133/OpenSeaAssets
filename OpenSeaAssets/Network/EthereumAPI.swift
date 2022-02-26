//
//  EthereumAPI.swift
//  OpenSeaAssets
//
//  Created by PeiChun on 2022/2/26.
//

import Foundation

enum EthereumAPI {
    case getBalance(address: String = "0x960DE9907A2e2f5363646d48D7FB675Cd2892e91")
}

extension EthereumAPI: NetworkService {
    var baseURL: URL {
        return URL(string: "https://mainnet.infura.io/v3")!
    }
    
    var path: String {
        switch self {
        case .getBalance:
            return "/\(APIKey.infuraAPIKey)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getBalance:
            return .post
        }
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .getBalance(let address):
            return [
                "jsonrpc": "2.0",
                "method": "eth_getBalance",
                "params": ["\(address)", "latest"],
                "id": 1
            ]
        }
    }
    
    var timeout: TimeInterval {
        return 15
    }

}
