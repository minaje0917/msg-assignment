//
//  BaseViewModel.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class BaseViewModel: Stepper{
    var disposeBag = DisposeBag()
    var steps = PublishRelay<Step>()
}
