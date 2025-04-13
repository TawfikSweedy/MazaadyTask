//
//
//  Created by Tawfik Sweedy✌️  .
//


import Foundation
import Moya

enum Services {
    case User
    case Products(name: String)
    case advertisements
    case tags
}
extension Services : URLRequestBuilder {
    var path: String {
        switch self {
        case .User :
            return EndPoints.user.rawValue
        case .Products :
            return EndPoints.products.rawValue
        case .advertisements :
            return EndPoints.advertisements.rawValue
        case .tags :
            return EndPoints.tags.rawValue
        }
    }
    var method: Moya.Method {
        switch self {
        case .User , .Products , .advertisements , .tags  :
            return .get
      }
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
        case .Products(let name) :
            return .requestParameters(parameters: ["name" : name] , encoding: URLEncoding.queryString)
        case .User , .advertisements , .tags :
            return .requestPlain
        }
    }
}

