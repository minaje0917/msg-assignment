//
//  ViewController.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import UIKit
import SnapKit
import Then
import RxCocoa

final class SignInViewController: BaseViewController<SignInViewModel> {

    override func viewDidLoad() {
        self.navigationItem.title = "로그인"
        super.viewDidLoad()
    }
    
    private let dotoriIcon = UIImageView().then {
        $0.image = UIImage(named: "DotoriIcon.svg")
    }
    
    private let dotoriText = UILabel().then {
        $0.text = "Dotori"
        $0.textColor = .black
        $0.font = UIFont.systemFont(
            ofSize: 32,
            weight: .bold
        )
    }
    
    private let explainText = UILabel().then {
        $0.text = "더 나은 기숙사 생활을 위해"
        $0.textColor = UIColor(
            red: 85/255,
            green: 85/255,
            blue: 85/255,
            alpha: 1
        )
        $0.font = UIFont.systemFont(
            ofSize: 16,
            weight: .regular
        )
    }
    
    private let idTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [
                .foregroundColor: UIColor(
                    red: 153/255,
                    green: 153/255,
                    blue: 153/255,
                    alpha: 1
                ),
                .font: UIFont.systemFont(
                    ofSize: 16,
                    weight: .regular
                )
        ])
        $0.layer.cornerRadius = 8
        $0.textColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.leftPadding(width: 12)
    }
    
    private let pwTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [
                .foregroundColor: UIColor(
                    red: 153/255,
                    green: 153/255,
                    blue: 153/255,
                    alpha: 1
                ),
                .font: UIFont.systemFont(
                    ofSize: 16,
                    weight: .regular
                )
        ])
        $0.layer.cornerRadius = 8
        $0.textColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.leftPadding(width: 12)
    }
    
    private lazy var forgotIdButton = UIButton().then {
        let text = NSAttributedString(string: "아이디 찾기")
        $0.setAttributedTitle(
            text,
            for: .normal
        )
        $0.titleLabel?.font = UIFont.systemFont(
            ofSize: 12,
            weight: .regular
        )
        $0.setTitleColor(
            UIColor(
                red: 153/255,
                green: 153/255,
                blue: 153/255,
                alpha: 1
            ),
            for: .normal
        )
        $0.backgroundColor = UIColor(
            red: 1,
            green: 1,
            blue: 1,
            alpha: 0
        )
    }
    
    private let betweenLine = UILabel().then {
        $0.text = "|"
        $0.textColor = UIColor(
            red: 153/255,
            green: 153/255,
            blue: 153/255,
            alpha: 1
        )
        $0.font = UIFont.systemFont(
            ofSize: 13,
            weight: .thin
        )
    }
    
    private lazy var forgotPwButton = UIButton().then {
        let text = NSAttributedString(string: "비밀번호 재설정")
        $0.setAttributedTitle(
            text,
            for: .normal
        )
        $0.titleLabel?.font = UIFont.systemFont(
            ofSize: 12,
            weight: .regular
        )
        $0.setTitleColor(
            UIColor(
                red: 153/255,
                green: 153/255,
                blue: 153/255,
                alpha: 1
            ),
            for: .normal
        )
        $0.backgroundColor = UIColor(
            red: 1,
            green: 1,
            blue: 1,
            alpha: 0
        )
    }
    
    private let topStackView = UIStackView().then {
        $0.spacing = 16
        $0.axis = .horizontal
        $0.alignment = .center
    }
    
    private let notMemberText = UILabel().then {
        $0.text = "아직 회원이 아니신가요?"
        $0.textColor = UIColor(
            red: 153/255,
            green: 153/255,
            blue: 153/255,
            alpha: 1
        )
        $0.font = UIFont.systemFont(
            ofSize: 12,
            weight: .regular
        )
    }
    
    private lazy var notMemberButton = UIButton().then {
        let text = NSAttributedString(string: "회원가입")
        $0.setAttributedTitle(
            text,
            for: .normal
        )
        $0.titleLabel?.font = UIFont.systemFont(
            ofSize: 12,
            weight: .bold
        )
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
    }
    
    private let bottomStackView = UIStackView().then {
        $0.spacing = 8
        $0.axis = .horizontal
        $0.alignment = .center
    }
    
    private lazy var signInButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(
            text,
            for: .normal
        )
        $0.titleLabel?.font = UIFont.systemFont(
            ofSize: 18,
            weight: .regular
        )
        $0.setTitleColor(
            UIColor.white,
            for: .normal
        )
        $0.backgroundColor = UIColor(
            red: 111/255,
            green: 122/255,
            blue: 236/255,
            alpha: 1
        )
        $0.layer.cornerRadius = 8
    }
    
    override func addView() {
        [dotoriIcon, dotoriText, explainText, idTextField, pwTextField, topStackView, bottomStackView,
         signInButton].forEach {
            view.addSubview($0)
        }
        [forgotIdButton, betweenLine, forgotPwButton].forEach {
            topStackView.addArrangedSubview($0)
        }
        [notMemberText, notMemberButton].forEach {
            bottomStackView.addArrangedSubview($0)
        }
    }
    
    override func setLayout() {
        dotoriIcon.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(24)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        dotoriText.snp.makeConstraints {
            $0.leading.equalTo(dotoriIcon.snp.trailing).offset(8)
            $0.centerY.equalTo(dotoriIcon.snp.centerY).offset(0)
        }
        explainText.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(24)
            $0.top.equalTo(dotoriIcon.snp.bottom).offset(8)
        }
        idTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(explainText.snp.bottom).offset(54)
            $0.height.equalTo(52)
        }
        pwTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(24)
            $0.height.equalTo(52)
        }
        topStackView.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(24)
            $0.trailing.equalTo(view.snp.trailing).inset(24)
        }
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset((bounds.height) / 3.81)
            $0.centerX.equalToSuperview()
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(bottomStackView.snp.bottom).offset(36)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}

