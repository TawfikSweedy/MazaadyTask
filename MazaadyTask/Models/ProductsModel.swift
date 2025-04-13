//
//  ProductsModel.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 12/04/2025.
//

import Foundation

struct ProductsModel : Codable {
    let id : Int?
    let name : String?
    let image : String?
    let price : Int?
    let currency : String?
    let offer : Int?
    let end_date : Double?
}
