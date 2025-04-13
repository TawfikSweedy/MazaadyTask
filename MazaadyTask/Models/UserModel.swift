//
//  UserModel.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 12/04/2025.
//

import Foundation

struct UserModel : Codable {
    let id : Int?
    let name : String?
    let image : String?
    let user_name : String?
    let following_count : Int?
    let followers_count : Int?
    let country_name : String?
    let city_name : String?
}
