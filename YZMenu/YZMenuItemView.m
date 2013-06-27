//
//  YZMenuItemView.m
//  YZMenu
//
//  Created by Yi-Jheng Lin on 2/25/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import "YZMenu.h"
#import "YZMenuItem.h"

#import "YZMenuItemView.h"

@implementation YZMenuItemView

- (id)initWithFrame:(CGRect)frame menu:(YZMenu *)menu
{
    if (!(self = [super initWithFrame:frame])) return nil;

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, frame.size.height)];
    titleLabel.contentMode = UIViewContentModeCenter;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.titleLabel = titleLabel;
    [self addSubview:self.titleLabel];

    self.imageView = [[UIImageView alloc] initWithFrame:CGRectNull];
    [self addSubview:self.imageView];

    self.menu = menu;

    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat imageOffset = (self.frame.size.height - self.item.image.size.height) / 2.0;
    self.imageView.image = self.item.image;
    self.imageView.frame = CGRectMake(imageOffset, imageOffset, self.item.image.size.width, self.item.image.size.height);
    self.titleLabel.font = self.menu.font;
    self.titleLabel.text = self.item.title;
    self.titleLabel.textColor = self.menu.textColor;
    CGRect frame = self.titleLabel.frame;
    frame.origin.x = imageOffset;
    if (self.imageView.image) frame.origin.x += self.imageView.frame.origin.x + self.imageView.frame.size.width;
    self.titleLabel.frame = frame;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.imageView.image = self.item.highlightedImage ?: self.item.image;
    self.titleLabel.textColor = self.menu.highlighedTextColor;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.imageView.image = self.item.image;
    self.titleLabel.textColor = self.menu.textColor;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.imageView.image = self.item.image;
    self.titleLabel.textColor = self.menu.textColor;
    [self.menu close];
    if (self.item.action) self.item.action(self.item);
}

@end
