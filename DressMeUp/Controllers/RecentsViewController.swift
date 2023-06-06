import UIKit
import SnapKit

class RecentsViewController: UIViewController {
    
    // MARK: Color Variables
    var primaryLabelColor : UIColor = {
        return UIColor(red: 238/255, green: 245/255, blue: 219/255, alpha: 1)
    }()
    
    var primaryColor : UIColor = {
        return UIColor(red: 79/255, green: 99/255, blue: 103/255, alpha: 1)
    }()
    
    var backgroundColor : UIColor = {
        return UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    }()

    
    lazy var recentOutfitsContainer: UITableView = {
        var recentOutfitsContainer = UITableView()
        recentOutfitsContainer.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        recentOutfitsContainer.backgroundColor = backgroundColor
        return recentOutfitsContainer
    }()
    
    // MARK: Labels
    lazy var inspirationsLabel : UILabel = {
        var inspirationsLabel = UILabel()
        inspirationsLabel.text = "Recent Outfits"
        inspirationsLabel.font = UIFont(name: "Lato-Black", size: 30)
        inspirationsLabel.textColor = primaryLabelColor
        return inspirationsLabel
    }()
    
    lazy var topBarStack : UIStackView = {
        var topBarStack = UIStackView()
        topBarStack.axis = .horizontal
        topBarStack.alignment = .center
        topBarStack.distribution = .fill
        
        topBarStack.addArrangedSubview(inspirationsLabel)
        return topBarStack
    }()
    
    
    // MARK: Container Views
    lazy var topBar : UIView = {
        var topBar = UIView()
        topBar.backgroundColor = primaryColor
        topBar.addSubview(topBarStack)
        return topBar
    }()
    
    

    
    // MARK: Main Calling Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        view.backgroundColor = backgroundColor
        view.addSubview(topBar)
        view.addSubview(recentOutfitsContainer)
        
        recentOutfitsContainer.dataSource = self
        recentOutfitsContainer.delegate = self
                
        // MARK: Constraints
        topBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
        topBarStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
        
        recentOutfitsContainer.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
    }
    
}


extension RecentsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.backgroundColor = backgroundColor
        return cell
    }
}
