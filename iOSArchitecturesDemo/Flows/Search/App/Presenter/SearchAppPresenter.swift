//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 4/22/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchAppPresenter: SearchAppViewOutput {
    
    private let searchService = ITunesSearchService()
    
    weak var view: (UIViewController & SearchAppViewInput)!
    
    func viewDidSearch(with query: String) {
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController()
        appDetaillViewController.app = app
        view.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
    
    // MARK: - Private
    
    private func requestApps(with query: String) {
        self.view.throbber(show: true)
        self.view.searchResults = []
        
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.view.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.view.searchResults = []
                        self.view.showNoResults()
                        return
                    }
                    self.view.hideNoResults()
                    self.view.searchResults = apps
                }
                .withError {
                    self.view.showError(error: $0)
                }
        }
    }
}
