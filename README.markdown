# PromiseKit UIKit Extensions ![Build Status]

This project adds promises to Apple’s UIKit framework.

This project supports Swift 3.1, 3.2 and 4.0.

## CocoaPods

```ruby
pod "PromiseKit/UIKit" ~> 4.0
```

The extensions are built into `PromiseKit.framework` thus nothing else is needed.

## Carthage

```ruby
github "PromiseKit/UIKit" ~> 1.0
```

The extensions are built into their own framework:

```swift
// swift
import PromiseKit
import PMKUIKit
```

```objc
// objc
@import PromiseKit;
@import PMKUIKit;
```

# `UIImagePickerController`

Due to iOS 10 requiring an entry in your app’s `Info.plist` for any usage of `UIImagePickerController` (even if you don’t actually call it directly), we have removed UIIm agePickerController from the default `UIKit` pod. To use it you must add an additional subspec:

```ruby
pod "PromiseKit/UIImagePickerController"
```

Sorry, but there’s not an easier way.


[Build Status]: https://travis-ci.org/PromiseKit/UIKit.svg?branch=master
