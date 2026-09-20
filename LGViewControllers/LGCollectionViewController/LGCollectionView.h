//
// LGCollectionView.h
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>
#import "LGPlaceholderView.h"
#import "LGRefreshView.h"

@interface LGCollectionView : UICollectionView

@property (assign, nonatomic, readonly, getter=isRefreshViewEnabled) BOOL refreshViewEnabled;
@property (assign, nonatomic, getter=isPlaceholderViewEnabled) BOOL placeholderViewEnabled;

@property (strong, nonatomic) LGRefreshView *refreshView;
@property (strong, nonatomic) LGPlaceholderView *placeholderView;

/** Do not forget about weak referens to self for refreshHandler block */
- (instancetype)initWithPlaceholderViewEnabled:(BOOL)placeholderViewEnabled refreshHandler:(void(^)())refreshHandler;

/** Do not forget about weak referens to self for refreshHandler block */
- (void)setRefreshViewEnabledWithHandler:(void(^)())refreshHandler;
- (void)setRefreshViewDisabled;

- (void)addTopSeparatorViewWithColor:(UIColor *)color thinckness:(CGFloat)thinckness edgeInsets:(UIEdgeInsets)edgeInsets;

- (void)setViewWidth:(CGFloat)viewWidth
          cellAspect:(CGFloat)cellAspect
 numberOfCellsInARow:(NSUInteger)numberOfCellsInARow
          cellInsets:(CGFloat)cellInsets
       sectionInsets:(UIEdgeInsets)sectionInsets
 headerReferenceSize:(CGSize)headerReferenceSize
 footerReferenceSize:(CGSize)footerReferenceSize
     scrollDirection:(UICollectionViewScrollDirection)scrollDirection;

- (void)setViewWidth:(CGFloat)viewWidth
          cellHeight:(CGFloat)cellHeight
 numberOfCellsInARow:(NSUInteger)numberOfCellsInARow
          cellInsets:(CGFloat)cellInsets
       sectionInsets:(UIEdgeInsets)sectionInsets
 headerReferenceSize:(CGSize)headerReferenceSize
 footerReferenceSize:(CGSize)footerReferenceSize
     scrollDirection:(UICollectionViewScrollDirection)scrollDirection;

- (void)setCellWidth:(CGFloat)cellWidth
          cellHeight:(CGFloat)cellHeight
          cellInsets:(CGFloat)cellInsets
       sectionInsets:(UIEdgeInsets)sectionInsets
 headerReferenceSize:(CGSize)headerReferenceSize
 footerReferenceSize:(CGSize)footerReferenceSize
     scrollDirection:(UICollectionViewScrollDirection)scrollDirection;

@end
