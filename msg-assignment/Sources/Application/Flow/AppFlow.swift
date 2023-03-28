//
//  AppFlow.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import RxFlow
import UIKit
import RxSwift
import RxCocoa

struct AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    
    init() {}
    
    var initialStep: Step {
        return MAStep.signInIsRequired
    }
}

final class AppFlow: Flow {
    
    var root: Presentable {
        return window
    }
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
        
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MAStep else {return .none}
        
        switch step {
        case .signInIsRequired:
            return coordinateToSignIn()
        default:
            return .none
        }
    }
    
    private func coordinateToSignIn() -> FlowContributors {
        let flow = MainFlow()
        Flows.use(flow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(
            flowContributor: .contribute(
                withNextPresentable: flow,
                withNextStepper: OneStepper(withSingleStep: MAStep.signInIsRequired)
        ))
    }
}
