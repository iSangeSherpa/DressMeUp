import UIKit
import SnapKit

class PhotoExpandedViewController: UIViewController {
    
    // MARK: This VC specific
    var photoImageView: UIImageView = {
       var photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        photoImageView.backgroundColor = .gray
        return photoImageView
    }()
    
    var photoItemName: UILabel = {
        var photoItemName = UILabel()
        photoItemName.text = "Black Trousers"
        photoItemName.font = UIFont(name: "Lato-Regular", size: 16)
        return photoItemName
    }()
    
    var heartImageButton: UIButton = {
        var heartImageButton = UIButton()
        let heartImage = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        heartImageButton.setBackgroundImage(heartImage, for: .normal)
        return heartImageButton
    }()
    
    lazy var labelStack: UIStackView = {
        var labelStack = UIStackView()
        labelStack.axis = .horizontal
        labelStack.distribution = .fill
        labelStack.alignment = .center                
        labelStack.addArrangedSubview(photoItemName)
        labelStack.addArrangedSubview(heartImageButton)
        return labelStack
    }()
        

    // MARK: Main Calling Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        view.addSubview(photoImageView)
        view.addSubview(labelStack)

        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(400)
        }
        
        labelStack.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        heartImageButton.snp.makeConstraints { make in
            make.height.width.equalTo(25)
        }
        
        
    }
}
