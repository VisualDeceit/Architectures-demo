//
//  UIImage+extension.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 27.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

extension UIImage {
    func getCropRatio() -> CGFloat {
        return  CGFloat( self.size.height / self.size.width )
    }
}
