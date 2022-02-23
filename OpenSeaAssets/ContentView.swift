//
//  ContentView.swift
//  OpenSeaAssets
//
//  Created by PeiChun on 2022/2/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = OpenSeaModel()
    private var columnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnGrid) {
                ForEach(model.assets, id: \.self) { asset in
                    VStack {
                        AsyncImage(url: (asset.image_url ?? URL(string: ""))){ image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .cornerRadius(10)
                        Text("\(asset.name)")
                    }
                }
            }.onAppear() {
                model.getAssets()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
