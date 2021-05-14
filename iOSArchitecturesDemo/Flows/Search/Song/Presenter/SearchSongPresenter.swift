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
    
    func viewDidSelectSong(_ songModel: SongCellModel) {
        self.router.openPlayer(for: songModel)
    }
}

extension SearchSongPresenter: SearchSongInteractorOutput {
    
    func searchFinished(with songs: [ITunesSong]) {
        self.view.throbber(show: false)
        guard !songs.isEmpty else {
            self.view.viewModels = []
            self.view.showNoResults()
            return
        }
        self.view.hideNoResults()
        self.makeViewModels(from: songs)
    }
    
    func searchFinished(with error: Error) {
        self.view.throbber(show: false)
        self.view.showError(error: error)
    }
    
    private func makeViewModels(from songs: [ITunesSong]) {
        let dispatchGroup = DispatchGroup()
        var result =  [SongCellModel]()
        songs.forEach { (song) in
            dispatchGroup.enter()
            SongCellModelFactory.cellModel(from: song) { (model) in
                result.append(model)
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
                self.view.viewModels = result
        }
    }
}
