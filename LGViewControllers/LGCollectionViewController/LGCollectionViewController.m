//
// LGCollectionViewController.m
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import "LGCollectionViewController.h"

@interface LGCollectionViewController ()

@property (assign, nonatomic) CGFloat bottomContentInset;
@property (assign, nonatomic) CGFloat bottomScrollIndicatorInsets;

@end

@implementation LGCollectionViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:NO refreshViewEnabled:NO];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:NO refreshViewEnabled:NO];
    }
    return self;
}

- (instancetype)initWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled refreshViewEnabled:(BOOL)refreshViewEnabled
{
    self = [super init];
    if (self)
    {
        [self initializeWithPlaceholderViewEnabled:placeholderViewEnabled refreshViewEnabled:refreshViewEnabled];
    }
    return self;
}

- (void)initializeWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled refreshViewEnabled:(BOOL)refreshViewEnabled
{
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0)
        self.wantsFullScreenLayout = YES;
    else
    {
        self.extendedLayoutIncludesOpaqueBars = YES;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    if (refreshViewEnabled)
    {
        __weak typeof(self) wself = self;

        _collectionView = [[LGCollectionView alloc] initWithPlaceholderViewEnabled:placeholderViewEnabled
                                                                    refreshHandler:^(void)
                           {
                               if (wself)
                               {
                                   __strong typeof(wself) self = wself;

                                   [self refreshActions];
                               }
                           }];
    }
    else _collectionView = [[LGCollectionView alloc] initWithPlaceholderViewEnabled:placeholderViewEnabled
                                                                     refreshHandler:nil];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
}

#pragma mark - Dealloc

- (void)dealloc
{
#if DEBUG
    NSLog(@"%s [Line %d]", __PRETTY_FUNCTION__, __LINE__);
#endif

    if (self.isKeyboardShowHideObserverEnabled)
        _keyboardShowHideObserverEnabled = NO;
}

#pragma mark - Appearing

- (void)viewWillLayoutSubviews
{
    CGFloat topInset = 0.f;
    topInset += (self.navigationController.navigationBarHidden ? 0.f : MIN(self.navigationController.navigationBar.frame.size.width, self.navigationController.navigationBar.frame.size.height));
    topInset += ([UIApplication sharedApplication].statusBarHidden ? 0.f : MIN([UIApplication sharedApplication].statusBarFrame.size.width, [UIApplication sharedApplication].statusBarFrame.size.height));

    CGFloat bottomInset = 0.f;
    bottomInset += (self.navigationController.isToolbarHidden ? 0.f : MIN(self.navigationController.toolbar.frame.size.width, self.navigationController.toolbar.frame.size.height));

    CGFloat topShift = 0.f;
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0 &&
        !self.navigationController.isNavigationBarHidden &&
        self.navigationController.navigationBar.isOpaque)
        topShift = topInset;

    CGRect newFrame = CGRectMake(0.f, -topShift, self.view.frame.size.width, self.view.frame.size.height+topShift);

    if (!CGSizeEqualToSize(_collectionView.frame.size, newFrame.size))
    {
        _collectionView.frame = newFrame;
        _collectionView.contentInset = UIEdgeInsetsMake(topInset, 0.f, bottomInset, 0.f);
        _collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(topInset, 0.f, bottomInset, 0.f);
    }
}

#pragma mark - Refresh

- (void)refreshActions
{
    //
}

#pragma mark - Keyboard notification

- (void)setKeyboardShowHideObserverEnabled:(BOOL)keyboardShowHideObserverEnabled
{
    if (_keyboardShowHideObserverEnabled != keyboardShowHideObserverEnabled)
    {
        _keyboardShowHideObserverEnabled = keyboardShowHideObserverEnabled;

        if (_keyboardShowHideObserverEnabled)
        {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowHideNotification:) name:UIKeyboardWillShowNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowHideNotification:) name:UIKeyboardWillHideNotification object:nil];
        }
        else
        {
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
        }
    }
}

- (void)keyboardWillShowHideNotification:(NSNotification *)notification
{
    [LGCollectionViewController keyboardAnimateWithNotificationUserInfo:notification.userInfo
                                                             animations:^(CGFloat keyboardHeight)
     {
         BOOL appear = (notification.name == UIKeyboardWillShowNotification);

         [self keyboardWillShowHideActionsAppear:appear keyboardHeight:keyboardHeight];
     }];
}

- (void)keyboardWillShowHideActionsAppear:(BOOL)appear keyboardHeight:(CGFloat)keyboardHeight
{
    if (appear)
    {
        _bottomContentInset = _collectionView.contentInset.bottom;
        _bottomScrollIndicatorInsets = _collectionView.scrollIndicatorInsets.bottom;
    }

    CGFloat bottomContentInset = (appear ? keyboardHeight : _bottomContentInset);
    CGFloat bottomScrollIndicatorInsets = (appear ? keyboardHeight : _bottomScrollIndicatorInsets);

    UIEdgeInsets contentInset = _collectionView.contentInset;
    UIEdgeInsets scrollIndicatorInsets = _collectionView.scrollIndicatorInsets;

    contentInset.bottom = bottomContentInset;
    scrollIndicatorInsets.bottom = bottomScrollIndicatorInsets;

    _collectionView.contentInset = contentInset;
    _collectionView.scrollIndicatorInsets = scrollIndicatorInsets;
}

#pragma mark - UICollectionView Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - Support

+ (void)keyboardAnimateWithNotificationUserInfo:(NSDictionary *)notificationUserInfo animations:(void(^)(CGFloat keyboardHeight))animations
{
    CGFloat keyboardHeight = (notificationUserInfo[@"UIKeyboardBoundsUserInfoKey"] ? [notificationUserInfo[@"UIKeyboardBoundsUserInfoKey"] CGRectValue].size.height : 0.f);
    if (!keyboardHeight)
        keyboardHeight = (notificationUserInfo[UIKeyboardFrameBeginUserInfoKey] ? [notificationUserInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height : 0.f);
    if (!keyboardHeight)
        keyboardHeight = (notificationUserInfo[UIKeyboardFrameEndUserInfoKey] ? [notificationUserInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height : 0.f);
    if (!keyboardHeight)
        return;

    NSTimeInterval animationDuration = [notificationUserInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    int animationCurve = [notificationUserInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];

    if (animations) animations(keyboardHeight);

    [UIView commitAnimations];
}

@end
