//
//  ApiBitcoinViewController.swift
//  PriceBitcoin
//
//  Created by Renato Vieira on 6/18/21.
//

import UIKit

class ApiBitcoinViewController: UIViewController {
    
    func retrieveDataApi(view: PriceBitcoinViewController) {        
        guard let url = URL(string: "https://blockchain.info/pt/ticker") else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: {(data, request, error) in
            if let dataResponse = data {
                do {
                    let objectJson = try JSONSerialization.jsonObject(with: dataResponse, options: []) as! [String: Any]
                        if let brl = objectJson["BRL"] as? [String: Any] {
                            if let buyPrice = brl["buy"] as? Double {
                                self.updatePriceBitCoin(view: view, buyPrice: buyPrice)
                            }
                       }
                } catch {
                    print(error.localizedDescription)
                }
            }
        })
        .resume()
    }
    
    func updatePriceBitCoin(view: PriceBitcoinViewController, buyPrice: Double) {
        let formattedPrice = formatPrice(price: NSNumber(value: buyPrice))
        
        DispatchQueue.main.async(execute: {
            view.updatedPriceBitCoinLabel(price: formattedPrice)
            view.updatedButton.setTitle("Atualizar", for: .normal)
        })
    }
    
    func formatPrice(price: NSNumber) -> String {
        let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.locale      = Locale(identifier: "pt_BR")
        
        if let price = numberFormatter.string(from: price) {
            return price
        }
        
        return "0,00"
    }
}
