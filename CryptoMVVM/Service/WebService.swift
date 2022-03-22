//
//  WebService.swift
//  CryptoMVVM
//
//  Created by ismail palali on 22.03.2022.
//

import Foundation

class WebService {
    
    func downloadCurrency(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
            
                let cryptolist = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryptolist)
                
                if let cryptoList = cryptolist {
                    completion(cryptolist)
                }
                
            }
            
        }.resume()
        
    }
}
