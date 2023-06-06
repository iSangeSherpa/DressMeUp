//
//  ClosetsViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 18/05/2023.
//

import UIKit

class ClosetsViewController: UIViewController {
    
    var topBar = getTopBar(labelText: "Closets")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        view.addSubview(topBar)
        
        topBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
        
    }
    
}
