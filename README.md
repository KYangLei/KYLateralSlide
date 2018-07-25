# KYLateralSlide

### 参考https://github.com/ChavezChen/CWLateralSlide.git 实现的Swfit版本，写的不好的地方请指出

## How To Use：
**使用cocoapods或者手动拖入.**
```swfit
platform :ios, '10.0'

target 'TargetName' do
pod 'KYLateralSlide'
end
```
**搜索不到最新版本的解决方法：**
```
1、执行rm ~/Library/Caches/CocoaPods/search_index.json 删除索引的缓存再搜索，如果这样也搜索不到的话更新cocoapods
2、执行 pod repo update --verbose 更新成功之后就没问题了
```
### 1、显示抽屉：
```swift
let vc = LeftViewController.init()
ky_showSide(configuration: { (config) in

}, viewController: vc)
```
vc为你需要侧滑出来的控制器，调用这个方法你就拥有一个抽屉效果+左划/点击返回功能。

### 2、注册滑动手势驱动抽屉
```swift
// 手势注册
let vc = LeftViewController.init()
self.ky_registGestureShowSide { (direction) in
if direction == .left {
self.ky_showSide(configuration: { (config) in
config.animationType = .zoom
}, viewController: vc)
}else {
self.ky_showSide(configuration: { (config) in
config.direction = .right
}, viewController: vc)
}
}
```
