//
//  SignInViewModel.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class SignInViewModel: BaseViewModel{
    struct Input {
        let signInButtonTap: Observable<Void>
        let notMemberButtonTap: Observable<Void>
        let forgotIdButtonTap: Observable<Void>
        let forgotPwButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.signInButtonTap.subscribe(
            onNext: pushMain
        ) .disposed(by: disposeBag)
        
        input.notMemberButtonTap.subscribe(
            onNext: pushSignUpVC
        ) .disposed(by: disposeBag)
        
        input.forgotIdButtonTap.subscribe(
            onNext: pushForgotIdVC
        ) .disposed(by: disposeBag)
        
        input.forgotPwButtonTap.subscribe(
            onNext: pushForgotPwVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushMain() {
        self.steps.accept(MAStep.mainIsRequired)
    }
    
    private func pushSignUpVC() {
        self.steps.accept(MAStep.signUpIsRequired)
    }
    
    private func pushForgotIdVC() {
        self.steps.accept(MAStep.forgotIdIsRequired)
    }
    
    private func pushForgotPwVC() {
        self.steps.accept(MAStep.forgotPwIsRequired)
    }
}
