//
//  DBGataway.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/11/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class PostsGateway {
  
  class var ref: Firebase! {
    get { return Firebase(url: Constants.fbUrl) }
  }
  
  
  class func getPosts(completion: (postsArray: [Post]) -> Void)  {
    let postsRef = ref.childByAppendingPath("post")
    
    postsRef.observeEventType(.Value, withBlock: {
      snapshot in
      //postsRef.queryLimitedToFirst(UInt(limit)).observeEventType(.Value, withBlock: {
      //  snapshot in
      
      var localPosts = [Post]()
      for item in snapshot.children {
        let postItem = Post(snapshot: item as! FDataSnapshot)
        localPosts.append(postItem)
      }
      
      print("posts count: \(localPosts.count)")
      completion(postsArray: localPosts)
      
      }, withCancelBlock: { error in
        print(error.description)
        completion(postsArray: [Post]())
    })
    
  }
  
  
  
  class func createNewPost() {
    let postsRef = ref.childByAppendingPath("post")
    let random = Int(arc4random_uniform(333))
    let message = "Post Title: " + String(random)
    
    let posterEmail = "sveta@gmail.com"
    let category = 0 //TODO: ask what does it mean
    let date = ""
    
    let postItem = Post(posterEmail: posterEmail, message: message, category: category, postDate: date)
    postsRef.childByAutoId().setValue(postItem.toAnyObject())
  }
  
  
  
}