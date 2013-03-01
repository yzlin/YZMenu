//
//  YZMenuItem.m
//  YZMenu
//
//  Created by Yi-Jheng Lin on 2/25/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import "YZMenuItem.h"

@interface YZMenuItem ()

@property (assign, readwrite, nonatomic) BOOL hasTagSet;

@end

@implementation YZMenuItem

- (id)initWithTitle:(NSString *)title
              image:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
             action:(void (^)(YZMenuItem *))action
{
    if (!(self = [super init])) return nil;

    self.title = title;
    self.image = image;
    self.highlightedImage = highlightedImage;
    self.action = action;
    self.hasTagSet = NO;

    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<title: %@, tag: %i>", self.title, self.tag];
}

- (void)setTag:(NSInteger)tag
{
    self.hasTagSet = YES;
    _tag = tag;
}

@end
