//
// LGTableViewController.h
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>
#import "LGTableView.h"

@interface LGTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, LGTableViewDelegate>

@property (strong, nonatomic) LGTableView *tableView;

@property (assign, nonatomic, getter=isKeyboardShowHideObserverEnabled) BOOL keyboardShowHideObserverEnabled;

- (instancetype)initWithStyle:(UITableViewStyle)style;
- (instancetype)initWithStyle:(UITableViewStyle)style asyncCalculatingHeightForRows:(BOOL)asyncCalculatingHeightForRows;
- (instancetype)initWithStyle:(UITableViewStyle)style asyncCalculatingHeightForRows:(BOOL)asyncCalculatingHeightForRows placeholderViewEnabled:(BOOL)placeholderViewEnabled refreshViewEnabled:(BOOL)refreshViewEnabled;

- (void)refreshActions;

- (void)keyboardWillShowHideNotification:(NSNotification *)notification;
- (void)keyboardWillShowHideActionsAppear:(BOOL)appear keyboardHeight:(CGFloat)keyboardHeight;

@end
