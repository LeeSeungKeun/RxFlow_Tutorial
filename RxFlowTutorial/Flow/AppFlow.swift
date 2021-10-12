//
//  AppFlow.swift
//  RxFlowTutorial
//
//  Created by 이성근 on 2021/10/12.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class AppFlow: Flow {

    var window: UIWindow

    var root: Presentable {
        return self.window
    }

    init(window: UIWindow) {
        self.window = window
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .homeIsRequired:
            return self.navigateToLogin()
        case .loginIsRequired:
            return self.navigateToHome()
        case .signUpIsRequired:
            return .none
        }
    }

    private func navigateToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.loginIsRequired)))
    }

    private func navigateToHome() -> FlowContributors {
        let homeFlow = HomeFlow()
        Flows.use(homeFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.homeIsRequired)))
    }

    private func navigateToSingUp() -> FlowCoordinator {
        let signUpFlow = SignUpFlow()
        Flows.use(signUpFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: signUpFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.homeIsRequired)))
    }
}
