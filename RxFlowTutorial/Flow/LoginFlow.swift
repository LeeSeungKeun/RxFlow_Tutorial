//
//  LoginFlow.swift
//  RxFlowTutorial
//
//  Created by 이성근 on 2021/10/12.
//

import Foundation
import RxFlow

class LoginFlow : Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init() {}

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
        case .homeIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.homeIsRequired)
        case .signUpIsRequired:
            return .none
        }
    }

    private func navigateToLogin() -> FlowContributors {
        let vc = LoginViewController()
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
}
