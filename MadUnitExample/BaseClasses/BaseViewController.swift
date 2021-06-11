//
//  BaseViewController.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    var shouldHideNavigationBar = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(shouldHideNavigationBar, animated: true)
    }
    
}
