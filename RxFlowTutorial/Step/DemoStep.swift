//
//  DemoStep.swift
//  RxFlowTutorial
//
//  Created by 이성근 on 2021/10/12.
//

import Foundation
import RxFlow

enum DemoStep : Step { 
    case loginIsRequired
    case homeIsRequired
    case signUpIsRequired
}
