//
//  ViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/6/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import UIKit
import Foundation


//TODO: load 10 with downloading other while scrolling
//TODO: load only answered
class ViewController: UIViewController {

  @IBOutlet weak var postTable: UITableView!

  var posts = [Post]()
  let cellIdentifier = "Cell"
  var limit = 5
  
  @IBAction func createPost(sender: AnyObject) {
    PostsGateway.createNewPost()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Posts"
    initPostTable()
    PostsGateway.getPosts { (postsArray) -> Void in
      self.posts = postsArray
      self.reloadPosts()
    }
  }

  func initPostTable() {
    postTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    postTable.reloadData()
  }
  

  func reloadPosts() {
     self.postTable.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  posts.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)! as UITableViewCell
    cell.textLabel?.text = posts[indexPath.row].message
    return cell
  }
  
  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
   
    // let id = posts[indexPath.row].key
    self.performSegueWithIdentifier(Constants.toMessages, sender: nil)
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {

      let postItem = posts[indexPath.row]
      postItem.ref?.removeValue()
      
    }
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
//    self.limit += 1
//    self.posts.removeAll()
//    getPosts()
  }
  
  
}

