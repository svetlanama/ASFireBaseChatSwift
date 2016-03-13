//
//  ProfileViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/13/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var txtEmail: UITextField!
  @IBOutlet weak var txtPass: UITextField!
  @IBOutlet weak var txtName: UITextField!
  
  var currentUser: User?
  @IBAction func onSave(sender: AnyObject) {
    
  }
  
  @IBAction func onLogout(sender: AnyObject) {
     SharedDelegate.sharedInstance.setSessionInvalid()
     navigationController?.popToRootViewControllerAnimated(true)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getUserData()
  }
  
  func getUserData() {
    UserGateway.getUser { (user) -> Void in
      if user != nil {
        self.currentUser = user
        self.fillView()
        
      } else {
        AlertUtils.showAlert(self,
          title: "",
          message: "Error of geting user data .",
          buttons: ["OK": nil])
      }
    }
  }
  
  func updateUser() {
    
  }
  
  func fillView() {
    txtName.text = currentUser?.name
    txtEmail.text = currentUser?.email
  }
  
}
