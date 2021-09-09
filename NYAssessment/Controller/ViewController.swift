//  ViewController.swift
//  NYAssessment
//
//  Created by Umer Maqsood on 9/8/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let controller:HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeView") as? HomeViewController  else{
                return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

