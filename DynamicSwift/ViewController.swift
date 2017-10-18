//
//  ViewController.swift
//  DynamicSwift
//
//  Created by Ildar Zalyalov on 16.10.2017.
//  Copyright © 2017 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate let cellIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        if indexPath.row / 2 == 0 {
            cell.configureCell(with: UIImage(named: "1")!, title: "textasdasd", subtitile: "sakdasdlm;samkd", text: "")
        } else {
             cell.configureCell(with: UIImage(named: "1")!, title: "textasdasd", subtitile: "sakdasdlm;samkd", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")
        }
        
        return cell
    }
}

