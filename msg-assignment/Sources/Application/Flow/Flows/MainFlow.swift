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
        let vm = SignInViewModel()
        let vc = SignInViewController(vm)
        self.rootViewController.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigateToSignUp() -> FlowContributors {
        let vm = SignUpViewModel()
        let vc = SignUpViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }

    private func navigateToForgotId() -> FlowContributors {
        let vm = ForgotIdViewModel()
        let vc = ForgotIdViewController(vm)
        self.rootViewController.present(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }

    private func navigateToForgotPw() -> FlowContributors {
        let vm = ForgotPwViewModel()
        let vc = ForgotPwViewController(vm)
        vc.modalPresentationStyle = .fullScreen
        self.rootViewController.present(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }

    private func navigateToMain() -> FlowContributors {
        let vm = MainViewModel()
        let vc = MainViewController(vm)
        self.rootViewController.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))

    }
}
