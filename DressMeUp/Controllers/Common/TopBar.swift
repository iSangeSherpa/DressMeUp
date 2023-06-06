import Foundation
import UIKit
import SnapKit

public func getTopBar(
    labelText: String,
    labelFont: UIFont? = UIFont(name: "Lato-Black", size: 28),
    labelColor: UIColor = UIColor.primaryLabelColor,
    backgroundColor: UIColor = UIColor.mainThemeColor
    ) -> UIView {
        
    let mainLabel : UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = labelText
        mainLabel.font = labelFont
        mainLabel.textColor = labelColor
        return mainLabel
    }()
        
    lazy var barStack : UIStackView = {
        let barStack = UIStackView()
        barStack.axis = .horizontal
        barStack.alignment = .center
        barStack.distribution = .fill
        
        barStack.addArrangedSubview(mainLabel)
        return barStack
    }()
        
    lazy var topBar : UIView = {
        let topBar = UIView()
        topBar.backgroundColor = backgroundColor
        topBar.addSubview(barStack)
        return topBar
    }()

    barStack.snp.makeConstraints { make in
        make.left.equalTo(topBar.snp.left).offset(20)
        make.centerY.equalTo(topBar.snp.centerY)
    }
    
    return topBar
}
