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
    lazy var releaseNotesController = AppDetailReleaseNotesController(app: app)
    lazy var screenshotsController = AppDetailScreenshotsController(app: app)
    lazy var scrollView = UIScrollView()
    
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
        
        self.configureScrollView()
        self.addHeaderViewController()
        self.addDescriptionViewController()
        self.addScreenshotsController()
    }
    
    private func configureScrollView() {
        self.view.addSubview(scrollView)

        let bottomInset = (tabBarController?.tabBar.frame.size.height)! + (navigationController?.toolbar.frame.size.height)!
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        scrollView.contentSize = self.view.bounds.size
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        let headerView = self.headerViewController.view!
        self.scrollView.addSubview(headerView)
        headerViewController.didMove(toParent: self)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            headerView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            headerView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
        ])
    }
    
    private func addDescriptionViewController() {
        self.addChild(releaseNotesController)
        let releaseNotesView = releaseNotesController.view!
        self.scrollView.addSubview(releaseNotesView)
        releaseNotesController.didMove(toParent: self)
        
        releaseNotesView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            releaseNotesView.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            releaseNotesView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            releaseNotesView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
        ])
    }
    
    private func addScreenshotsController() {
        self.addChild(screenshotsController)
        let screenshotsView = screenshotsController.view!
        self.scrollView.addSubview(screenshotsView)
        screenshotsController.didMove(toParent: self)
        
        screenshotsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenshotsView.topAnchor.constraint(equalTo: self.releaseNotesController.view.bottomAnchor),
            screenshotsView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            screenshotsView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            screenshotsView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
