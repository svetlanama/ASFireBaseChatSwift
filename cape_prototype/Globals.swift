//
//  Globals.swift
//  cape_prototype
//
//  Created by Svitlana Moiseyenko on 3/13/16.
//  Copyright © 2016 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

let BASE_URL = "https://capeprototype.firebaseio.com"
let BASE_REF = Firebase(url: "\(BASE_URL)")
let USER_REF = Firebase(url: "\(BASE_URL)/users")
let POST_REF = Firebase(url: "\(BASE_REF)/post")
let MESSAGE_REF = Firebase(url: "\(BASE_URL)/chatmessage")

let UID = "UID"