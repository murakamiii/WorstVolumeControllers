//
//  MusicPlayerController.swift
//  WorstVolumeControllers
//
//  Created by MURAKAMI on 2017/07/09.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation
import MediaPlayer

final class MusicPlayerController {
    let player: MPMusicPlayerController
    private init() {
        player = MPMusicPlayerController.applicationMusicPlayer()
        player.setQueue(with: MPMediaQuery.songs())
        player.repeatMode = .all
        player.play()
    }
    static let sharedInstance = MusicPlayerController()
    
    func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        if let view = volumeView.subviews.first as? UISlider {
            view.value = volume
        }
    }
}
