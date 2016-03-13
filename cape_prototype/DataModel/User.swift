//
//  User.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class User: NSObject {
  
  let userID: String! //UserNo
  let name: String!
  let email: String!
  //let gender: String!
  //let birthday: String!
  //let prefix: String!
  //let suffix: String!
  
  let ref: Firebase?
  
  init (name: String) {
    
    self.userID = nil
    self.name = name
    self.email = nil
    self.ref = nil
  }
  
  init(snapshot: FDataSnapshot) {
    userID = snapshot.key
    name = snapshot.value["Name"] as! String
    email = snapshot.value["Email"] as! String
    ref = snapshot.ref
  }
   
  func toAnyObject(provider: String) -> AnyObject {
    return [
      
    ]
  }
  
  
}
/*

CREATE TABLE IF NOT EXISTS `users` (
`UserNo` int(11) NOT NULL,
`Prefix` varchar(32) NOT NULL,
`Name` varchar(32) NOT NULL,
`Suffix` varchar(32) NOT NULL,
`Gender` int(11) NOT NULL,
`Birthday` date NOT NULL,
`Email` varchar(32) NOT NULL,
`PhotoFile` varchar(256) NOT NULL,
`PhotoUrl` varchar(256) NOT NULL,
`Password` varchar(32) NOT NULL,
`Activation` varchar(32) NOT NULL,
`Verify` int(11) NOT NULL DEFAULT '0',
`AuthToken` varchar(32) NOT NULL,
`DeviceToken` varchar(64) NOT NULL,
`BadgeNum` int(11) NOT NULL,
`NewArticle` int(11) NOT NULL DEFAULT '0',
`PemArticle` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

*/