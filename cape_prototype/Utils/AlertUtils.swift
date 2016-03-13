//
//  AlertUtils.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/13/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

final class AlertUtils {
  
  static let sharedUtils = AlertUtils()
  
  class func showAlert(targetVC: UIViewController?, title: String, message: String, buttons: [String: ((UIAlertAction) -> Void)?]) {
    
    let alert = UIAlertController(
      title: title,
      message: message,
      preferredStyle: UIAlertControllerStyle.Alert)
    
    for (title, handler) in buttons {
      let alertButton = UIAlertAction(
        title: title,
        style: UIAlertActionStyle.Default,
        handler: handler)
      
      alert.addAction(alertButton)
    }
    
    if (targetVC == nil) {
      UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    } else {
      targetVC!.presentViewController(alert, animated: true, completion: nil)
    }
  }
}
