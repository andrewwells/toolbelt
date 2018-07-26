//
//  BaseTableViewController.swift
//  Toolbelt
//
//  Created by Andrew Wells on 7/25/18.
//

import UIKit

open class BaseTableViewController<T: BaseTableViewCell<U>, U>: UITableViewController {
    
    let cellIdentifier = "BaseTableViewCell"
    
    public var items = [U]()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BaseTableViewCell<U>
        cell.item = items[indexPath.row]
        return cell
    }
    
}
