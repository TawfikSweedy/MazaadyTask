//
//  AdsModel.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 13/04/2025.
//

import Foundation

struct AdsModel : Codable {
    let advertisements : [Advertisements]?
}

struct Advertisements : Codable {
    let id : Int?
    let image : String?
}
