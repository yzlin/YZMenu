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

@property (weak, nonatomic) YZMenu *menu;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) YZMenuItem *item;

- (id)initWithFrame:(CGRect)frame menu:(YZMenu *)menu;

@end
