//
//  URLRequestBuilder.swift
//
//
//  Created by Tawfik Sweedy✌️  .
//

import Foundation
import Moya
import UIKit

// MARK: - using Moya pod
// for more info please check this url https://github.com/Moya/Moya
// read the doc. and enjoy

protocol URLRequestBuilder: TargetType {
    
    var baseURL: URL { get }
    
    var requestURL: URL { get }
    
    // MARK: - Path
    var path: String { get }
    
    var headers: [String: String]? { get }
    
    // MARK: - Methods
    var method: Moya.Method { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
    
    var deviceId: String { get }
}
// MARK: - application constants

extension URLRequestBuilder {
    // MARK: - BASE URL

    var baseURL: URL {
        return URL(string: BGConstants.apiURL)!
    }
    // MARK: - Request URL
    var requestURL: URL {
        print(requestURL)
        return baseURL.appendingPathComponent(path)
    }
    // MARK: - application headers
    var headers: [String: String]? {
        var header = [String: String]()
        header["Content-Type"] = "application/json"
//        header["Authorization"] = BGLoginManger.getUser().value?.token ?? ""
        return header
    }
    
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Content-Type", forHTTPHeaderField: "application/json")
//        request.addValue(BGLoginManger.getUser().value?.token ?? "", forHTTPHeaderField: "Authorization")
        headers?.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return request
    }
    
    var deviceId: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    

    
}

