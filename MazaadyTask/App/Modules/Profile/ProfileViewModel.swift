//
//  ProfileViewModel.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 12/04/2025.
//

import Foundation
import Moya
import Combine
import PromiseKit

class ProfileViewModel {
    //MARK:- Published Variables
    @Published private(set) var dataStatus: DataState?
    @Published private(set) var userData: UserModel?
    @Published private(set) var productsData: [ProductsModel]?
    @Published private(set) var adsData: [Advertisements]?
    @Published private(set) var tagsData: [Tags]?
    //MARK:- private Variables
    private let mainServices = MoyaProvider<Services>()
    private var cancellables = Set<AnyCancellable>()
    //MARK:- Apis Funcs
    //MARK:- GetUserData
    func GetUserData(){
        firstly { () -> Promise<Any> in
            dataStatus = .loading
            return BGServicesManager.CallApi(self.mainServices,Services.User)
        }.done({ response in
            let result = response as! Response
            //            guard BGNetworkHelper.validateResponse(response: result) else {return}
            let data :  UserModel = try BGDecoder.decode(data: result.data)
            DispatchQueue.main.async {
                self.userData = data
            }
        }).ensure {
            self.dataStatus = .finished(.success)
        }.catch { (error) in
            print(error.localizedDescription)
            self.dataStatus = .finished(.failure(error))
        }
    }
    //MARK:- GetProducts - params(name : String)
    func GetProducts(name : String){
        firstly { () -> Promise<Any> in
            dataStatus = .loading
            return BGServicesManager.CallApi(self.mainServices,Services.Products(name: name))
        }.done({ response in
            let result = response as! Response
            //            guard BGNetworkHelper.validateResponse(response: result) else {return}
            let data :  [ProductsModel] = try BGDecoder.decode(data: result.data)
            DispatchQueue.main.async {
                self.productsData = data
            }
        }).ensure {
            self.dataStatus = .finished(.success)
        }.catch { (error) in
            print(error.localizedDescription)
            self.dataStatus = .finished(.failure(error))
        }
    }
    //MARK:- GetAds
    func GetAds(){
        firstly { () -> Promise<Any> in
            dataStatus = .loading
            return BGServicesManager.CallApi(self.mainServices,Services.advertisements)
        }.done({ response in
            let result = response as! Response
            //            guard BGNetworkHelper.validateResponse(response: result) else {return}
            let data :  AdsModel = try BGDecoder.decode(data: result.data)
            DispatchQueue.main.async {
                self.adsData = data.advertisements
            }
        }).ensure {
            self.dataStatus = .finished(.success)
        }.catch { (error) in
            print(error.localizedDescription)
            self.dataStatus = .finished(.failure(error))
        }
    }
    //MARK:- GetTags
    func GetTags(){
        firstly { () -> Promise<Any> in
            dataStatus = .loading
            return BGServicesManager.CallApi(self.mainServices,Services.tags)
        }.done({ response in
            let result = response as! Response
            //            guard BGNetworkHelper.validateResponse(response: result) else {return}
            var data :  TagsModel = try BGDecoder.decode(data: result.data)
            data.tags?.insert(Tags(id: 0, name: "All"), at: 0)
            DispatchQueue.main.async {
                self.tagsData = data.tags
            }
        }).ensure {
            self.dataStatus = .finished(.success)
        }.catch { (error) in
            print(error.localizedDescription)
            self.dataStatus = .finished(.failure(error))
        }
    }
}
