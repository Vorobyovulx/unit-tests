//
//  AppCoordinator.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import UIKit
import XCoordinator
import RxSwift
import RxCocoa

enum AppRoute: Route {
    
    case main
    
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(rootViewController: BaseNavigationController(), initialRoute: .main)
        
        rootViewController.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .main:
            let vm = MainViewModel()
            let vc = MainViewController(viewModel: vm)
            return .set([vc])
        }
    }

}
