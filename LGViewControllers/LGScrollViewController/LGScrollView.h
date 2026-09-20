//
// LGScrollView.h
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>
#import "LGPlaceholderView.h"
#import "LGRefreshView.h"

@interface LGScrollView : UIScrollView

@property (assign, nonatomic, readonly, getter=isRefreshViewEnabled) BOOL refreshViewEnabled;
@property (assign, nonatomic, getter=isPlaceholderViewEnabled) BOOL placeholderViewEnabled;

@property (strong, nonatomic) LGRefreshView *refreshView;
@property (strong, nonatomic) LGPlaceholderView *placeholderView;

/** Do not forget about weak referens to self for refreshHandler block */
- (instancetype)initWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled refreshHandler:(void(^)())refreshHandler;

- (void)addTopSeparatorViewWithColor:(UIColor *)color thinckness:(CGFloat)thinckness edgeInsets:(UIEdgeInsets)edgeInsets;

/** Do not forget about weak referens to self for refreshHandler block */
- (void)setRefreshViewEnabledWithHandler:(void(^)())refreshHandler;
- (void)setRefreshViewDisabled;

@end
