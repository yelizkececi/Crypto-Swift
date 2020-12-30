//
//  CryptoListTableViewController.swift
//  Crypto
//
//  Created by Yeliz Keçeci on 29.12.2020.
//

import UIKit
import Foundation

class CryptoListTableViewController: UITableViewController {

    private var cryptoListViewModel: CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorArray = [
                UIColor(red: 209/255, green: 203/225, blue: 65/225, alpha: 1.0),
                UIColor(red: 255/255, green: 0/225, blue: 0/225, alpha: 1.0),
                UIColor(red: 104/255, green: 100/225, blue: 208/225, alpha: 1.0),
                UIColor(red: 104/255, green: 127/225, blue: 64/225, alpha: 1.0),
                UIColor(red: 32/255, green: 45/225, blue: 105/225, alpha: 1.0),
                UIColor(red: 87/255, green: 21/225, blue: 224/225, alpha: 1.0)]
        setUp()
    }
    
    private func setUp(){
        WebService().getCryptoList(with: URL.urlForCryptoList()){ cryptos in
            
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptos: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
          return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as? CryptoTableViewCell else {
            fatalError("CryptoTableViewCell not found!")
        }
        
        let cryptoViewModel: CryptoViewModel = CryptoViewModel(cryptoListViewModel.cryptoAtIndex(indexPath.row))
        cell.configure(for: cryptoViewModel)
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil )
    }

}
