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
  
  var postID: String!
  var messages = [ChatMessage]()
  let senderEmail1 = "Kate@gmail.com"
  let senderEmail2 = "Tom@gmail.com"
  
  @IBAction func onPosterrClick(sender: AnyObject) {
    MessagesGateway.createNewMessage(postID, senderEmail: senderEmail1)
  }
  
  @IBAction func onSenderClick(sender: AnyObject) {
    MessagesGateway.createNewMessage(postID, senderEmail: senderEmail2)
  }
  
  let cellIdentifierPoster = "poster_cell"
  let cellIdentifierHelper = "helper_cell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Messages"
    initMessageTable()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    MessagesGateway.getMessages(postID, completion: {(messagesArray) -> Void in
      self.messages = messagesArray
      self.reloadMessages()
    })
  }
  
  private func initMessageTable() {
    messagesTable.reloadData()
  }
  
  private func reloadMessages() {
    self.messagesTable.reloadData()
  }
  
}

extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell: ChatMessageTableViewCell!
    let msgItem: ChatMessage = messages[indexPath.row]
    
    if  msgItem.senderEmail == senderEmail1 {
      cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierPoster) as! ChatMessageTableViewCell
    } else {
      cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierHelper) as! ChatMessageTableViewCell
    }
    
    cell.chatMessage = msgItem
    
    return cell
  }
  
  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
  
}
