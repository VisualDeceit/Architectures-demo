//
//  SearchSongViewIO.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 25.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

// View
protocol SearchSongViewInput {
    var searchResults: [ITunesSong] { get set }
    
    func throbber(show: Bool)
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
}

//Presenter
protocol SearchSongViewOutput {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ song: ITunesSong)
}
