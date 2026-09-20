//
// LGWebView.h
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>
#import "LGPlaceholderView.h"

@interface LGWebView : UIWebView

@property (assign, nonatomic, getter=isPlaceholderViewEnabled) BOOL placeholderViewEnabled;

@property (strong, nonatomic) LGPlaceholderView *placeholderView;

- (instancetype)initWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled;

- (void)removeBackgroundImages;

@end
