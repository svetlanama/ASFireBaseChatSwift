//
//  PosterTableViewCell.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class ChatMessageTableViewCell: UITableViewCell {
  
  @IBOutlet weak var authorImage: UIImageView!
  @IBOutlet weak var txtMessage: UILabel!
  
  var chatMessage: ChatMessage! {
    didSet {
      setContent(chatMessage)
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    initControl()
  }
  
  private func initControl() {
    backgroundColor = UIColor.whiteColor() //UIColor(named: UIColor.AppColor.GreyishBrown)
    authorImage.layer.cornerRadius = 21
    authorImage.backgroundColor = UIColor.lightGrayColor()
//  txtMessage.layer.cornerRadius = 3
//  txtMessage.backgroundColor = UIColor.whiteColor()
  }
  
  private func setContent(chatMessage: ChatMessage) {
     txtMessage.text = chatMessage.message
    
  }

}