# setViewControllers におけるキャッシュ動作の検証リポジトリ
setViewControllers にて `animated: true` にすると画面がキャッシュされる仕様があります。その検証するためのリポジトリです。

## Doc
Apple dev : https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621861-setviewcontrollers

## 再現環境
- UINavigationControllerのPageViewControllerにて transitionStyle: .scroll となっていること
- setViewControllersの animated: true となっていること
