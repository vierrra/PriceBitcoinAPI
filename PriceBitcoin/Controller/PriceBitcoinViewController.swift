//
//  PriceBitcoinViewController..swift
//  PriceBitcoin
//
//  Created by Renato Vieira on 6/18/21.
//

import UIKit

class PriceBitcoinViewController: UIViewController {
    
    @IBOutlet weak var priceBitCoinLabel: UILabel!
    @IBOutlet weak var updatedButton:     UIButton!
    
    let requestApi = ApiBitcoinViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func updateActionButton(_ sender: Any) {
        self.updatedButton.setTitle("Atualizando...", for: .normal)
        self.requestApi.retrieveDataApi(view: self)
    }
    
    func updatedPriceBitCoinLabel(price: String) {
        self.priceBitCoinLabel.text = "R$\(price)" 
    }
}

