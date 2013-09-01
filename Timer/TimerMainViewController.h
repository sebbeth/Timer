//
//  TimerMainViewController.h
//  Timer
//
//  Created by Sebastian Brown on 14/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimerFlipsideViewController.h"
#import <AVFoundation/AVFoundation.h>

//int timeTotal = 10;

// int startTimeTotal = 10;

@interface TimerMainViewController : UIViewController <TimerFlipsideViewControllerDelegate> {
    
    AVAudioPlayer *audioPlayer;
    NSTimer *timer;
    int Seconds;
     NSMutableArray *pickerArray;
    __weak IBOutlet UIPickerView *Picker;
}
- (IBAction)StartB:(id)sender;
- (IBAction)StopB:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *TotalF;
@property (weak, nonatomic) IBOutlet UITextField *timeElapsedF;
@property (weak, nonatomic) IBOutlet UILabel *timeLeftF;
-(void)countup;
-(void)countUntill;
@property (weak, nonatomic) IBOutlet UIButton *StopBOutlet;
@property (weak, nonatomic) IBOutlet UIButton *startOutlet;
@property (weak, nonatomic) IBOutlet UIButton *resetOutlet;
@property (weak, nonatomic) IBOutlet UILabel *secsLabel;
@property (weak, nonatomic) IBOutlet UILabel *minsLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
extern NSInteger ring4Ever;
- (IBAction)totalFAction:(id)sender;
- (IBAction)changeTime:(id)sender;
- (IBAction)Reset:(id)sender;
- (IBAction)pickerDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end