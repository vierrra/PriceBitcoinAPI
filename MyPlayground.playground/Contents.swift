import UIKit
import Foundation

let number = NSNumber(1000.20)
let nf = NumberFormatter()
nf.numberStyle = .decimal
nf.locale = Locale(identifier: "pt_BR")

nf.decimalSeparator = ","

if let resultado = nf.string(from: number) {
    
    print(resultado)
}


