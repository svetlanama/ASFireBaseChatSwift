//
//  Post.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/7/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

public class Post: NSObject {
  
  let postID: String! //postNo
  let posterEmail: String!
  let message: String!
  
  let category: Int!
  let postDate: String!
  
  let answered: Int!
  let helperEmail: String!
  let shared: Int!
  
  let ref: Firebase?
  
  init(snapshot: FDataSnapshot) {
    postID = snapshot.key
    posterEmail = snapshot.value["PosterEmail"] as! String
    message = snapshot.value["Message"] as! String
    category = Int(snapshot.value["Category"] as? String ?? "0")!
    postDate = snapshot.value["PostDate"] as! String
    answered = Int(snapshot.value["Answered"] as? String ?? "0")!
    helperEmail = snapshot.value["HelperEmail"] as? String ?? ""
    shared = Int(snapshot.value["Shared"] as? String ?? "0")!
    ref = snapshot.ref
  }
  
  // cretae object model for push to DB
  init (posterEmail: String, message: String, category: Int, postDate: String, answered: Int = 0, helperEmail: String = "", shared: Int = 0) {
  
    self.postID = nil
    self.posterEmail = posterEmail
    self.message = message
    self.category = category
    self.postDate = postDate
    self.answered = answered
    self.helperEmail = helperEmail
    self.shared = shared
    self.ref = nil
  }
  
  func toAnyObject() -> AnyObject {
    return [
      
      "PosterEmail": posterEmail,
      "Message": message,
      "Category": category,
      "PostDate": postDate,
      "Answered": answered,
      "HelperEmail": helperEmail,
      "Shared": shared
    ]
  }

  
}
