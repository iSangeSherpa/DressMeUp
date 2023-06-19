//
//  SignUpViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 19/06/2023.
//

import UIKit
import SnapKit

import MaterialComponents.MaterialTextControls_OutlinedTextFields

class SignUpViewController: UIViewController {
    
    lazy var fieldStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(email)
        stack.addArrangedSubview(password)
        stack.addArrangedSubview(confirmPassword)
        stack.addArrangedSubview(gender)
        return stack
    }()
    
    var signUpButton = customButton(title: "Register", titleColor: UIColor.primaryLabelColor, titleFont: UIFont(name: "OpenSans-Bold", size: 15))
    var signInButton = customButton(title: "Sign In Instead", titleColor: UIColor.primaryLabelColor, titleFont: UIFont(name: "OpenSans-Bold", size: 15))
    
    @FormMaterialTextField(placeholder: "Name") var name : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "E-mail") var email : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Password") var password : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Confirm Password") var confirmPassword : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Gender") var gender : MaterialComponents.MDCOutlinedTextField
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    

    private func setup() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        view.addSubview(fieldStack)
        view.addSubview(signUpButton)
        view.addSubview(signInButton)
                
        fieldStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(fieldStack.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    // SignIn instead tapped
    @objc func signInTapped() {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
}
