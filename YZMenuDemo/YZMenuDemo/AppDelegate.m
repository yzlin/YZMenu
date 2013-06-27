//
//  AppDelegate.m
//  YZMenuDemo
//
//  Created by Yi-Jheng Lin on 2/25/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import "RootViewController.h"

#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    RootViewController *rootViewController = [RootViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
