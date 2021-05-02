//
//  AudioPlayerAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 02.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum AudioPlayerAssembly {
    static func build() -> UIViewController {
        let viewModel = AudioPlayerViewModel()
        let viewController = AudioPlayerViewController(viewModel: viewModel)
        viewModel.view = viewController
        return viewController
    }
}
