//
//  DBGataway.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/11/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class PostsGateway {
  
//  var ref: Firebase!
//  
//  internal class var sharedInstance : DBGateway {
//    struct Static {
//      static var onceToken: dispatch_once_t = 0
//      static var instance: DBGateway? = nil
//    }
//    dispatch_once(&Static.onceToken) {
//      Static.instance = DBGateway().initUniqueInstance()
//    }
//    
//    return Static.instance!
//  }
//  
//  func initUniqueInstance() -> DBGateway {
//    ref = Firebase(url: Constants.fbUrl)
//    
//    return self
//  }
  
  
  
  class func getPosts(completion: (postsArray: [Post]) -> Void)  {
    
    let ref = Firebase(url: Constants.fbUrl) // TODO: think get/set
   
    let postsRef = ref.childByAppendingPath("posts")
    postsRef.observeEventType(.Value, withBlock: {
      snapshot in
      
      //postsRef.queryLimitedToFirst(UInt(limit)).observeEventType(.Value, withBlock: {
      //  snapshot in
      
      //print("\(snapshot.key) -> \(snapshot.value)")
      
      var localPosts = [Post]()
      for item in snapshot.children {

        let postItem = Post(snapshot: item as! FDataSnapshot)
        //print("post: ", post.message)
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

    let ref = Firebase(url: Constants.fbUrl)
    let postsRef = ref.childByAppendingPath("posts")
    let random = Int(arc4random_uniform(333))
    let message = "Post Title: " + String(random)

    let posterEmail = "sveta@gmail.com"
    let category = 0 //TODO: ask what does it mean
    let date = ""

    let postItem = Post(posterEmail: posterEmail, message: message, category: category, postDate: date)

   postsRef.childByAutoId().setValue(
      postItem.toAnyObject()

       )
 }

  
  
}