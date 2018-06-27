import UIKit

class IntroViewController: UIPageViewController {
    
    var pageArray = [IntroPageHelper]()
    
    let logoTelegram = UIImage(named: "logo_telegram")
    let iconFast = UIImage(named: "icon_fast")
    let iconGift = UIImage(named: "icon_gift")
    let iconPowerful = UIImage(named: "icon_powerful")
    let iconCloud = UIImage(named: "icon_cloud")
    
    var startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createIntro()
        createButton()
        setStylePageControl()
    }
    
    fileprivate func createIntro() {
        let telegram = IntroPageHelper(
            nameHeader: "Telegram",
            nameSub: "The world's fastest messaging app.\nIt is free and secure.",
            image: logoTelegram!)
        
        let fast = IntroPageHelper(
            nameHeader: "Fast",
            nameSub: "Telegram delivers messages\nfaster than any other application.",
            image: iconFast!)
        
        let free = IntroPageHelper(
            nameHeader: "Free",
            nameSub: "Telegram is free forever. No ads.\nNo subscription feels.",
            image: iconGift!)
        
        let powerful = IntroPageHelper(
            nameHeader: "Powerful",
            nameSub: "Telegram has no limits on\nthe size of your chats and media.",
            image: iconPowerful!)
        
        let cloudBased = IntroPageHelper(
            nameHeader: "Cloud-Based",
            nameSub: "Telegram lets you access your\nmessages from multiple devices.",
            image: iconCloud!)
        
        pageArray.append(telegram)
        pageArray.append(fast)
        pageArray.append(free)
        pageArray.append(powerful)
        pageArray.append(cloudBased)
    }
    
    fileprivate func createButton() {
        
        
        startButton = UIButton(type: .roundedRect)
        startButton.layer.cornerRadius = 22
        startButton.setTitle("Start messaging", for: .normal)
        startButton.setTitleColor(ThemeManager.currentTheme().buttonTitleColor, for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        startButton.backgroundColor = ThemeManager.currentTheme().buttonColor
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(startIsTapped), for: .touchUpInside)
        
        self.view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: startButton,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 44),
            
            NSLayoutConstraint(
                item: startButton,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 200),
            
            NSLayoutConstraint(
                item: startButton,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0),
            
            NSLayoutConstraint(
                item: startButton,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self.view,
                attribute: .bottom,
                multiplier: 1,
                constant: -50),
            ])
    }
    
    fileprivate func setStylePageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = AppPalette.grey
        pageControl.currentPageIndicatorTintColor = AppPalette.blue
        pageControl.backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
    }
    
    @objc func startIsTapped(sender: UIButton){
        print("START MESSAGING EVENT")
    }
    
    lazy var pageViewControlleArray: [PageViewController] = {
        var pageVC = [PageViewController]()
        for page in pageArray {
            pageVC.append(PageViewController(pageWith: page))
        }
        return pageVC
    }()
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
        self.dataSource = self
        self.delegate = self
        setViewControllers([pageViewControlleArray[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IntroViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PageViewController else {
            return nil
        }
        if let index = pageViewControlleArray.index(of: viewController) {
            if index > 0 {
                return pageViewControlleArray[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PageViewController else {
            return nil
        }
        if let index = pageViewControlleArray.index(of: viewController) {
            if index < pageArray.count - 1 {
                return pageViewControlleArray[index + 1]
            }
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
