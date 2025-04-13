//
//  DataState.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 12/04/2025.
//

import Foundation


enum DataState{
    case loading
    case finished(Outcome)
        
    enum Outcome {
        case failure(Error)
        case success
    }
}
