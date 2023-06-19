import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var imageContainer: UIImageView = {
        var imageContainer = UIImageView()
        imageContainer.contentMode = .scaleToFill
        imageContainer.image = UIImage(named: "user-placeholder")
        imageContainer.backgroundColor = .black
        imageContainer.clipsToBounds = true
        imageContainer.layer.cornerRadius = 75
        return imageContainer
    }()
    
    var nameLabel: UILabel = {
        var nameLabel = UILabel()
        nameLabel.text = "Lakpa Sange Sherpa"
        nameLabel.font = UIFont(name: "OpenSans-SemiBold", size: 15)
        nameLabel.textColor = UIColor.splashLabelColor
        return nameLabel
    }()
    
    lazy var topHalfView: UIView = {
        var topHalfView = UIView()
        topHalfView.backgroundColor = UIColor.mainThemeColor
        
        topHalfView.addSubview(imageContainer)
        topHalfView.addSubview(nameLabel)
        return topHalfView
    }()
    
    var emailField = getFieldContainer(textLabel: "Email", textLabelValue: "sangesherpa1215@gmail.com")
    var phoneField = getFieldContainer(textLabel: "Phone", textLabelValue: "98233123231")

    var changePasswordField = getFieldContainer(textLabel: "Change Password", textLabelValue: "• • • • • • •")
    var changePasswordArrowButton: UIButton = {
        var btn = UIButton()
        let image = UIImage(systemName: "arrow.right")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        btn.setBackgroundImage(image, for: .normal)
        btn.addTarget(changePasswordTapped.self, action: #selector(changePasswordTapped), for: .touchUpInside)
        return btn
    }()

    // vertical list of labels - email, phone, changePassword
    lazy var fieldContainer: UIStackView = {
       var fieldContainer = UIStackView()
        fieldContainer.axis = .vertical
        fieldContainer.addArrangedSubview(emailField)
        fieldContainer.addArrangedSubview(phoneField)
        fieldContainer.addArrangedSubview(changePasswordField)
        return fieldContainer
    }()
    
    var logoutButton = customButton(backgroundColor: UIColor.mainThemeColor, title: "Log Out", titleColor: UIColor.splashLabelColor)
    
    // view inside the scrollView to enable scrolling
    lazy var scrollableContainer: UIView = {
        var view = UIView()
        view.addSubview(topHalfView)
        view.addSubview(fieldContainer)
        view.addSubview(changePasswordArrowButton)
        view.addSubview(logoutButton)
        return view
    }()
    
    // Top level scroll view
    lazy var mainScrollViewContainer : UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.addSubview(scrollableContainer)
        return scrollView
    }()
    
    // MARK: Main Calling Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        view.addSubview(mainScrollViewContainer)
        view.addSubview(scrollableContainer)
        view.addSubview(topHalfView)
        view.addSubview(fieldContainer)
        view.addSubview(changePasswordArrowButton)
        view.addSubview(logoutButton)
        
        logoutButton.addTarget(logoutButtonTapped.self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        mainScrollViewContainer.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(20)
            make.left.right.equalToSuperview()
        }
        scrollableContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview()
        }
        
        topHalfView.snp.makeConstraints { make in
            make.top.equalTo(scrollableContainer.snp.top)
            make.left.equalTo(scrollableContainer.snp.left)
            make.right.equalTo(scrollableContainer.snp.right)
            make.height.equalTo(280)
        }
        imageContainer.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.centerY.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageContainer.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }


        fieldContainer.snp.makeConstraints { make in
            make.top.equalTo(topHalfView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        changePasswordArrowButton.snp.makeConstraints { make in
            make.top.equalTo(changePasswordField.snp.top).offset(30)
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(20)
        }
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(fieldContainer.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    
    @objc func changePasswordTapped() {
        let changePasswordVC = ChangePasswordViewController()
        self.navigationController?.pushViewController(changePasswordVC, animated: true)
    }
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Are you sure you want to logout ?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default) { _ in
            print("Logged out!")
        })
        
        alert.addAction(UIAlertAction(title: "No", style: .default) { _ in
            alert.dismiss(animated: true)
        })
        self.present(alert, animated: true, completion: nil)
    }
}
