//
//  SearchViewIO.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 4/22/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

// View
protocol SearchViewInput: AnyObject {
    
    var searchResults: [ITunesApp] { get set }
    
    func throbber(show: Bool)
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
}

// Presenter
protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    
    func viewDidSelectApp(_ app: ITunesApp)
}
