//
//  ResetPasswordViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/13/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class ResetPasswordViewController: UIViewController {
  
  @IBOutlet weak var txtEmail: UITextField!
  
  @IBAction func onResetPassword(sender: AnyObject) {
    resetPassword()
  }

  func resetPassword() {
    
    UserGateway.resetPassword(txtEmail.text!) { (successful, error) -> Void in
      if successful {
        AlertUtils.showAlert(self,
          title: "",
          message: "You should receive new password",
          buttons: ["OK": nil])
              } else {
                AlertUtils.showAlert(self,
                  title: "",
                  message: "Sending email is failed .\(error?.description)",
                  buttons: ["OK": nil])
              }
    }
//    UserGateway.login(txtEmail.text!, pass: txtPass.text!) { (successful, error) ->
//      Void in
//      
//      if successful {
//        self.performSegueWithIdentifier(Constants.toPosts, sender: nil)
//      } else {
//        print("user login error: ", error?.code)
//        AlertUtils.showAlert(self,
//          title: "",
//          message: "Login is failed .\(error?.description)",
//          buttons: ["OK": nil])
//      }
//    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initControls()
  }
  
  func initControls() {
    txtEmail.text = "alexandrovna.sveta7@gmail.com"
  }

  
}

//toResetPassword