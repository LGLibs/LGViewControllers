//
// LGWebView.m
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import "LGWebView.h"

@implementation LGWebView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:NO];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:NO];
    }
    return self;
}

- (instancetype)initWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled
{
    self = [super init];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:placeholderViewEnabled];
    }
    return self;
}

- (void)initializeWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled
{
    self.placeholderViewEnabled = placeholderViewEnabled;
}

#pragma mark - Dealloc

- (void)dealloc
{
#if DEBUG
    NSLog(@"%s [Line %d]", __PRETTY_FUNCTION__, __LINE__);
#endif
}

#pragma mark -

- (void)removeBackgroundImages
{
    if ([UIDevice currentDevice].systemVersion.floatValue < 7)
        for (UIImageView *imageView in self.scrollView.subviews)
            if ([imageView isKindOfClass:[UIImageView class]] && imageView.image.size.width == 1)
                imageView.hidden = YES;
}

- (void)setPlaceholderViewEnabled:(BOOL)placeholderViewEnabled
{
    if (_placeholderViewEnabled != placeholderViewEnabled)
    {
        _placeholderViewEnabled = placeholderViewEnabled;

        if (_placeholderViewEnabled && !_placeholderView)
            _placeholderView = [LGPlaceholderView placeholderViewWithView:self.scrollView];
        else if (!_placeholderViewEnabled && _placeholderView)
        {
            if (_placeholderView.superview)
                [_placeholderView removeFromSuperview];

            _placeholderView = nil;
        }
    }
}

@end
