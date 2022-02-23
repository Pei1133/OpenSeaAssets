//
//  NetworkServiceProvider.swift
//  OpenSeaCollection
//
//  Created by PeiChun on 2022/2/22.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case error(Error)
}

struct NetWorkResponse {
    var statusCode: Int {
        return response.statusCode
    }
    var data: Data
    var request: URLRequest
    var response: HTTPURLResponse
}

class NetworkServiceProvider {
    static var shared = NetworkServiceProvider()
    
    func request(service: NetworkService, completion: @escaping (Result<NetWorkResponse>) -> Void) {
        let request = service.buildRequest()
        AF.request(request).responseData { (dataResponse) in
            guard let response = dataResponse.response else {
                return
            }
            switch dataResponse.result {
            case .success(let data):
                let response = NetWorkResponse(data: data, request: request, response: response)
                completion(.success(response))
            case .failure(let error):
                completion(.error(error))
            }
        }
    }
}
