// Copyright © 2021 Encrypted Ink. All rights reserved.

import Foundation

enum EthereumChain: Int {
    case ethereum = 1
    case arbitrum = 42161
    case polygon = 137
    case optimism = 10
    case binance = 56
    case avalanche = 43114
    case xDai = 100
    
    // Testnets
    case arbitrumRinkeby = 421611
    case arbitrumKovan = 144545313136048
    case optimisticKovan = 69
    case ethereumRopsten = 3
    case ethereumKovan = 42
    case ethereumRinkeby = 4
    case ethereumGoerli = 5
    case polygonMumbai = 80001
    case binanceTestnet = 97
    case avalancheFuji = 43113
    
    var id: Int {
        return rawValue
    }
    
    var hexStringId: String {
        return "0x" + String(id, radix: 16, uppercase: false)
    }
    
    static let allMainnets: [EthereumChain] = [.ethereum, .polygon, .optimism, .binance, .arbitrum, .avalanche, .xDai]
    static let allTestnets: [EthereumChain] = [.ethereumRopsten, .ethereumKovan, .ethereumRinkeby, .ethereumGoerli, .optimisticKovan, .arbitrumKovan, .arbitrumRinkeby, .polygonMumbai, .binanceTestnet, .avalancheFuji]
    
    var name: String {
        switch self {
        case .ethereum: return "Ethereum"
        case .arbitrum: return "Arbitrum"
        case .optimism: return "Optimism"
        case .polygon: return "Polygon"
        case .binance: return "Binance Smart Chain"
        case .avalanche: return "Avalanche"
        case .xDai: return "xDai"
        case .arbitrumRinkeby: return "Arbitrum Rinkeby"
        case .optimisticKovan: return "Optimistic Kovan"
        case .ethereumGoerli: return "Ethereum Görli"
        case .polygonMumbai: return "Polygon Mumbai"
        case .ethereumRopsten: return "Ethereum Ropsten"
        case .ethereumKovan: return "Ethereum Kovan"
        case .ethereumRinkeby: return "Ethereum Rinkeby"
        case .arbitrumKovan: return "Arbitrum Kovan"
        case .binanceTestnet: return "BSC Testnet"
        case .avalancheFuji: return "Avalanche FUJI"
        }
    }
    
    var symbol: String {
        switch self {
        case .binance, .binanceTestnet:
            return "BNB"
        case .polygon, .polygonMumbai:
            return "MATIC"
        case .arbitrum, .arbitrumKovan, .arbitrumRinkeby, .ethereum, .ethereumGoerli, .ethereumKovan, .ethereumRinkeby, .optimism, .optimisticKovan, .ethereumRopsten:
            return "ETH"
        case .avalanche, .avalancheFuji:
            return "AVAX"
        case .xDai:
            return "xDai"
        }
    }
    
    var hasUSDPrice: Bool {
        switch self {
        case .ethereum, .optimism:
            return true
        default:
            return false
        }
    }
    
    var nodeURLString: String {
        switch self {
        case .ethereum: return "https://mainnet.infura.io/v3/3f99b6096fda424bbb26e17866dcddfc"
        case .arbitrum: return "https://arb-mainnet.g.alchemy.com/v2/" + Secrets.alchemy
        case .optimism: return "https://mainnet.optimism.io"
        case .polygon: return "https://polygon-mainnet.g.alchemy.com/v2/" + Secrets.alchemy
        case .binance: return "https://bsc-dataseed.binance.org/"
        case .avalanche: return "https://api.avax.network/ext/bc/C/rpc"
        case .xDai: return "https://rpc.xdaichain.com/"
        case .arbitrumRinkeby: return "https://rinkeby.arbitrum.io/rpc"
        case .arbitrumKovan: return "https://kovan5.arbitrum.io/rpc"
        case .optimisticKovan: return "https://kovan.optimism.io"
        case .polygonMumbai: return "https://polygon-mumbai.g.alchemy.com/v2/" + Secrets.alchemy
        case .ethereumRopsten: return "https://ropsten.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161"
        case .ethereumKovan: return "https://eth-kovan.alchemyapi.io/v2/" + Secrets.alchemy
        case .ethereumRinkeby: return "https://eth-rinkeby.alchemyapi.io/v2/" + Secrets.alchemy
        case .ethereumGoerli: return "https://eth-goerli.alchemyapi.io/v2/" + Secrets.alchemy
        case .binanceTestnet: return "https://data-seed-prebsc-1-s1.binance.org:8545/"
        case .avalancheFuji: return "https://api.avax-test.network/ext/bc/C/rpc"
        }
    }
    
}
