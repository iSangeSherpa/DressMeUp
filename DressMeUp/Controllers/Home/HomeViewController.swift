import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var photoExpandedController = PhotoExpandedViewController()
    var imageArray = ["img1", "img2", "img3", "img4", "img5", "img1", "img2", "img3", "img4", "img5"]
    
    var flowlayout: UICollectionViewFlowLayout = {
        var flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumInteritemSpacing = 10
        flowlayout.minimumLineSpacing = 10
        return flowlayout
    }()
    
    lazy var collectionView : UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor.mainBackgroundColor
        return collectionView
    }()
            
    // MARK: Labels
    lazy var inspirationsLabel : UILabel = {
        var inspirationsLabel = UILabel()
        inspirationsLabel.text = "Inspirations"
        inspirationsLabel.font = UIFont(name: "Lato-Black", size: 25)
        inspirationsLabel.textColor = UIColor.primaryLabelColor
        return inspirationsLabel
    }()
    
    lazy var cameraButton: UIButton = {
        var cameraButton = UIButton()
        let image = UIImage(systemName: "camera.circle")?.withTintColor(UIColor.primaryLabelColor, renderingMode: .alwaysOriginal)
        cameraButton.setBackgroundImage(image, for: .normal)
        return cameraButton
    }()
    
    lazy var topBarStack : UIStackView = {
        var topBarStack = UIStackView()
        topBarStack.axis = .horizontal
        topBarStack.alignment = .center
        topBarStack.distribution = .fill
        
        topBarStack.addArrangedSubview(inspirationsLabel)
        topBarStack.addArrangedSubview(cameraButton)
        return topBarStack
    }()
    
    
    // MARK: Container Views
    lazy var topBar : UIView = {
        var topBar = UIView()
        topBar.backgroundColor = UIColor.mainThemeColor
        topBar.addSubview(topBarStack)
        return topBar
    }()
    
    
    // MARK: Main Calling method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(topBar)
        view.addSubview(collectionView)
        
        cameraButton.addTarget(self, action: #selector(cameraTappedAction), for: .touchUpInside)
        
        // MARK: Constraints
        topBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.width.equalToSuperview()
            make.height.equalTo(80)
        }
        topBarStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.right.bottom.equalToSuperview().offset(-20)
        }
        cameraButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
       
    }
    

    @objc func cameraTappedAction() {
        let alert = UIAlertController(title: "Add Photo", message: "Please select a method", preferredStyle: .alert)
    
        alert.addAction(UIAlertAction(title: "Add from library", style: .default) { _ in
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.delegate = self
            vc.allowsEditing = true
            self.present(vc, animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "Take a photo", style: .default) { _ in
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.delegate = self
            vc.allowsEditing = true
            self.present(vc, animated: true)
        })

        alert.addAction(UIAlertAction(title: "Cancel", style: .default) { _ in
            alert.dismiss(animated: true)
        })
        
        self.present(alert, animated: true, completion: nil)
    }

}




extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2-5, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        // Configure the cell
        let currentImage = imageArray[indexPath.row]
        cell.imageView.image = UIImage(named: "\(currentImage)")
        cell.layer.cornerRadius = 5

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let image = UIImage(named: "\(imageArray[indexPath.row])") else { return }
        photoExpandedController.photoImageView.image = image
        self.navigationController?.pushViewController(photoExpandedController, animated: true)
    }
    
}


extension HomeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let photoController = PhotoExpandedViewController()
        
        if let imageURL = info[.imageURL] as? URL {
            let imageString = imageURL.absoluteString
            UserDefaults.standard.set(imageURL, forKey: "image")
//            print(UserDefaults.standard.string(forKey: "image"))
            
            if let imageData = try? Data(contentsOf: imageURL) {
                print("Inside----")
                print(imageData)
                photoController.photoImageView.image = UIImage(data: imageData)
            }
        }
        
    }
    
    
}
