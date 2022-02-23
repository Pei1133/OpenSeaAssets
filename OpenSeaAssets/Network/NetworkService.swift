//
//  NetworkService.swift
//  OpenSeaCollection
//
//  Created by PeiChun on 2022/2/23.
//

import Foundation

enum HTTPMethod: String, CaseIterable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol NetworkService {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any] { get }
    var timeout: TimeInterval { get }
}

extension NetworkService {
    func buildRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url, timeoutInterval: timeout)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        if method.rawValue == "GET" {
            var components = URLComponents(
                url: url,
                resolvingAgainstBaseURL: false)!
            components.queryItems = parameters.map {
                URLQueryItem(name: $0.key, value: $0.value as? String)
            }
            request.url = components.url
        } else if let headers = headers {
            if headers["Content-Type"] == "application/json" {
                request.httpBody = try? JSONSerialization
                    .data(withJSONObject: parameters, options: [])
            } else if headers["Content-Type"] == "application/x-www-form-urlencoded" {
                request.httpBody = parameters
                    .map { "\($0.key)=\($0.value)" }
                    .joined(separator: "&")
                    .data(using: .utf8)
            } else {
                //...
            }
        }

        return request
    }
}
