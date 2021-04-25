//
//  SearchAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 4/22/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum SearchAssembly {
    static func build() -> UIViewController {
        let presenter = SearchPresenter()
        let viewController = SearchViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
