//
//  AssetDetailView.swift
//  OpenSeaAssets
//
//  Created by PeiChun on 2022/2/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct AssetDetailView: View {
    var asset: Asset
    init(asset: Asset) {
        self.asset = asset
    }
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    WebImage(url: (asset.image_url ?? URL(string: "")))
                        .resizable()
                        .scaledToFit()
                    Text(asset.name)
                    Text(asset.description ?? "")
                }
            }
            if let url = asset.permalink {
                Link(destination: url, label: {
                    Text("permalink")
                })
            }
        }
        .navigationTitle(asset.collection?.name ?? "")
    }
}
