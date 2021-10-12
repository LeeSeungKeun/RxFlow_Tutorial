//
//  HomeFlow.swift
//  RxFlowTutorial
//
//  Created by 이성근 on 2021/10/12.
//

import Foundation
import RxFlow

class HomeFlow {
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
        case .homeIsRequired:
            return self.navigateToHome()
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.loginIsRequired as! Step)
        case .signUpIsRequired:
            return .none
        }
    }

    private func navigateToHome() -> FlowContributors {
        let vc = HomeViewController()
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNext: vc as! Stepper as! Presentable))
    }
}
