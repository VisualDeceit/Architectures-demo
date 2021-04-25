//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp?
    
    lazy var headerViewController = AppDetailHeaderViewController(app: app)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        self.addHeaderViewController()
        self.addDescriptionViewController()
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        let headerView = self.headerViewController.view!
        self.view.addSubview(headerView)
        headerViewController.didMove(toParent: self)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
    
    private func addDescriptionViewController() {
        // ДЗ, сделать свой контроллер
        let descriptionViewController = UIViewController()
        
        self.addChild(descriptionViewController)
        let descriptionView = descriptionViewController.view!
        self.view.addSubview(descriptionView)
        descriptionViewController.didMove(toParent: self)
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            descriptionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            descriptionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
}
