# LGViewControllers

Classes extends abilities of UITableViewController, UICollectionViewController, and more.
- [LGScrollViewController](./LGViewControllers/LGScrollViewController/LGScrollViewController.h) is view controller with LGScrollView as root view, that has LGPlaceholderView and LGRefreshView by default. View controller can watch for show/hide keyboard actions and scroll to first responder view without any manipulation.
- [LGTableViewController](./LGViewControllers/LGTableViewController/LGTableViewController.h) can do everything like LGScrollViewController, more than that it can reload table view asynchronously, without freezing UI.
- [LGCollectionViewController](./LGViewControllers/LGCollectionViewController/LGCollectionViewController.h) can do everything like LGScrollViewController, more than that it has easy initialization methods, to faster setup layout.
- [LGWebViewController](./LGViewControllers/LGWebViewController/LGWebViewController.h) is view controller with LGWebView as root view, that has LGPlaceholderView by default. View controller has easy initialization methods, to use it without subclassing.
- [LGViewControllerAnimator](./LGViewControllers/LGViewControllerAnimator/LGViewControllerAnimator.h) is class that implement slide animation between view controllers.

## Installation

### With source code

- [Download repository](https://github.com/LGLibs/LGViewControllers/archive/master.zip), then add [LGViewControllers directory](./LGViewControllers) to your project.
- Also you need to install libraries:
  - [LGPlaceholderView](https://github.com/LGLibs/LGPlaceholderView)
  - [LGRefreshView](https://github.com/LGLibs/LGRefreshView)

### With CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the "Get Started" section for more details.

#### Podfile
```
platform :ios, '6.0'
pod 'LGViewControllers', '~> 1.0.0'
```

## Usage

In the source files where you need to use the library, import the header file:

```objective-c
#import "LGViewControllers.h"
```

Or you can use sublibraries separately, depend of your needs:

```objective-c
#import "LGScrollViewController.h"
#import "LGTableViewController.h"
#import "LGCollectionViewController.h"
#import "LGWebViewController.h"

#import "LGScrollView.h"
#import "LGTableView.h"
#import "LGCollectionView.h"
#import "LGWebView.h"

#import "LGViewControllerAnimator.h"
```

### More

For more details try [Xcode Demo Project](./Demo) and see files:
- [LGScrollViewController.h](./LGViewControllers/LGScrollViewController/LGScrollViewController.h) and [LGScrollView.h](./LGViewControllers/LGScrollViewController/LGScrollView.h)
- [LGTableViewController.h](./LGViewControllers/LGTableViewController/LGTableViewController.h) and [LGTableView.h](./LGViewControllers/LGTableViewController/LGTableView.h)
- [LGCollectionViewController.h](./LGViewControllers/LGCollectionViewController/LGCollectionViewController.h) and [LGCollectionView.h](./LGViewControllers/LGCollectionViewController/LGCollectionView.h)
- [LGWebViewController.h](./LGViewControllers/LGWebViewController/LGWebViewController.h) and [LGWebView.h](./LGViewControllers/LGWebViewController/LGWebView.h)
- [LGViewControllerAnimator.h](./LGViewControllers/LGViewControllerAnimator/LGViewControllerAnimator.h)

## Repos / Mirrors

- [TRULAB](https://trulab.ru/LGLibs/LGViewControllers)
- [GitHub](https://github.com/LGLibs/LGViewControllers)
- [GitLab](https://gitlab.com/LGLibs/LGViewControllers)
- [Gitea](https://gitea.com/LGLibs/LGViewControllers)

## License

Copyright (c) 2015 Grigorii Lutkov \<grigorii@lutkov.dev\></br>
Licensed under the [MIT License](./LICENSE)
