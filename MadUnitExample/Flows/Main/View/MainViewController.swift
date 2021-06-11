//
//  MainViewController.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {
    
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        bind()
    }
    
    private func configureView() {
        title = "Главная"
    }
    
    private func bind() {
        let input = MainViewModel.Input()
        _ = viewModel.transform(input: input)
    }

}
