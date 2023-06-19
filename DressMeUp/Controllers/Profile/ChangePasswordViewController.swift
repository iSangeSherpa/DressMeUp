//
//  ChangePasswordViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 19/06/2023.
//

import UIKit
import SnapKit

import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ChangePasswordViewController: UIViewController {
    
    @FormMaterialTextField(placeholder: "Old Password") var oldPassword : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "New Password") var newPassword : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Confirm Password") var confirmPassword : MaterialComponents.MDCOutlinedTextField

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        view.addSubview(oldPassword)
        view.addSubview(newPassword)
        view.addSubview(confirmPassword)
        
        oldPassword.snp.makeConstraints { make in
            make.left.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        newPassword.snp.makeConstraints { make in
            make.top.equalTo(oldPassword.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        confirmPassword.snp.makeConstraints { make in
            make.top.equalTo(newPassword.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }

}
