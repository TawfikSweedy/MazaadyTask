//
//  BGDecoder.swift
//
//  Created by Tawfik Sweedy✌️  .
//

import Foundation

struct BGDecoder {
    
    static func decode<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

}
