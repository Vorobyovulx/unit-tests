//
//  AppDelegate.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import UIKit
import XCoordinator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private lazy var mainWindow = UIWindow()
    
    private let router = AppCoordinator().strongRouter
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        router.setRoot(for: mainWindow)
        
        return true
    }

}
