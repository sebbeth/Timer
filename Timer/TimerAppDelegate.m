//
//  TimerAppDelegate.m
//  Timer
//
//  Created by Sebastian Brown on 14/05/12.
/*
█▀▀▀▀▀█ █  ▄▄▄▀▀█ █▀▀▀▀▀█
█ ███ █ ██▄ █▄▀ ▄ █ ███ █
█ ▀▀▀ █ ▄██ ▀ ▀▀█ █ ▀▀▀ █
▀▀▀▀▀▀▀ ▀ █▄▀ █ █ ▀▀▀▀▀▀▀
██ ▄█▀▀ ▄ ▀ ▀▄ ▄▄  ▀▄█▀█▀
 ████▄▀▀██▀ ▄▀▄▀▀▀▀█▀▀█▄ 
█  ▄ ▀▀▄█ ▄▀█▄▄█ █▀▀▄▀▀█▀
  ▀ █▄▀▄ ███  █▀█▄ ██▀█▄ 
▀▀  ▀▀▀▀█  █▀▄▄ █▀▀▀█▀▀  
█▀▀▀▀▀█ ▄ ▀█▄▀  █ ▀ █▄▄▄▄
█ ███ █ ▀▄▀▄ ▄▄▄▀███▀▀█▄▄
█ ▀▀▀ █ ▄▀▄██▀  ▀██▄▄█▄█ 
▀▀▀▀▀▀▀ ▀   ▀  ▀  ▀   ▀▀▀
Matthew 5:5
Colossians 1:16
Objective - C Just do it!

*/
//  Copyright (c) 2012 Sebastian Brown. All rights reserved.

#import "TimerAppDelegate.h"


@implementation TimerAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    backgroundTask = [application beginBackgroundTaskWithExpirationHandler: ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (backgroundTask != UIBackgroundTaskInvalid)
            {
                [application endBackgroundTask:backgroundTask];
                backgroundTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [NSThread sleepForTimeInterval:3];
        // do stuff
        backgroundTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countup) userInfo: nil repeats:YES];

        NSLog(@"Time remaining: %f",[application backgroundTimeRemaining]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (backgroundTask != UIBackgroundTaskInvalid)
            {
                // if you don't call endBackgroundTask, the OS will exit your app.
                [application endBackgroundTask:backgroundTask];
                backgroundTask = UIBackgroundTaskInvalid;
            }
        });
    });
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
