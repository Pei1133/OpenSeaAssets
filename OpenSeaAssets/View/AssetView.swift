//
//  ContentView.swift
//  OpenSeaAssets
//
//  Created by PeiChun on 2022/2/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct AssetView: View {
    @ObservedObject var model = OpenSeaModel()
    private var columnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columnGrid) {
                    ForEach(model.assets, id: \.self) { asset in
                        NavigationLink {
                            AssetDetailView(asset: asset)
                        } label: {
                            VStack {
                                WebImage(url: (asset.image_url ?? URL(string: "")))
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                Text("\(asset.name)")
                            }.onAppear {
                                if asset == model.assets.last {
                                    model.getAssets()
                                }
                            }
                        }
                    }
                }
                if model.isLoading {
                    ProgressView()
                        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                }
            }.onAppear() {
                model.getAssets()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
