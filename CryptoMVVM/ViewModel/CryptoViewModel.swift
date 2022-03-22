//
//  CryptoViewModel.swift
//  CryptoMVVM
//
//  Created by ismail palali on 22.03.2022.
//

import Foundation

struct CryptoListViewModel {
    let crytpoCurrenyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.crytpoCurrenyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.crytpoCurrenyList[index]
        return CryptoViewModel(cryptoCurreny: crypto)
        
    }
    
}

struct CryptoViewModel {
    let cryptoCurreny : CryptoCurrency
    
    var name : String {
        return self.cryptoCurreny.currency
    }
    
    var price : String {
        return self.cryptoCurreny.price
    }
}


