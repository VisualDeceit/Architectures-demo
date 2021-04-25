//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 25.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let artist: String
    let track: String?
    let album: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(artist: model.artistName ?? model.trackName,
                             track: model.trackName,
                             album: model.collectionName ?? "Single")
    }
}
