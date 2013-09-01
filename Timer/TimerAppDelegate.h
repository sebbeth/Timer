//
//  TimerAppDelegate.h
//  Timer
//
//  Created by Sebastian Brown on 14/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerAppDelegate : UIResponder <UIApplicationDelegate> {
    NSTimer *backgroundTimer;
    UIBackgroundTaskIdentifier backgroundTask;
    
}

@property (strong, nonatomic) UIWindow *window;

@end
