//
//  YZMenu.m
//  YZMenu
//
//  Created by Yi-Jheng Lin on 2/25/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "YZMenuItem.h"
#import "YZMenuItemView.h"

#import "YZMenu.h"

@interface YZMenu () {
    NSMutableArray *_itemViews;
    UIView *_menuWrapperView;
}

@property (unsafe_unretained, readwrite, nonatomic) UINavigationController *navController;

@end

@implementation YZMenu

- (id)initWithItems:(NSArray *)items
{
    if (!(self = [super init])) return nil;

    _itemViews = [NSMutableArray new];

    self.items = items;
    for (YZMenuItem *item in items) {
        if (!item.hasTagSet) item.tag = [items indexOfObject:item];
    }
    self.itemHeight = 40;
    self.font = [UIFont boldSystemFontOfSize:18];
    self.textColor = [UIColor grayColor];
    self.highlighedTextColor = [UIColor redColor];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangeOrientation:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];

    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    _navController = nil;

    [_itemViews release];
    [_menuWrapperView release];
    [_items release];
    [_font release];
    [_textColor release];
    [_highlighedTextColor release];

    [super dealloc];
}

- (void)didChangeOrientation:(NSNotification *)notification
{
    if (_menuWrapperView) {
        CGRect frame = _menuWrapperView.frame;
        frame.origin.y = self.navController.navigationBar.frame.origin.y + self.navController.navigationBar.frame.size.height;
        _menuWrapperView.frame = frame;
    }
}

- (void)showFromNavigationController:(UINavigationController *)navigationController
{
    self.navController = navigationController;

    [_itemViews removeAllObjects];
    [_menuWrapperView removeFromSuperview];
    [_menuWrapperView release];
    _menuWrapperView = [UIView new];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [_menuWrapperView addSubview:button];

    CGFloat itemHeight = self.itemHeight;
    for (YZMenuItem *item in self.items) {
        YZMenuItemView *itemView = [[YZMenuItemView alloc] initWithFrame:CGRectMake(0, - itemHeight, navigationController.view.frame.size.width, itemHeight) menu:self];
        itemView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        itemView.autoresizesSubviews = YES;
        itemView.item = item;
        [_itemViews addObject:itemView];
        [_menuWrapperView addSubview:itemView];
        [itemView release];
    }

    _menuWrapperView.frame = CGRectMake(0,
                                        navigationController.navigationBar.frame.origin.y + navigationController.navigationBar.frame.size.height,
                                        navigationController.navigationBar.frame.size.width,
                                        navigationController.view.frame.size.height - navigationController.navigationBar.frame.origin.y - navigationController.navigationBar.frame.size.height);
    _menuWrapperView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _menuWrapperView.autoresizesSubviews = YES;
    _menuWrapperView.clipsToBounds = YES;

    button.frame = _menuWrapperView.bounds;

    [navigationController.view addSubview:_menuWrapperView];

    NSTimeInterval duration = 0.2;
    for (UIView *itemView in _itemViews) {
        NSInteger idx = [_itemViews indexOfObject:itemView];
        [UIView animateWithDuration:duration delay:duration / (idx + 1) options:0 animations:^{
            CGRect frame = itemView.frame;
            frame.origin.y = idx * itemHeight;
            itemView.frame = frame;
        } completion:nil];
    }

    _isOpen = YES;
}

- (void)close
{
    _isOpen = NO;

    [UIView animateWithDuration:0.1 animations:^{
        for (UIView *itemView in _itemViews) {
            NSInteger idx = [_itemViews indexOfObject:itemView];
            CGRect frame = itemView.frame;
            frame.origin.y += 8 * idx;
            itemView.frame = frame;
        }
    } completion:^(BOOL finished) {
        NSTimeInterval duration = 0.2;
        for (UIView *itemView in _itemViews) {
            [UIView animateWithDuration:duration animations:^{
                CGRect frame = itemView.frame;
                frame.origin.y -= 2 * self.itemHeight;
                itemView.frame = frame;
                itemView.alpha = 0.0;
            } completion:nil];
        }
    }];
}

@end
