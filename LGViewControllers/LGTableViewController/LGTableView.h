//
// LGTableView.h
// LGViewControllers
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

#import <UIKit/UIKit.h>
#import "LGPlaceholderView.h"
#import "LGRefreshView.h"

@class LGTableView;

@protocol LGTableViewDelegate <NSObject>

@required

- (CGFloat)tableView:(LGTableView *)tableView heightForRowAtIndexPathAsync:(NSIndexPath *)indexPath;

@end

@interface LGTableView : UITableView

@property (strong, nonatomic, readonly) NSMutableArray *heightForRowsArray;

@property (assign, nonatomic) id<LGTableViewDelegate> delegateLG;

@property (assign, nonatomic, readonly, getter=isRefreshViewEnabled) BOOL refreshViewEnabled;
@property (assign, nonatomic, getter=isPlaceholderViewEnabled) BOOL placeholderViewEnabled;

@property (strong, nonatomic) LGRefreshView *refreshView;
@property (strong, nonatomic) LGPlaceholderView *placeholderView;

- (instancetype)initWithStyle:(UITableViewStyle)style;

/** Do not forget about weak referens to self for refreshHandler block */
- (instancetype)initWithStyle:(UITableViewStyle)style placeholderViewEnabled:(BOOL)placeholderViewEnabled refreshHandler:(void(^)())refreshHandler;

/** Do not forget about weak referens to self for refreshHandler block */
- (void)setRefreshViewEnabledWithHandler:(void(^)())refreshHandler;
- (void)setRefreshViewDisabled;

- (void)addTopSeparatorViewWithColor:(UIColor *)color thinckness:(CGFloat)thinckness edgeInsets:(UIEdgeInsets)edgeInsets;

#pragma mark -

- (void)reloadDataWithCompletionHandler:(void(^)())completionHandler;
- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation completionHandler:(void(^)())completionHandler;
- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation completionHandler:(void(^)())completionHandler;

#pragma mark -

- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation completionHandler:(void(^)())completionHandler;
- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation completionHandler:(void(^)())completionHandler;

#pragma mark -

- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation completionHandler:(void(^)())completionHandler;
- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation completionHandler:(void(^)())completionHandler;

#pragma mark -

- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath completionHandler:(void(^)())completionHandler;
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection completionHandler:(void(^)())completionHandler;

@end
