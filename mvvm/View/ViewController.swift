//
//  ViewController.swift
//  mvvm
//
//  Created by Büşra Kocakuşaklı on 25.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
            UIColor(red: 255/255, green: 204/255, blue: 204/255, alpha: 1.0),
            UIColor(red: 255/255, green: 153/255, blue: 153/255, alpha: 1.0),
            UIColor(red: 255/255, green: 204/255, blue: 53/255, alpha: 1.0),
            UIColor(red: 255/255, green: 229/255, blue: 204/255, alpha: 1.0),
            UIColor(red: 229/255, green: 204/255, blue: 255/255, alpha: 1.0),
            UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 1.0),
        ]
        
        getData()
        
    
    }
    
    private func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
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
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]

        return cell
    }
    
    }

