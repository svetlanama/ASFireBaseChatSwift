//
//  Post.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/7/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

public class Post: NSObject {
  
  let postID: String! 
  let posterID: String!
  let message: String!
  
  let category: Int!
  let postDate: String!
  
  let answered: Int!
  let helperID: String!
  let shared: Int!
  
  let ref: Firebase?
  
  init(snapshot: FDataSnapshot) {
    postID = snapshot.key
    posterID = snapshot.value["PosterID"] as! String
    helperID = snapshot.value["HelperID"] as! String
    message = snapshot.value["Message"] as! String
    category = Int(snapshot.value["Category"] as? String ?? "0")!
    postDate = snapshot.value["PostDate"] as! String
    answered = Int(snapshot.value["Answered"] as? String ?? "0")!
    shared = Int(snapshot.value["Shared"] as? String ?? "0")!
    ref = snapshot.ref
  }
  
  // cretae object model for push to DB
  init (message: String, category: Int, postDate: String, answered: Int = 0, helperId: String = "", shared: Int = 0) {
  
    self.postID = nil
    self.posterID = SharedDelegate.sharedInstance.uid
    self.helperID = helperId
    self.message = message
    self.category = category
    self.postDate = postDate
    self.answered = answered
    self.shared = shared
    self.ref = nil
  }
  
  func toAnyObject() -> AnyObject {
    return [
      "PosterID": posterID,
      "Message": message,
      "Category": category,
      "PostDate": postDate,
      "Answered": answered,
      "HelperID": helperID,
      "Shared": shared
    ]
  }
}
