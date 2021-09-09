//
//  AppDelegate.swift
//  ISTestProject
//
//  Created by Umer Maqsood on 6/25/21.
//

import UIKit
import JGProgressHUD
class Utility: NSObject {
    
    static let shared = Utility()
    let apiManager = APIService()

    let hud = JGProgressHUD(style: .light)


    func showLoader(view: UIView){
        hud.indicatorView?.backgroundColor = .clear
        hud.show(in: view)
    }
    func showAlert(msg: String){
        let alert  = UIAlertController(title: "Message", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        showAlertController(alertController: alert)
    }

    private func showAlertController(alertController : UIAlertController){
            (UIApplication.shared.windows.first?.rootViewController as? UINavigationController)?.present(alertController, animated: true, completion: nil)
    }
    
}
