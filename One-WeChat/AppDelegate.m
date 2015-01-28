//
//  AppDelegate.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/25.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //此处判断userDefaults中是否存在用户名和密码，如果存在并且通过网络请求,根视图控制器指定为MainViewController，否则根视图控制器为loginViewController
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * username = [userDefaults stringForKey:@"username"];
    NSString * password = [userDefaults stringForKey:@"password"];
    NSString * storyBoardID = nil;
    if (username != nil && password != nil)
    {
        if ([@"admin" isEqualToString:username] && [@"admin" isEqualToString:password])
        {
            storyBoardID = @"tabVC";
        }
        else
        {
            storyBoardID = @"indexVC";
        }
    }
    else
    {
        storyBoardID=@"indexVC";
    }
    
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController * VC =[sb instantiateViewControllerWithIdentifier:storyBoardID];
    self.window.rootViewController=VC;
    
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
