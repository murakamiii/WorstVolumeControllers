//
//  VolumeControllerViewController.swift
//  WorstVolumeControllers
//
//  Created by MURAKAMI on 2017/07/09.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

class VolumeControllerViewController: UIViewController {
    var label: UILabel?
    let mpController: MusicPlayerController = MusicPlayerController.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        createVolumeSwitch()
        createVolumeLabel()
        setSystemVoiceObserver()
    }
    
    func setSystemVoiceObserver() {
        let audioSession: AVAudioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSessionCategoryAmbient)
        try! audioSession.setActive(true)
        
        audioSession.addObserver(self, forKeyPath: "outputVolume", options: .new, context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let audioSession: AVAudioSession = AVAudioSession.sharedInstance()
        audioSession.removeObserver(self, forKeyPath: "outputVolume", context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "outputVolume", let change = change, let newKey = change[.newKey] as? Float {
            let i: UInt32 = UInt32(newKey * 100)
            setVolumeLabelText(i)
        }
    }
    
    func createVolumeSwitch() {
        let button: UIButton = UIButton()
        button.setTitle("Change", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.frame = CGRect(x:(self.view.frame.width - 220 ) / 2, y:400, width:220, height:50)
        button.addTarget(self, action: #selector(self.onTapVolumeswitch(_:)), for: .touchDown)
        
        self.view.addSubview(button)
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
        let floatValue: Float = Float(intValue) / 101
        mpController.setVolume(floatValue)
    }
    
    func setVolumeLabelText(_ intValue: UInt32) {
        if let lb = label {
            lb.text = "Current Volume Level: \(intValue)%"
        }
    }
}
