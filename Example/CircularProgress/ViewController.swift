//
//  ViewController.swift
//  CircularProgress
//
//  Created by Muhammad Umer on 07/02/2017.
//  Copyright (c) 2017 Muhammad Umer. All rights reserved.
//

import UIKit
import CircularProgress

class ViewController: UIViewController {

    @IBOutlet var circularProgress: CircularProgress!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        circularProgress.animatePie()
    }

}

