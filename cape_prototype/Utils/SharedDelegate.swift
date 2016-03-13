//
//  AppDelegate.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/13/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

public class SharedDelegate{

  var senderID: String! {
    get {
      return ""
    }
  }
  
  var uid: String! {
    get {
      return (NSUserDefaults.standardUserDefaults().objectForKey(UID) ?? "839c7461-570f-402a-b992-6cddc860b3e5") as? String
    }
  }

  static let sharedInstance = SharedDelegate()

  func startNewSession(uid: String)
  {
    self.setSessionInvalid();
    
    NSUserDefaults.standardUserDefaults().setObject(uid,forKey: UID)
    NSUserDefaults.standardUserDefaults().synchronize()
  }

  func isSessionActive() -> Bool {
    return uid != "" ? true : false
  }
  
  
  func setSessionInvalid(){
    
    if uid != "" {
      NSUserDefaults.standardUserDefaults().removeObjectForKey(UID)
    }
    NSUserDefaults.standardUserDefaults().synchronize()
  }
  
//  func checkNetwork() -> Bool {
//    
//    let reachability: Reachability! = Reachability.reachabilityForInternetConnection() as Reachability
//    let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
//    return networkStatus != 0
//  }
}
