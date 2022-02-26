//
//  AssetViewModel.swift
//  OpenSeaAssets
//
//  Created by PeiChun on 2022/2/23.
//

import Foundation

class AssetViewModel: ObservableObject {
    @Published var assets: [Asset] = []
    @Published var balance: String = "List"
    @Published var isLoading = true
    private var currentPage: Int = 0
    
    func getAssets() {
        self.isLoading = true
        NetworkServiceProvider.shared.request(service: OpenSeaAPI.assets(currentPage: currentPage, limit: 20)) { [weak self] (result) in
            switch result {
            case .success(let response):
                guard let list = try? JSONDecoder().decode(AssetList.self, from: response.data) else {
                    return
                }
                self?.assets.append(contentsOf: list.assets)
                self?.currentPage += list.assets.count
            case .error(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    func getEthereumBalance() {
        NetworkServiceProvider.shared.request(service: EthereumAPI.getBalance()) { [weak self] (result) in
            switch result {
            case .success(let response):
                guard let ethAccount = try? JSONDecoder().decode(EthBalance.self, from: response.data) else {
                    return
                }
                self?.balance = "Balance: \(ethAccount.ethBalance) ETH"
            case .error(let error):
                print(error)
            }
        }
    }
}
