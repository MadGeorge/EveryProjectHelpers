//
//  GobalFunctions.swift
//  HRecipes
//
//  Created by MadGeorge on 28/11/16.
//  Copyright © 2016 MadGeorge. All rights reserved.
//

import Foundation

/// Shortcut for NSLocalizedString with empty comment
func L(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

/// Run closure in background
func future(closure: @escaping ()->()) {
    let backQueue = DispatchQueue.global()
    backQueue.async(execute: closure)
}

/// Run closure after delay on main thread
func delayCall(delayInSeconds: Double, closure: @escaping()->()) {
    let delay = DispatchTime.now() + delayInSeconds
    DispatchQueue.main.asyncAfter(deadline: delay) {
        closure()
    }
}

/// Run any closure on main thread explisitly
func ui(closure: @escaping ()->()){
    DispatchQueue.main.async(execute: closure)
}
