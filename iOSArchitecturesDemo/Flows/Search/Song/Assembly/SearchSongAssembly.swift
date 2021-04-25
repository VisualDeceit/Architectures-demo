//
//  SearchSongAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 25.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum SearchSongAssembly {
    static func build() -> UIViewController {
        let presenter = SearchSongPresenter()
        let viewController = SearchSongViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
