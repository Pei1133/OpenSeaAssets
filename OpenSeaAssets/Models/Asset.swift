//
//  Asset.swift
//  OpenSeaCollection
//
//  Created by PeiChun on 2022/2/23.
//

import Foundation

struct AssetList: Codable {
    let assets: [Asset]
}

struct Asset: Hashable, Codable {
    let image_url: URL?
    let name: String
    let collection: Collection?
    var description: String?
    let permalink: URL?
}

struct Collection: Hashable, Codable {
    let name: String?
}
