//
//  MessagesViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/11/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class MessagesViewController : UIViewController {
  
  @IBOutlet weak var messagesTable: UITableView!
  
  let cellIdentifier = "MessageCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()

    initMessageTable()
  }
  
  func initMessageTable() {
    
    messagesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    messagesTable.reloadData()
  }
  
  
}

extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  5//posts.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 100
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)! as UITableViewCell
    
    cell.textLabel?.text = "kyky"//posts[indexPath.row].message
    return cell
  }
  
  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {

  }
 
}
