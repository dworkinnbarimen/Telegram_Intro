import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        ThemeManager.setTheme(theme: .Dark)
        
        let theme = ThemeManager.currentTheme()
        ThemeManager.applyTheme(theme: theme)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
        window?.makeKeyAndVisible()
        window?.rootViewController = IntroViewController()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
 
    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
}

