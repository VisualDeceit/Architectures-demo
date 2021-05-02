//
//  AudioPlayerViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 02.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AudioPlayerViewController: UIViewController {
    
    let viewModel: AudioPlayerViewModel
    
    public var songModel: SongCellModel? {
        didSet {
            self.viewModel.setSongModel(songModel: songModel!)
        }
    }
    
    private var maxTime: Int {
        (songModel?.trackTime ?? 0) / 1000
    }
    
    private var audioPlayerView: AudioPlayerView{
        return self.view as! AudioPlayerView
    }
    
    init(viewModel: AudioPlayerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        configureUI()
        setupBindings()
        
        audioPlayerView.onButtonPress = { [weak self] (button) in
            guard let self = self else { return }
            switch button.tag {
            case 0: //play pause
                self.viewModel.playSong()
            case 1: // forward
                self.viewModel.fastForward()
            case 2: //backward
                self.viewModel.fastBackward()
            default:
                break
            }
        }
    }
    
    override func loadView() {
        self.view = AudioPlayerView()
    }
    
    private func configureUI() {
        audioPlayerView.artImageView.image = self.songModel?.artwork
        audioPlayerView.artistLabel.text = self.songModel?.artist
        audioPlayerView.trackLabel.text = self.songModel?.track
        audioPlayerView.setTrackTime(time: 0, maxTime: maxTime)
    }
    
    private func setupBindings() {
        self.viewModel.$progress.addObserver(self) { (progress, _) in
            self.audioPlayerView.trackProgressBar.setProgress(Float(progress), animated: true)
        }
        self.viewModel.$isPaused.addObserver(self) { (isPaused, _) in
            self.audioPlayerView.setPlayButton(isPaused)
        }
        self.viewModel.$currentTime.addObserver(self) { (time, _) in
            self.audioPlayerView.setTrackTime(time: time, maxTime: self.maxTime)
        }
        
    }
}
