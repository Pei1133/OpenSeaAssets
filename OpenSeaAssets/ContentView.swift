//
//  ContentView.swift
//  OpenSeaAssets
//
//  Created by PeiChun on 2022/2/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var model = OpenSeaModel()
    private var columnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnGrid) {
                ForEach(model.assets, id: \.self) { asset in
                    VStack {
                        WebImage(url: (asset.image_url ?? URL(string: "")))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                        Text("\(asset.name)")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
