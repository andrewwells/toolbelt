//
//  ViewController.swift
//  Toolbelt
//
//  Created by andrewwells on 07/25/2018.
//  Copyright (c) 2018 andrewwells. All rights reserved.
//

import UIKit
import ToolbeltUI
import SnapKit

class ListViewController: BaseTableViewController<ListTableViewCell, ListItem> {}
class ListTableViewCell: BaseTableViewCell<ListItem> {
    override var item: ListItem! {
        didSet {
            self.textLabel?.text = item.name
        }
    }
}

struct ListItem {
    let name: String
}

class ViewController: UIViewController {
    
    private lazy var tableViewController: ListViewController = {
        let v = ListViewController()
        v.items = [ListItem(name: "Item 1"), ListItem(name: "Item 2"), ListItem(name: "Item 3")]
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableViewController.tableView)
        tableViewController.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableViewController.tableView.reloadData()
    }

}

