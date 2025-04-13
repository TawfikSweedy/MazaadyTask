//
//  TagsModel.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 13/04/2025.
//

import Foundation

struct TagsModel : Codable {
    var tags : [Tags]?
}

struct Tags : Codable {
    let id : Int?
    let name : String?
}
