//
//  BaseNavigationController.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }
    
    override var childForStatusBarHidden: UIViewController? {
        topViewController
    }
    
}
