//
//  Extension.swift
//  LoginApp
//
//  Created by sindija.dzintare on 07/09/2020.
//  Copyright © 2020 sindija.dzintare. All rights reserved.
//

import UIKit

extension UIViewController{
    func warningPopUP(withTitle title: String?, withMessage message: String?) {
        DispatchQueue.main.async {
        
        let popUP = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        popUP.addAction(okButton)
        self.present(popUP, animated: true)
    }
    }}
