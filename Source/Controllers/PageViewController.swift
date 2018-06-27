import UIKit

class PageViewController: UIViewController {
    
    //MARK: - Variebles
    lazy var subView: [UIView] = [self.pageImage, self.nameLabel, self.subLabel]
    
    //MARK: - Image
    private let pageImage: UIImageView = {
       let view = UIImageView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Label
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.textColor = ThemeManager.currentTheme().mainTitleColor
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Sub Label
    private let subLabel: UILabel = {
        let label = UILabel()
        label.textColor = ThemeManager.currentTheme().mainSubTitleColor
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    //MARK: - Init
    init(pageWith: IntroPageHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
        edgesForExtendedLayout = []
        
        pageImage.image = pageWith.image
        nameLabel.text = pageWith.nameHeader
        subLabel.text = pageWith.nameSub
        
        for view in subView {self.view.addSubview(view)}
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: pageImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120),
            NSLayoutConstraint(item: pageImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120),
            NSLayoutConstraint(item: pageImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: pageImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: pageImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: subLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: subLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
