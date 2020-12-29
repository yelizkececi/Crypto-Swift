//
//  URL+Extensions.swift
//  Crypto
//
//  Created by Yeliz Keçeci on 29.12.2020.
//

import Foundation
import UIKit

extension URL {
    
    static func urlForCryptoList() -> URL {
        return URL(string: Constans.URLs.cryptoList)!
    }
}
