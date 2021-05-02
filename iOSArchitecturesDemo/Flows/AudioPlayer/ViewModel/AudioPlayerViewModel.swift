//
//  AudioPlayerViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 02.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AudioPlayerViewModel {
    
    private var songModel: SongCellModel?
    private var timer: Timer!
    private var maxTime: Int {
        (songModel?.trackTime ?? 0) / 1000
    }
    
    @Observable private(set) var currentTime: Int = 0
    @Observable private(set) var isPaused = true
    @Observable private(set) var progress: Double = 0
    
    weak var view: UIViewController!
    
    func setSongModel(songModel: SongCellModel) {
        self.songModel = songModel
    }
    
    func playSong() {
        if isPaused {
            timer = Timer(timeInterval: 1, repeats: true) {[weak self] (t) in
                guard let self = self else { return }
                self.currentTime += 1
                self.progress = Double(self.currentTime) / Double(self.maxTime)
                if self.currentTime >= self.maxTime {
                    t.invalidate()
                    self.isPaused = true
                }
            }
            RunLoop.main.add(timer, forMode: .common)
            isPaused = false
        } else {
            timer.invalidate()
            isPaused = true
        }
    }
    
    func fastForward() {
        currentTime += 15
        if currentTime > maxTime {
            currentTime = maxTime
            isPaused = true
        }
        self.progress = Double(currentTime) / Double(maxTime)
    }
    
    func fastBackward() {
        self.currentTime -= 15
        if currentTime < 0 {
            currentTime = 0
        }
        self.progress = Double(currentTime) / Double(maxTime)
    }
}
