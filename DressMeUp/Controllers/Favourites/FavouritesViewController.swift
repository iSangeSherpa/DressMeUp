import UIKit
import SnapKit

class FavouritesViewController: UIViewController {

    var topBar = getTopBar(labelText: "Favourites")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor
        
        view.addSubview(topBar)
        
        topBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.width.equalToSuperview()
            make.height.equalTo(80)
        }
       
    }
}