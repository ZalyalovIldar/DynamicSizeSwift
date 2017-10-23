
//
//  FollowersTableViewController.swift
//  VK
//
//  Created by Elina on 18/09/2017.
//  Copyright © 2017 Elina. All rights reserved.
//

import UIKit

class FollowersTableViewController: UITableViewController {
    
    fileprivate var rowAtHeight: CGFloat = 100
    fileprivate var iosIconImage = UIImage(assetName: .iosIcon)
    
    var users: [User] = [User(name: "Элина", surname: "Батырова", avatar: UIImage.init(named: "Elina")!, photos: [UIImage.init(named: "heart")!], status: "online (моб.)", profile: [] ), User(name: "Эльвира", surname: "Батырова", avatar: UIImage.init(named: "Elvira")!, photos: [UIImage.init(named: "heart")!], status: "online", profile: [] ), User(name: "Айгуль", surname: "Ризатдинова", avatar: UIImage.init(named: "Information")!, photos: [UIImage.init(named: "heart")!], status: "offline", profile: [])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupRefreshControl()
        setupNavigationBar()
        
        cellsRegister()
    }
    
    func cellsRegister() {
        let nib = UINib(nibName: .followersCellNibName)
        tableView.register(nib, forCellReuseIdentifier: Identifiers.cellIdentifier.rawValue)
    }
    
    func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTableView(sender:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func refreshTableView(sender: UIRefreshControl) {
        
        if users.count > 0 {
        
        users[users.count - 1].avatar = iosIconImage!
        }
        
        tableView.reloadData()
        
        sender.endRefreshing()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.cellIdentifier.rawValue, for: indexPath) as! CustomFollowersTableViewCell
        
        let model = users[indexPath.row]
        
        cell.prepareCell(with: model)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowAtHeight
    }
}

