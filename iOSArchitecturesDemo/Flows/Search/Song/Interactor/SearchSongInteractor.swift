//
//  SearchSongInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 02.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol SearchSongInteractorInput: AnyObject {
    func search(by query: String)
}

protocol SearchSongInteractorOutput: AnyObject {
    func searchFinished(with songs: [ITunesSong])
    func searchFinished(with error: Error)
}

class SearchSongInteractor: SearchSongInteractorInput {
    
    let searchService: ITunesSearchService
    weak var output: SearchSongInteractorOutput!
    
    init(searchService: ITunesSearchService, output: SearchSongInteractorOutput) {
        self.searchService = searchService
        self.output = output
    }
    
    // MARK: - SearchInteractorInput
    
    func search(by query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            
            result
                .withValue { song in
                    self.output.searchFinished(with: song)
                }
                .withError {
                    self.output.searchFinished(with: $0)
                }
        }
    }
}
