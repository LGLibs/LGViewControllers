//
// LGScrollView.m
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import "LGScrollView.h"

@interface LGScrollView ()

@property (strong, nonatomic) UIView *topSeparatorView;

@end

@implementation LGScrollView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:NO refreshHandler:nil];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:NO refreshHandler:nil];
    }
    return self;
}

- (instancetype)initWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled refreshHandler:(void(^)())refreshHandler
{
    self = [super init];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:placeholderViewEnabled refreshHandler:refreshHandler];
    }
    return self;
}

- (void)initializeWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled refreshHandler:(void(^)())refreshHandler
{
    self.backgroundColor = [UIColor clearColor];

    self.placeholderViewEnabled = placeholderViewEnabled;

    if (refreshHandler)
        [self setRefreshViewEnabledWithHandler:refreshHandler];
}

#pragma mark - Dealloc

- (void)dealloc
{
#if DEBUG
    NSLog(@"%s [Line %d]", __PRETTY_FUNCTION__, __LINE__);
#endif
}

#pragma mark -

- (void)setRefreshViewEnabledWithHandler:(void(^)())refreshHandler
{
    if (!_refreshViewEnabled && !_refreshView)
    {
        _refreshViewEnabled = YES;

        _refreshView = [LGRefreshView refreshViewWithScrollView:self
                                                 refreshHandler:refreshHandler];
    }
}

- (void)setRefreshViewDisabled
{
    if (_refreshViewEnabled && _refreshView)
    {
        _refreshViewEnabled = NO;

        if (_refreshView.superview)
            [_refreshView removeFromSuperview];

        _refreshView = nil;
    }
}

- (void)setPlaceholderViewEnabled:(BOOL)placeholderViewEnabled
{
    if (_placeholderViewEnabled != placeholderViewEnabled)
    {
        _placeholderViewEnabled = placeholderViewEnabled;

        if (_placeholderViewEnabled && !_placeholderView)
            _placeholderView = [LGPlaceholderView placeholderViewWithView:self];
        else if (!_placeholderViewEnabled && _placeholderView)
        {
            if (_placeholderView.superview)
                [_placeholderView removeFromSuperview];

            _placeholderView = nil;
        }
    }
}

#pragma mark -

- (void)addTopSeparatorViewWithColor:(UIColor *)color thinckness:(CGFloat)thinckness edgeInsets:(UIEdgeInsets)edgeInsets
{
    if (_topSeparatorView)
    {
        [_topSeparatorView removeFromSuperview];
        _topSeparatorView = nil;
    }

    _topSeparatorView = [UIView new];
    _topSeparatorView.backgroundColor = color;
    _topSeparatorView.frame = CGRectMake(edgeInsets.left, -thinckness, self.frame.size.width-edgeInsets.left-edgeInsets.right, thinckness);
    [self addSubview:_topSeparatorView];
}

@end
