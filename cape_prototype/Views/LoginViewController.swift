//
//  LoginViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/12/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit



class LoginViewController: UIViewController {
  
  @IBOutlet weak var txtEmail: UITextField!
  @IBOutlet weak var txtPass: UITextField!
  
  @IBAction func onLogin(sender: AnyObject) {
    loginUser()
  }
  
  
  @IBAction func onRegistration(sender: AnyObject) {
    self.performSegueWithIdentifier(Constants.toRegister, sender: nil)
  }
  
  @IBAction func onForgotPassword(sender: AnyObject) {
      self.performSegueWithIdentifier(Constants.toResetPassword, sender: nil)
  }
  

  
  func loginUser() {
    UserGateway.login(txtEmail.text!, pass: txtPass.text!) { (successful, error) ->
      Void in
      
      if successful {
        self.performSegueWithIdentifier(Constants.toPosts, sender: nil)
      } else {
        print("user login error: ", error?.code)
        AlertUtils.showAlert(self,
          title: "",
          message: "Login is failed .\(error?.description)",
          buttons: ["OK": nil])
      }
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initControls()
  }
  
  func initControls() {
    txtEmail.text = "alexandrovna.sveta7@gmail.com"
    txtPass.text = "sveta777"
  }
  
  
}