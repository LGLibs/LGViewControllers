//
// LGWebViewController.h
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>
#import "LGWebView.h"

@interface LGWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) LGWebView *webView;

@property (assign, nonatomic, getter=isOpenLinksInside) BOOL openLinksInside;

- (instancetype)initWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled;

- (instancetype)initWithTitle:(NSString *)title url:(NSURL *)url;
- (instancetype)initWithTitle:(NSString *)title url:(NSURL *)url placeholderViewEnabled:(BOOL)placeholderViewEnabled;

- (void)loadingDidFinishWithError:(NSError *)error;

@end
