//
//  TimerFlipsideViewController.h
//  Timer
//
//  Created by Sebastian Brown on 14/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@class TimerFlipsideViewController;


@protocol TimerFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(TimerFlipsideViewController *)controller;
@end



@interface TimerFlipsideViewController : UIViewController
{
    
    __weak IBOutlet UISwitch *ringForeverSwitch;

    
}


@property (weak, nonatomic) id <TimerFlipsideViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *ringerDurationLabel;
@property (weak, nonatomic) IBOutlet UITextField *ringerDurationTextFieldOutlet;
- (IBAction)ringerDurationTextFieldAction:(id)sender;

@end
