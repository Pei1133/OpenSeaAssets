//
//  EthBalance.swift
//  OpenSeaAssets
//
//  Created by PeiChun on 2022/2/26.
//

import Foundation

struct EthBalance: Hashable, Codable {
    let jsonrpc: String
    let result: String // hex format value in Wei
}

extension EthBalance {
    var ethBalance: Double {
        // 1 Ether = 1000000000000000000 Wei
        return (Double(result) ?? 0) * pow(10, -18)
    }
}
