//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 25.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchSongPresenter: SearchSongViewOutput {
    
    weak var view: (SearchSongViewInput & UIViewController)!
    
    var router: SearchSongRouterInput!
    var interactor: SearchSongInteractorInput!
    
    func viewDidSearch(with query: String) {
        self.interactor.search(by: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        self.router.openPlayer(for: song)
    }
}

extension SearchSongPresenter: SearchSongInteractorOutput {
    
    func searchFinished(with song: [ITunesSong]) {
        self.view.throbber(show: false)
        guard !song.isEmpty else {
            self.view.searchResults = []
            self.view.showNoResults()
            return
        }
        self.view.hideNoResults()
        self.view.searchResults = song
    }
    
    func searchFinished(with error: Error) {
        self.view.throbber(show: false)
        self.view.showError(error: error)
    }
}
