//
//  User.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class User: NSObject {
  
  let userID: String!  
  let name: String!
  let email: String!

  let ref: Firebase?
  
  init (name: String) {
    
    self.userID = nil
    self.name = name
    self.email = nil
    self.ref = nil
  }
  
  init(snapshot: FDataSnapshot) {
    userID = snapshot.key
    name = snapshot.value["Name"] as? String ?? ""
    email = snapshot.value["Email"] as! String
    ref = snapshot.ref
  }
   
  func toAnyObject(provider: String) -> AnyObject {
    return [
      
    ]
  }
  
  
}
