//
//  YZMenuItemView.h
//  YZMenu
//
//  Created by Yi-Jheng Lin on 2/25/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZMenu;
@class YZMenuItem;

@interface YZMenuItemView : UIView

@property (unsafe_unretained, nonatomic) YZMenu *menu;
@property (retain, nonatomic) UILabel *titleLabel;
@property (retain, nonatomic) UIImageView *imageView;
@property (retain, nonatomic) YZMenuItem *item;

- (id)initWithFrame:(CGRect)frame menu:(YZMenu *)menu;

@end
