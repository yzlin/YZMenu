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

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    RootViewController *rootViewController = [RootViewController new];
    self.window.rootViewController = [[[UINavigationController alloc] initWithRootViewController:rootViewController] autorelease];
    [rootViewController release];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
