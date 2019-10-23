# HSIndicatorTextfield
 TextField with bottom indicator written with Swift


![alt tag](https://github.com/hasansedaghat/HSIndicatorTextfield.git/ScreenShots/Showcase.gif)


## Features
- Bottom indicator pattern
- Change indicator height
- Change indicator color
- Change selected indicator color
- Set Placeholder Text With Custom Color and Font

## Installation
Download the file from source folder and copy to your project.

## Getting Started
#### Setup from InterfaceBuilder
1. Drag a UITextField instance into your UIViewController/UIView
2. Change the class of the UIView instance to `HSIndicatorTextfield`.
3. Link to the IBOutlet instance of your UIViewController/UIView.

#### Setup Programmitacally
34
Create an `HSIndicatorTextfield` instance and add to superview
35
```swift
let indicatorTXF = HSIndicatorTextfield(frame: frame)
self.view.addSubview(indicatorTXF)
```
## License
HSIndicatorTextfield is available under the MIT license. See the LICENSE file for more info.


## Author
Hasan Sedaghat - h.s_09@live.com
