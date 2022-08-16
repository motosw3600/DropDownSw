# DropDownSw

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/DropDownSw.svg?style=flat)](https://cocoapods.org/pods/DropDownSw)

Simple DropDown implementaion View.

## Requiredment

- iOS 10.0+
- Xcode 10.0+
- Swift 5.0+

## Example

Simple Example for DropDownSw

```swift
let dropDown = DropDownSw()
dropDown.addItem("one")
dropDown.addItem("two")
dropDown.addItem("three")
view.addSubview(dropDown)
```

<img width="400" alt="image" src="https://user-images.githubusercontent.com/79497422/184888686-5c384715-250e-43c1-9430-f0491b614e4d.png">

### Custom DropDownSw
- mainColor
- itemColor
- titleColor
- itemTextColor
- title
- mainFont
- itemFont
- arrowColor

```swift
let dropDown = DropDownSw(mainColor: .blue, titleColor: .white, itemTextColor: .blue, title: "DropDownSw", arrowColor: .white)
```

<img width="400" alt="image" src="https://user-images.githubusercontent.com/79497422/184888669-62fe9d6a-68b6-48ad-b2ae-24135a3020fa.png">

### DropDownItem Touch Delegate
```swift
let dropDown = DropDownSw()
dropDown.delegate = self

extension ViewController: DropDownDelegate {
    func tapItem(index: Int) {
        // Implematation
    }
}
```

## Installation

DropDownSw is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DropDownSw'
```
## License

DropDownSw is available under the MIT license. See the LICENSE file for more info.

