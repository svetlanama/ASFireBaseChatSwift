//
//  MessagesGateway.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

class MessagesGateway {
  
  class var ref: Firebase! {
    get { return Firebase(url: Constants.fbUrl) }
  }
  
  
  class func getMessages(postID: String, completion: (messagesArray: [ChatMessage]) -> Void)  {

    let postsRef = ref.childByAppendingPath("chatmessage")
    postsRef.observeEventType(.Value, withBlock: {
      snapshot in

      var localMessages = [ChatMessage]()
      for item in snapshot.children {
        let msgItem = item as! FDataSnapshot
        if postID == msgItem.value["PostID"] as? String {
        let chatmessageItem = ChatMessage(snapshot: msgItem)
        localMessages.append(chatmessageItem)
        }
      }
      
      print("messagesArray count: \(localMessages.count)")
      completion(messagesArray: localMessages)
      
      }, withCancelBlock: { error in
        print(error.description)
        completion(messagesArray: [ChatMessage]())
    })
    
  }
  
  
  
  class func createNewMessage(postID: String, senderEmail: String) {
    let postsRef = ref.childByAppendingPath("chatmessage")
    let random = Int(arc4random_uniform(777))
    let message = "Message Title: " + String(random)
    
    let senderEmail = senderEmail//"sender@gmail.com"
    let date = ""
    
    let chatMessageItem = ChatMessage(messageID: message, postID: postID, message: message, senderEmail: senderEmail, sentDate: date, last: 0, followup: 0, senderRead: 0, receiverRead: 0)
    postsRef.childByAutoId().setValue(chatMessageItem.toAnyObject())
  }
  
  
  
  
}