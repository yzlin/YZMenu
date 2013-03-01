//
//  YZMenu.h
//  YZMenu
//
//  Created by Yi-Jheng Lin on 2/25/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZMenu : NSObject

@property (retain, readwrite, nonatomic) NSArray *items;
@property (assign, readonly, nonatomic) BOOL isOpen;

@property (assign, readwrite, nonatomic) CGFloat itemHeight;
@property (retain, readwrite, nonatomic) UIFont *font;
@property (retain, readwrite, nonatomic) UIColor *textColor;
@property (retain, readwrite, nonatomic) UIColor *highlighedTextColor;

- (id)initWithItems:(NSArray *)items;
- (void)showFromNavigationController:(UINavigationController *)navigationController;
- (void)close;

@end
