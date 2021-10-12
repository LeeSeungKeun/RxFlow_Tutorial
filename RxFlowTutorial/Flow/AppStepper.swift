//
//  AppStepper.swift
//  RxFlowTutorial
//
//  Created by 이성근 on 2021/10/12.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    var initialStep: Step {
        return DemoStep.loginIsRequired 
    }
}

