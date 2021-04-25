//
//  SearchAppAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 4/22/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum SearchAppAssembly {
    static func build() -> UIViewController {
        let presenter = SearchAppPresenter()
        let viewController = SearchAppViewController(output: presenter)
        presenter.view = viewController
        return viewController
    }
}
