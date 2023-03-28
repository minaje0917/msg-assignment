//
//  MainFlow.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import RxFlow
import UIKit

class MainFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MAStep else { return .none }
        switch step {
        case .signInIsRequired:
            return coordinateToSignIn()
        case .signUpIsRequired:
            return navigateToSignUp()
        case .forgotIdIsRequired:
            return navigateToForgotId()
        case .forgotPwIsRequired:
            return navigateToForgotPw()
        case .mainIsRequired:
            return navigateToMain()
        default:
            return .none
        }
    }
    
    private func coordinateToSignIn() -> FlowContributors {
//        let vm =
//        let vc = SignInViewController()
//        self.rootViewController.setViewControllers([vc], animated: false)
//        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigateToSignUp() -> FlowContributors {
    }
    
    private func navigateToForgotId() -> FlowContributors {
    }
    
    private func navigateToForgotPw() -> FlowContributors {
    }
    
    private func navigateToMain() -> FlowContributors {

    }
}
