//
//  CryptoListViewModel.swift
//  Crypto
//
//  Created by Yeliz Keçeci on 29.12.2020.
//

import Foundation

struct CryptoListViewModel {
    let cryptos: [CryptoCurrency]
}

extension CryptoListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.cryptos.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoCurrency  {
        let cryptoCurrency = cryptos[index].currency
        let cryptoPrice = cryptos[index].price
        return CryptoCurrency(currency: cryptoCurrency, price: cryptoPrice)
    }
}

struct CryptoViewModel {
    private let crypto: CryptoCurrency
    
    var currency: String {
        return self.crypto.currency
    }
    
    var price: String {
        return self.crypto.price
    }
    
    init(_ crypto: CryptoCurrency) {
        self.crypto = crypto
    }
}
