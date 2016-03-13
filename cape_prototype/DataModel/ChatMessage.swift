//
//  Message.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/11/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation


public class ChatMessage: NSObject {


  let messageID: String?
  let postID: String!
  let message: String!
//  let senderEmail: String!
  let senderID: String!
  let sentDate: String!
  let last: Int
  let followup: Int
  let senderRead: Int
  let receiverRead: Int
  
  let ref: Firebase?
  
  
  // cretae object model for push to DB
  init (messageID: String, postID: String, message: String, senderId: String, sentDate: String, last: Int, followup: Int, senderRead: Int, receiverRead: Int) {
    
    self.messageID = nil
    self.postID = postID
//    self.senderEmail = senderEmail
    self.senderID = senderId
    self.message = message
    self.sentDate = sentDate
    self.last = last
    self.followup = followup
    self.senderRead = senderRead
    self.receiverRead = receiverRead
    self.ref = nil
  }
  
  init(snapshot: FDataSnapshot) {
    messageID = snapshot.key
    postID = snapshot.value["PostID"] as! String
//    senderEmail = snapshot.value["SenderEmail"] as! String
    senderID = snapshot.value["SenderID"] as! String
    message = snapshot.value["Message"] as! String
    sentDate = snapshot.value["SentDate"] as! String
    last = Int(snapshot.value["Last"] as? String ?? "0")!
    followup = Int(snapshot.value["Followup"] as? String ?? "0")!
    senderRead = Int(snapshot.value["SenderRead"] as? String ?? "0")!
    receiverRead = Int(snapshot.value["ReceiverRead"] as? String ?? "0")!
    ref = snapshot.ref
  }

  
  func toAnyObject() -> AnyObject {
    return [
      "PostID": postID,
      "SenderID": senderID,
      "Message": message,
      "SentDate": sentDate,
      "Last": last,
      "Followup": followup,
      "SenderRead": senderRead,
      "ReceiverRead": senderRead //check it was corrected
    ]
  }

}