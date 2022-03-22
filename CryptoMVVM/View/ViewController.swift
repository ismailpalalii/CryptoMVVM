//
//  ViewController.swift
//  CryptoMVVM
//
//  Created by ismail palali on 22.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.colorArray = [ UIColor(red: 75/255, green: 23/255, blue: 12/255, alpha: 1.0),
                            UIColor(red: 45/255, green: 33/255, blue: 52/255, alpha: 1.0),
                            UIColor(red: 65/255, green: 13/255, blue: 62/255, alpha: 1.0),
                            UIColor(red: 12/255, green: 11/255, blue: 45/255, alpha: 1.0),
                            UIColor(red: 35/255, green: 10/255, blue: 15/255, alpha: 1.0),
                            UIColor(red: 53/255, green: 47/255, blue: 57/255, alpha: 1.0)]
        
        getData()
    }
    
  func getData() {
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrency(url: url) { cryptos in
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListViewModel (crytpoCurrenyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    print(cryptos)
                }
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.currency.text = cryptoViewModel.name
        cell.price.text = cryptoViewModel.price
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }
}

