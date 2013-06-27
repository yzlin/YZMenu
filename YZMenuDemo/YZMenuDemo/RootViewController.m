//
//  RootViewController.m
//  YZMenuDemo
//
//  Created by Yi-Jheng Lin on 2/26/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import "YZMenu.h"
#import "YZMenuItem.h"

#import "RootViewController.h"

@implementation RootViewController


- (void)viewDidLoad
{
    YZMenuItem *homeItem = [[YZMenuItem alloc] initWithTitle:@"Home"
                                                       image:[UIImage imageNamed:@"icon_home"]
                                            highlightedImage:nil
                                                      action:^(YZMenuItem *item) {
                                                          NSLog(@"Item: %@", item);
                                                      }];
    
    YZMenuItem *exploreItem = [[YZMenuItem alloc] initWithTitle:@"Search"
                                                          image:[UIImage imageNamed:@"icon_search"]
                                               highlightedImage:nil
                                                         action:^(YZMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                         }];
    
    YZMenuItem *activityItem = [[YZMenuItem alloc] initWithTitle:@"Starred"
                                                           image:[UIImage imageNamed:@"icon_starred"]
                                                highlightedImage:nil
                                                          action:^(YZMenuItem *item) {
                                                              NSLog(@"Item: %@", item);
                                                          }];
    
    YZMenuItem *profileItem = [[YZMenuItem alloc] initWithTitle:@"Favorite"
                                                          image:[UIImage imageNamed:@"icon_favorite"]
                                               highlightedImage:nil
                                                         action:^(YZMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                         }];

    _menu = [[YZMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:179 / 255.0 blue:134 / 255.0 alpha:1];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self
                                                                            action:@selector(showMenu)];
}

- (void)showMenu
{
    if (_menu.isOpen) return [_menu close];

    [_menu showFromNavigationController:self.navigationController];
}

@end
