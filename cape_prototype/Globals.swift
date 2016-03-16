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

var chatsTitles = ["Hey!", "Can I  ask you about ...", "Where can I get the programming MBA degree", "Are you looking for help?", "What is the best way?", "Hello!", "I am interesting in new technologies", "IT sphere...", "Whow can I predict...", "Where can I buy a good quality music", "Where can I take a courses"]


var messages = ["Hey!", "Glad to here...", "How are you", "Yes I can help you", "Are you sure?", "No", "Seems I am not aware ih this", "It is a ritorical question", "What exaclty do you need", "How is your attitute to...", "Ok", "Sorry...", "It is a bit unclear...", "Can you explain please?"]