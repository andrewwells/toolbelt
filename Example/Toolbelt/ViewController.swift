//
//  ViewController.swift
//  Toolbelt
//
//  Created by andrewwells on 07/25/2018.
//  Copyright (c) 2018 andrewwells. All rights reserved.
//

import UIKit
import ToolbeltUI
import Toolbelt
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
    
    private let items = ["Buttons"]
    
    private lazy var tableViewController: ListViewController = {
        let v = ListViewController()
        v.items = self.items.map { ListItem(name: $0) }
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewController.didSelectRow = { [weak self] indexPath in
            self?.tableViewController.tableView.deselectRow(at: indexPath, animated: true)
            switch indexPath.row {
            case 0:
                Log.d("launch buttons")
                self?.navigationController?.pushViewController(ButtonsViewController(), animated: true)
            default: break
            }
        }
        
        view.addSubview(tableViewController.tableView)
        tableViewController.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(64, 0, 20, 0))
        }
        tableViewController.tableView.reloadData()
    }

}

