//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 25.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchSongPresenter: SearchSongViewOutput {

    private let searchService = ITunesSearchService()
    
    weak var view: (SearchSongViewInput & UIViewController)!
    
    func viewDidSearch(with query: String) {
        requestSongs(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
       //пока не обрабатываем
    }
    
    // MARK: - Private
    private func requestSongs(with query: String) {
        self.view.throbber(show: true)
        self.view.searchResults = []
        
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.view.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.view.searchResults = []
                        self.view.showNoResults()
                        return
                    }
                    self.view.hideNoResults()
                    self.view.searchResults = songs
                }
                .withError {
                    self.view.showError(error: $0)
                }
        }
    }
}
