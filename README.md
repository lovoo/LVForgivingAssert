# LVForgivingAssert

[![CI Status](https://travis-ci.org/lovoo/LVForgivingAssert.svg?branch=master)](https://travis-ci.org/Lovoo/LVForgivingAssert/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## What does it do?

Sometimes it is necessary to have parameters in a method that are not nil. Especially for Swift compatibility there are often _Nonnull arguments added, but it is not possible to prohibit Objective-C callers to call a method with nil. Xcode will warn you when using the nil literal but not, when using a nil named pointer like the following example:

```objective-c
- (NSString *)aMethodWithNonnullArgument:(NSString *_Nonnull)string;
```

```objective-c
NSString *string;
[self aMethodWithNonnullArgument:string];
```

The usual approach is to use NSAssert to crash a development version when this occurs. This helps very much during development process and forces the caller to call the method correctly. But most times, it’s not that easy and there needs to be a fallback in production mode when NSAssert does not work.
When unit testing this method, the app is in debug mode in the most configurations, so you can only test if the method throws:

```objective-c
NSString *string;
XCTAssertThrows([self aMethodWithNonnullArgument:string]);
```

With LVForgivingAssert it’s also possible to test the method without having NSAssert enabled while testing in debug mode:

```objective-c
LVIgnoreAssert(^{
    XCTAssertNil([self aMethodWithNonnullArgument:string]);
});
```

## How does it work?

This very tiny library adds a NSAssertionHandler subclass that is set temporarily as the current assertion handler. It does not enable NSAssert and ignores it instead. After the macromis blocked, the original NSAssertionHandler is set, so it does not effect your app behaviour.
See the example for more information.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. The pod is used in the test target, so be sure to hit cmd+U in Xcode or select the 'Test' menu item.

## Requirements

## Installation

LVForgivingAssert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LVForgivingAssert", :git => 'https://github.com/lovoo/LVForgivingAssert.git'
```

## Author

Benjamin Herzog, mail@benchr.de

## License

See the LICENSE file for more info.