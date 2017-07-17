//
//  VolumeControllerBalance.swift
//  WorstVolumeControllers
//
//  Created by MURAKAMI on 2017/07/12.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

class VolumeControllerBalanceViewController: UIViewController {
    var label: UILabel?
    var seesaw: UIView?
    var ball: UILabel?
    
    let player: MusicPlayerController = MusicPlayerController.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        createVolumeSwitch()
        createVolumeLabel()
    }

    func createVolumeSwitch() {
        let seesawlb: UIView = UIView()
        seesawlb.backgroundColor = .lightGray
        seesawlb.layer.borderWidth = 1.0
        seesawlb.layer.borderColor = UIColor.black.cgColor
        seesawlb.frame = CGRect(x:(self.view.frame.width - 240 ) / 2, y:400, width:240, height:50)
        seesawlb.layer.cornerRadius = 5.0

        let linelb: UILabel = UILabel()
        linelb.frame = CGRect(x:(240 - 200) / 2, y:21, width:200, height:5)
        linelb.layer.cornerRadius = 5.0
        linelb.layer.borderWidth = 3.0
        linelb.layer.borderColor = UIColor.black.cgColor
        linelb.backgroundColor = .black
        seesawlb.addSubview(linelb)
        
        let ballwidth: CGFloat = 20.0
        let balllb: UILabel = UILabel()
        balllb.frame = CGRect(x: seesawlb.frame.width / 2 - ballwidth / 2, y: seesawlb.frame.height / 2 - ballwidth / 2, width: ballwidth, height: ballwidth)
        balllb.backgroundColor = UIColor.white
        balllb.layer.masksToBounds = true
        balllb.layer.cornerRadius = ballwidth / 2
        balllb.layer.borderWidth = 1.0
        balllb.layer.borderColor = UIColor.darkGray.cgColor
        ball = balllb
        seesawlb.addSubview(balllb)
        
        seesaw = seesawlb
        self.view.addSubview(seesawlb)
    }
    
    func createVolumeLabel() {
        label = UILabel()
        if let lb = label {
            lb.text = "Current Volume Level: \(Int(AVAudioSession.sharedInstance().outputVolume * 100)) %"
            lb.textColor = .black
            lb.frame = CGRect(x:(self.view.frame.width - 220 ) / 2, y:100, width:220, height:50)
            self.view.addSubview(lb)
        }
    }
    
    func onTapVolumeswitch(_ sender: UIButton) {
        let intValue: UInt32 = arc4random_uniform(101)
        let floatValue: Float = Float(intValue) / 100
        print(floatValue)
        player.setVolume(floatValue)
        if let lb = label {
            lb.text = "Current Volume Level: \(intValue)%"
        }
    }
}
