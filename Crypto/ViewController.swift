//
//  ViewController.swift
//  Crypto
//
//  Created by Yeliz Keçeci on 21.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        WebService().downloadCurrencies(url: url) { (cryptoList) in
//            if let cry
//            print(cryptoList as Any)
//        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CyrptoCell", for: indexPath) as! CryptoTableViewCell 
        return cell
    }
}
