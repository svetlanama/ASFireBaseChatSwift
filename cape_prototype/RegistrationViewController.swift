//
//  RegistrationViewController.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/13/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
  
  @IBOutlet weak var txtEmail: UITextField!
  @IBOutlet weak var txtPass: UITextField!
  @IBOutlet weak var txtName: UITextField!

  @IBAction func onRegistration(sender: AnyObject) {
    registerUser()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    txtEmail.text = "alexandrovna.sveta9@gmail.com"
    txtPass.text = "sveta777"
    txtName.text = "Katya"
  }
  
  func registerUser() {
    
    UserGateway.registerUser(txtEmail.text!, pass: txtPass.text!, name: txtName.text!){ (successful, error) ->
      Void in
      
      if successful {
        //self.navigationController?.popToRootViewControllerAnimated(false)
        self.performSegueWithIdentifier(Constants.toPosts, sender: nil)
      } else {
        print("user registered error: ", error?.code)
        AlertUtils.showAlert(self,
          title: "",
          message: "Registration is failed .\(error?.description)",
          buttons: ["OK": nil])
      }
    }
  }
  
}