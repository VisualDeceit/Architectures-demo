//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 25.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

struct SongCellModel {
    let artist: String
    let track: String?
    let album: String?
    let artwork: UIImage?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong, on completion: @escaping (SongCellModel) -> ()) {
        let imageDownloder = ImageDownloader()
        
        if let url = URL(string: model.artwork ?? "") {
            imageDownloder.getImage(fromUrl: url) { (image, _) in
                let songCellModel =  SongCellModel(artist: model.artistName ?? "none",
                                                   track: model.trackName,
                                                   album: model.collectionName ?? "none",
                                                   artwork: image)
                completion(songCellModel)
            }
        }
    }
}
