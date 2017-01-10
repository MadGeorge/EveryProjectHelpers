//
//  UIViewControllerHelpers.swift
//  HRecipes
//
//  Created by MadGeorge on 10/12/2016.
//  Copyright © 2016 MadGeorge. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Present simple alert with title, message and cancel button
    func alertSimple(_ title: String, message: String?, cancelTitle: String? = NSLocalizedString("alert_close_btn", comment: "")) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L("alert_close_btn"), style: .cancel, handler: { a in}))
        present(alert, animated: true, completion: nil)
    }
    
    func alertNotYet() {
        alertSimple(L("Not implemented yet"), message: L("Implementation of this functionnality is in progress."))
    }
    
}

/// View controller which hide it's title on disappear, so next controller back button title will be empty
class HideBarTitleVC: UIViewController {
    
    var titleText: String? {
        didSet {
            navigationItem.title = titleText
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationItem.title = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.title = titleText
    }
    
}

/// Table view controller which hide it's title on disappear, so next controller back button title will be empty
class HideBarTitleTVC: UITableViewController {
    
    var titleText: String? {
        didSet {
            navigationItem.title = titleText
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationItem.title = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.title = titleText
    }
    
}

/// Collection view controller which hide it's title on disappear, so next controller back button title will be empty
class HideBarTitleCVC: UICollectionViewController {
    
    var titleText: String? {
        didSet {
            navigationItem.title = titleText
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationItem.title = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.title = titleText
    }
    
}

