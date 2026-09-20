//
// LGViewControllerAnimator.m
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import "LGViewControllerAnimator.h"

static CGFloat const kChildViewPadding = 0.f;
static CGFloat const kSpringDamping    = 1.f;
static CGFloat const kSpringVelocity   = 0.5f;

@implementation LGViewControllerAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    CGFloat travelDistance = [transitionContext containerView].bounds.size.width + kChildViewPadding;
    CGAffineTransform travel = CGAffineTransformMakeTranslation (_goingRight ? travelDistance : -travelDistance, 0);

    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    toViewController.view.transform = CGAffineTransformInvert(travel);

    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:kSpringDamping
          initialSpringVelocity:kSpringVelocity
                        options:0
                     animations:^(void)
     {
         fromViewController.view.transform = travel;
         fromViewController.view.alpha = 0;
         toViewController.view.transform = CGAffineTransformIdentity;
         toViewController.view.alpha = 1;
     }
                     completion:^(BOOL finished)
     {
         fromViewController.view.transform = CGAffineTransformIdentity;
         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
     }];
}

@end
