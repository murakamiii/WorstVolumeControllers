//
//  VolumeControllerViewController.swift
//  WorstVolumeControllers
//
//  Created by MURAKAMI on 2017/07/09.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation
import UIKit

class VolumeControllerViewController: UIViewController {
    var soundController: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
