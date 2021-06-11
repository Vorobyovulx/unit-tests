//
//  MainViewModel.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import RxSwift
import RxCocoa
import XCoordinator

class MainViewModel: BaseViewModel {
    
    func transform(input: Input) -> Output {
        Output()
    }

    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func doSomethingAsync(delay: UInt32, completion: @escaping ((String) -> Void)) {
        DispatchQueue.global().async {
            sleep(delay)
            completion("Hello world!")
        }
    }
    
}

extension MainViewModel {
    
    struct Input {
    }
    
    struct Output {
    }
    
}
