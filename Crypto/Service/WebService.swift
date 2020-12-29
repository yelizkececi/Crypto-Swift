//
//  WebService.swift
//  Crypto
//
//  Created by Yeliz Keçeci on 22.12.2020.
//

import Foundation

class WebService {
    func getCryptoList(with url:URL, completion: @escaping([CryptoCurrency]?) ->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do{
                    let cryptoList = try JSONDecoder().decode([CryptoCurrency].self, from: data)
                    completion(cryptoList)
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
    }
}
