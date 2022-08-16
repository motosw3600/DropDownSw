# DropDownSw

[![CI Status](https://img.shields.io/travis/motosw3600/DropDownSw.svg?style=flat)](https://travis-ci.org/motosw3600/DropDownSw)
[![Version](https://img.shields.io/cocoapods/v/DropDownSw.svg?style=flat)](https://cocoapods.org/pods/DropDownSw)
[![License](https://img.shields.io/cocoapods/l/DropDownSw.svg?style=flat)](https://cocoapods.org/pods/DropDownSw)
[![Platform](https://img.shields.io/cocoapods/p/DropDownSw.svg?style=flat)](https://cocoapods.org/pods/DropDownSw)

Simple DropDown implementaion View.

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

