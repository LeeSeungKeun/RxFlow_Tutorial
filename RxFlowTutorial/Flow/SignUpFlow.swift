//
//  SignUpFlow.swift
//  RxFlowTutorial
//
//  Created by 이성근 on 2021/10/12.
//

import Foundation
import RxFlow
import RxSwift

class SignUpFlow : Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        return UINavigationController()
    }()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .signUpIsRequired:
            return .none
        case .homeIsRequired:
            return .none
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.loginIsRequired)
        }
    }


}
