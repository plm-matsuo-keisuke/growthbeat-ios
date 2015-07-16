//
//  AppDelegate.m
//  GrowthbeatSample
//
//  Created by Kataoka Naoyuki on 2014/08/10.
//  Copyright (c) 2014年 SIROK, Inc. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[Growthbeat sharedInstance] initializeWithApplicationId:@"P5C3vzoLOEijnlVj" credentialId:@"btFlFAitBJ1CBdL3IR3ROnhLYbeqmLlY"];
    [[GrowthLink sharedInstance] initializeWithApplicationId:@"P5C3vzoLOEijnlVj" credentialId:@"btFlFAitBJ1CBdL3IR3ROnhLYbeqmLlY"];
    [[GrowthPush sharedInstance] requestDeviceToken];
    return YES;
}

- (void) applicationDidBecomeActive:(UIApplication *)application {
    [[Growthbeat sharedInstance] start];
}

- (void) applicationWillResignActive:(UIApplication *)application {
    [[Growthbeat sharedInstance] stop];
}

- (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [[GrowthLink sharedInstance] handleOpenUrl:url];
    return YES;
}

- (void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[GrowthPush sharedInstance] setDeviceToken:deviceToken];
}

@end
