//
//  YZMenuItem.h
//  YZMenu
//
//  Created by Yi-Jheng Lin on 2/25/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZMenuItem : NSObject

@property (copy, readwrite, nonatomic) NSString *title;
@property (retain, readwrite, nonatomic) UIImage *image;
@property (retain, readwrite, nonatomic) UIImage *highlightedImage;
@property (copy, readwrite, nonatomic) void (^action)(YZMenuItem *item);
@property (assign, readwrite, nonatomic) NSInteger tag;
@property (assign, readonly, nonatomic) BOOL hasTagSet;

- (id)initWithTitle:(NSString *)title
              image:(UIImage *)image
   highlightedImage:(UIImage *)higlightedImage
             action:(void (^)(YZMenuItem *item))action;

@end
