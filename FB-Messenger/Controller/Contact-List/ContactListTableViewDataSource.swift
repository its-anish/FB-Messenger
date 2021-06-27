//
//  ContactListTableViewDataSource.swift
//  FB-Messenger
//
//  Created by Anish Manandhar on 26/06/2021.
//

import Foundation
import UIKit

class ContactListTableViewDataSource<CELL: UITableViewCell, T> : NSObject, UITableViewDataSource {
    private var cellIdentifier: String!
    
    private var items : [T]!
    
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        cell.tag = indexPath.row
        
        return cell
    }
}

