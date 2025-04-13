//
//  BGNetworkHelper.swift
//
//  Created by Tawfiq Sweedy  on 10/08/2021.
//

import Foundation
import UIKit
import Moya
import SystemConfiguration

struct BGNetworkHelper {
    
    // MARK: - print response
    fileprivate static func printResponse(_ response: Response) {
        // print request data
        print("URL:")
        print(response.request?.urlRequest ?? "")
        print("Header:")
        print((response.request?.headers ?? nil) as Any)
        print("STATUS:")
        print(response.statusCode)
        print("Response:")
        if let json = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) {
            print(json)
        } else {
            let response = String(data: response.data, encoding: .utf8)!
            print(response)
        }
    }
    
    // MARK: - validate all APIs responses
//    static func validateResponse (response:Response) -> Bool {
//        print(response)
//        if response.statusCode == BGConstants.success {
//            return true
//        }else{
//            let decoder = JSONDecoder()
//            do {
//                let responseModel = try decoder.decode(ResponseModel.self, from: response.data)
//                print(responseModel)
//                if responseModel.error != nil {
//                    BGAlertPresenter.displayToast(title: responseModel.error ?? "" , message: responseModel.error_description ?? "")
//                }else{
//                    BGAlertPresenter.displayToast(title: responseModel.message ?? "" , message: responseModel.modelState?.modelCountry.first ?? "")
//                }
//                switch responseModel.error {
//                case "email_not_confirmed" :
//                    print("")
//                default :
//                    break
//                }
//                return false
//            }catch {
//                print(error.localizedDescription)
//                BGAlertPresenter.displayToast(title: "Error", message: error.localizedDescription)
//                return false
//            }
//        }
//    }
}
    
