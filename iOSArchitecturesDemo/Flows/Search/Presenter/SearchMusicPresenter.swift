//
//  SearchMusicPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 25.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchMusicPresenter: SearchMusicViewOutput {

    private let searchService = ITunesSearchService()
    
    weak var view: (SearchMusicViewInput & UIViewController)!
    
    func viewDidSearch(with query: String) {
        requestMusic(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        
    }
    
    // MARK: - Private
    private func requestMusic(with query: String) {
        self.view.throbber(show: true)
        self.view.searchResults = []
        
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.view.throbber(show: false)
            result
                .withValue { music in
                    guard !music.isEmpty else {
                        self.view.searchResults = []
                        self.view.showNoResults()
                        return
                    }
                    self.view.hideNoResults()
                    self.view.searchResults = music
                }
                .withError {
                    self.view.showError(error: $0)
                }
        }
    }
}
