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

        let searchService = ITunesSearchService()
        let router = SearchSongRouter()
        let presenter = SearchSongPresenter()
        presenter.router = router
        
        let interactor = SearchSongInteractor(searchService: searchService, output: presenter)
        presenter.interactor = interactor
        
        let viewController = SearchSongViewController(output: presenter)
        presenter.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}
