//
//  OpenSeaModel.swift
//  OpenSeaAssets
//
//  Created by PeiChun on 2022/2/23.
//

import Foundation

class OpenSeaModel: ObservableObject {
    @Published var assets: [Asset] = []
    @Published var isLoading = true
    
    func getAssets() {
        NetworkServiceProvider.shared.request(service: OpenSeaAPI.assets(currentPage: 0, limit: 20)) { [weak self] (result) in
        self.isLoading = true
            switch result {
            case .success(let response):
                guard let list = try? JSONDecoder().decode(AssetList.self, from: response.data) else {
                    return
                }
                self?.assets = list.assets
            case .error(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

}
