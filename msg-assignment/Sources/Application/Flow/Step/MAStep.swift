//
//  MAStep.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import RxFlow

enum MAStep: Step {
    // MARK: SignIn
    case signInIsRequired
    
    // MARK: SignUp
    case signUpIsRequired
    
    // MARK: Forgot
    case forgotIdIsRequired
    case forgotPwIsRequired
    
    // MARK: Main
    case mainIsRequired
}
