//
//  BGConstants.swift
//
//  Created by Tawfik Sweedy✌️  .
//

import Foundation

struct BGConstants {
        
    // MARK: - APIs Constants
    static var baseURL:String {return "https://stagingapi.mazaady.com/api/interview-tasks/"}
    static var apiURL:String {return "\(baseURL)"}
//    static var apiKey : String {return "F3D1CD49-16D8-41CC-9C11-B88F75547EA9"}
//    static var imagesURL:String {return baseURL + "storage/"}
    
    
    
    
    
    static var success:Int {return 200}
    static var added:Int {return 202}
    static var failed:Int {return 400}
    static var created:Int {return 201}
    static var unprocessableEntity : Int {return 401}
    static var notActive : Int {return 405}
    static var unauthenticated : Int {return 403}
    static var notAcceptable : Int {return 422}
    static var notFound : Int {return 404}
    
}
