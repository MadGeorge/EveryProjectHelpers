import Foundation

/// Shortcut for NSLocalizedString with empty comment
func L(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

/**
 Run closure in background
 
 Do not call UI on execution!
 */
func future(closure: @escaping ()->()) {
    let backQueue = DispatchQueue.global()
    backQueue.async(execute: closure)
}

/**
 Run closure in background after delay
 
 Do not call UI on execution!
 */
func delaiedFuture(_ delayInSeconds: Double, closure: @escaping ()->()) {
    let delay = DispatchTime.now() + delayInSeconds
    let backQueue = DispatchQueue.global()
    backQueue.asyncAfter(deadline: delay, execute: closure)
}

/**
 Run closure after delay on main thread
 
 Safe for UI calls
 */
func delayCall(_ delayInSeconds: Double, closure: @escaping()->()) {
    let delay = DispatchTime.now() + delayInSeconds
    DispatchQueue.main.asyncAfter(deadline: delay) {
        closure()
    }
}

/// Run any closure on main thread explisitly
func ui(_ closure: @escaping ()->()){
    DispatchQueue.main.async(execute: closure)
}
