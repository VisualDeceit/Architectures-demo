//
//  AudioPlayerViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 02.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AudioPlayerViewController: UIViewController {

    public var song: ITunesSong?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
    }
    
    override func loadView() {
        self.view = AudioPlayerView()
    }
}
