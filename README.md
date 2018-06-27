## Light and Dark theme
<p align="center">
<img src="https://raw.githubusercontent.com/dworkinnbarimen/telegram_intro/master/Resources/dark.png" width="171"/>
<img src="https://raw.githubusercontent.com/dworkinnbarimen/telegram_intro/master/Resources/light.png" width="171"/>
<img src="https://raw.githubusercontent.com/dworkinnbarimen/telegram_intro/master/Resources/dark.gif" width="171"/>
<img src="https://raw.githubusercontent.com/dworkinnbarimen/telegram_intro/master/Resources/light.gif" width="171"/>
</p>

## Usage
Changing the theme `AppDelegate.swift`:
1) Light
2) Dark

``` swift
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
```
## Compatibility
Telegram Intro is written in Swift 4 and requires iOS 10.0 or later.

## License
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](https://github.com/dworkinnbarimen/telegram_intro/blob/master/LICENSE) file for details
