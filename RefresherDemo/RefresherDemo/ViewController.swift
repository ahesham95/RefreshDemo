//
//  ViewController.swift
//  RefresherDemo
//
//  Created by Amr Hesham on 12/8/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
let network = Network()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        network.updateToken()
        // Do any additional setup after loading the view.
    }


}

