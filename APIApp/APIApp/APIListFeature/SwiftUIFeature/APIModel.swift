//
//  APIModel.swift
//  APIApp
//
//  Created by dedeepya reddy salla on 07/06/23.
//

import Foundation

struct APIModel: Hashable, Identifiable, Decodable {
    let id = UUID()
    let API: String
    let Description: String
    let Link: String
}

struct PublicAPIModel: Decodable {
    let entries: [APIModel]
}
