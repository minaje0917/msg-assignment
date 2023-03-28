//
//  ForgotPwViewController.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import Foundation
import UIKit
import SnapKit
import Then

final class ForgotPwViewController: BaseViewController<ForgotPwViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let text = UILabel().then {
        $0.text = "비밀번호 찾기"
        $0.textColor = UIColor(
            red: 153/255,
            green: 153/255,
            blue: 153/255,
            alpha: 1
        )
        $0.font = UIFont.systemFont(
            ofSize: 20,
            weight: .regular
        )
    }
    
    override func addView() {
        [text].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        text.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
