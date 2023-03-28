//
//  ForgotIdViewController.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import Foundation
import UIKit
import SnapKit
import Then

final class ForgotIdViewController: BaseViewController<ForgotIdViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let text = UILabel().then {
        $0.text = "아이디 찾기"
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
    
    private lazy var backButton = UIButton().then {
        $0.setTitleColor(
            UIColor.black,
            for: .normal
        )
        $0.backgroundColor = UIColor(
            red: 1,
            green: 1,
            blue: 1,
            alpha: 0
        )
        $0.setImage(UIImage(named: "XButton.svg"), for: .normal)
    }
    
    @objc func tap() {
        
    }
    
    override func addView() {
        [text, backButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        text.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(32)
            $0.top.equalToSuperview().offset(32)
        }
    }
}
