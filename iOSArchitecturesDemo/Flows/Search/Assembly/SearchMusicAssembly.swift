//
//  SearchMusicAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 25.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum SearchMusicAssembly {
    static func build() -> UIViewController {
        let presenter = SearchMusicPresenter()
        let viewController = SearchMusicViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
