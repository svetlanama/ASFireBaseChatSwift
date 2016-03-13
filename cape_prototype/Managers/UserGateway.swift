//
//  UserGateway.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class UserGateway {
  
  class var CURRENT_USER_REF: Firebase {
    let userID = SharedDelegate.sharedInstance.uid
    
    let currentUser = Firebase(url: "\(BASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
    
    return currentUser!
  }
  
  class func getUser(completion: (user: User?) -> Void)  {
    
    CURRENT_USER_REF.observeEventType(FEventType.Value, withBlock: { snapshot in
      

      let user = User(snapshot: snapshot)
      completion(user: user)

      //self.currentUsername = currentUser
      }, withCancelBlock: { error in
        print(error.description)
        completion(user: nil)
    })
    
  }
  
  class func registerUser(email: String, pass: String, name: String, completion: (successful: Bool, error: NSError?) -> Void) {
    BASE_REF.createUser(email, password: pass) {  error, result in
      if error != nil {
        
        print("registration failed: %@", error)
        completion(successful: false, error: error)
      } else {
        
        BASE_REF.authUser(email, password: pass, withCompletionBlock: {
          err, authData in
          if error != nil {
            completion(successful: false, error: error)
            
          } else {
            
            print("provider: %@" +  authData.provider)
            let user = ["provider": authData.provider!, "Email": email, "Name": name]
            
            self.createNewAccount(authData.uid, user: user)
            SharedDelegate.sharedInstance.startNewSession(authData.uid)
            completion(successful: true, error: nil)
          }
        })
      }
    }
  }
  
  class func login(email: String, pass: String, completion: (successful: Bool, error: NSError?) -> Void) {
    BASE_REF.authUser(email, password: pass, withCompletionBlock: {
      error, authData in
      if error != nil {
        print("login failed: %@", error)
        completion(successful: false, error: error)
      } else {
        SharedDelegate.sharedInstance.startNewSession(authData.uid)
        completion(successful: true, error: nil)
      }
      
    })
  }
  
  
  class func createNewAccount(uid: String, user: Dictionary<String, String>) {
    
    USER_REF.childByAppendingPath(uid).setValue(user)
    print("uraaa user registered: ")
  }
  
  class func resetPassword(email: String, completion: (successful: Bool, error: NSError?) -> Void ) {
    
    BASE_REF.resetPasswordForUser(email) { (error) -> Void in
      if error != nil {
        print("reset pass failed: %@", error)
        completion(successful: false, error: error)
      } else {
        completion(successful: true, error: nil)
      }
    }
  }
  
  class func logout() {
    SharedDelegate.sharedInstance.setSessionInvalid()
    BASE_REF.unauth()
  }
  
  
}