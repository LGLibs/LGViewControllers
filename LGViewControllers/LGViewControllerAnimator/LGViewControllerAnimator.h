//
// LGViewControllerAnimator.h
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>

@interface LGViewControllerAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic, getter=isGoingRight) BOOL goingRight;

@end
