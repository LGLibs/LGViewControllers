//
// LGScrollViewController.h
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>
#import "LGScrollView.h"

@interface LGScrollViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) LGScrollView *scrollView;

@property (assign, nonatomic, getter=isKeyboardShowHideObserverEnabled) BOOL keyboardShowHideObserverEnabled;

- (instancetype)initWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled refreshViewEnabled:(BOOL)refreshViewEnabled;

- (void)refreshActions;

- (void)keyboardWillShowHideNotification:(NSNotification *)notification;
- (void)keyboardWillShowHideActionsAppear:(BOOL)appear keyboardHeight:(CGFloat)keyboardHeight;

@end
