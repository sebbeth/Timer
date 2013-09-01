//
//  TimerMainViewController.m
//  Timer
//
//  Created by Sebastian Brown on 14/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimerMainViewController.h"

#define TAG_Button

@interface TimerMainViewController ()


@end


@implementation TimerMainViewController
@synthesize toolBar;
@synthesize StopBOutlet;
@synthesize startOutlet;
@synthesize resetOutlet;
@synthesize secsLabel;
@synthesize minsLabel;
@synthesize hoursLabel;
@synthesize TotalF;
@synthesize timeElapsedF;
@synthesize timeLeftF;

int totalHours = 00;
int totalMins = 00;
int totalSeconds = 00;
BOOL DONE = 0;
NSInteger ring4Ever = 0;
int returnOfPickerComponent0;
int returnOfPickerComponent1;
int returnOfPickerComponent2;
int returnOfPickerInSeconds;
int AlertNoOFLoops = -1;

int timeTotal;


- (void)countup {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSInteger timeTotal = [prefs integerForKey:@"integerKey"];
    Seconds -= 1;
    
    int leftHours = Seconds / 3600, 
    remainder = Seconds % 3600, 
    leftMinutes = remainder / 60, 
    leftSeconds = remainder % 60;
    
    timeLeftF.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", leftHours, leftMinutes, leftSeconds];
    int timeElapsed = timeTotal - Seconds;
    
    int elapsedtHours = timeElapsed / 3600, 
    elapsedremainder = timeElapsed % 3600, 
    elapsedMinutes = elapsedremainder / 60, 
    elapsedSeconds = elapsedremainder % 60;
    
    timeElapsedF.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", elapsedtHours, elapsedMinutes, elapsedSeconds];
    if (Seconds == 0) {
        [timer invalidate];
        timer = nil;
        DONE = 1;
    }
        if (DONE == 1){
            NSLog(@"timer done!!!");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Timer done" message:@"" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            [alert show];
            [audioPlayer play];
            DONE = 0;

            startOutlet.enabled = YES;
            StopBOutlet.enabled = NO;
        }
    }


-(void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
        NSLog(@"button pressed");
    [audioPlayer stop];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSInteger timeTotal = [prefs integerForKey:@"integerKey"];            //recall permi-memory

    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Alert chime.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = AlertNoOFLoops; 
    [audioPlayer prepareToPlay];
    
    secsLabel.hidden = YES;
    minsLabel.hidden = YES;
    hoursLabel.hidden = YES;
    resetOutlet.hidden = YES;
    Picker.hidden = YES;
    toolBar.hidden = YES;
    StopBOutlet.enabled =NO;
        
    
    pickerArray = [[NSMutableArray alloc] init];
    [pickerArray addObject:@" 00 "];
    [pickerArray addObject:@" 01 "];
    [pickerArray addObject:@" 02 "];
    [pickerArray addObject:@" 03 "];
    [pickerArray addObject:@" 04 "];
    [pickerArray addObject:@" 05 "];
    [pickerArray addObject:@" 06 "];
    [pickerArray addObject:@" 07 "];
    [pickerArray addObject:@" 08 "];
    [pickerArray addObject:@" 09 "];
    [pickerArray addObject:@" 10 "];
    [pickerArray addObject:@" 11 "];
    [pickerArray addObject:@" 12 "];
    [pickerArray addObject:@" 13 "];
    [pickerArray addObject:@" 14 "];
    [pickerArray addObject:@" 15 "];
    [pickerArray addObject:@" 16 "];
    [pickerArray addObject:@" 17 "];
    [pickerArray addObject:@" 18 "];
    [pickerArray addObject:@" 19 "];
    
    [pickerArray addObject:@" 20 "];
    [pickerArray addObject:@" 21 "];
    [pickerArray addObject:@" 22 "];
    [pickerArray addObject:@" 23 "];
    [pickerArray addObject:@" 24 "];
    [pickerArray addObject:@" 25 "];
    [pickerArray addObject:@" 26 "];
    [pickerArray addObject:@" 27 "];
    [pickerArray addObject:@" 28 "];
    [pickerArray addObject:@" 29 "];
    [pickerArray addObject:@" 30 "];
    [pickerArray addObject:@" 31 "];
    [pickerArray addObject:@" 32 "];
    [pickerArray addObject:@" 33 "];
    [pickerArray addObject:@" 34 "];
    [pickerArray addObject:@" 35 "];
    [pickerArray addObject:@" 36 "];
    [pickerArray addObject:@" 37 "];
    [pickerArray addObject:@" 38 "];
    [pickerArray addObject:@" 39 "];
    [pickerArray addObject:@" 40 "];
    [pickerArray addObject:@" 41 "];
    [pickerArray addObject:@" 42 "];
    [pickerArray addObject:@" 43 "];
    [pickerArray addObject:@" 44 "];
    [pickerArray addObject:@" 45 "];
    [pickerArray addObject:@" 46 "];
    [pickerArray addObject:@" 47 "];
    [pickerArray addObject:@" 48 "];
    [pickerArray addObject:@" 49 "];
    [pickerArray addObject:@" 50 "];
    [pickerArray addObject:@" 51 "];
    [pickerArray addObject:@" 52 "];
    [pickerArray addObject:@" 53 "];
    [pickerArray addObject:@" 54 "];
    [pickerArray addObject:@" 55 "];
    [pickerArray addObject:@" 56 "];
    [pickerArray addObject:@" 57 "];
    [pickerArray addObject:@" 58 "];
    [pickerArray addObject:@" 59 "];
    [pickerArray addObject:@" 60 "];

    
    
    int totalHours = timeTotal / 3600,
    totalremainder = timeTotal % 3600, 
    totalMinutes = totalremainder / 60, 
    totalSeconds = totalremainder % 60;
    
    self.TotalF.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", totalHours, totalMinutes, totalSeconds];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidUnload
{
    [self setTotalF:nil];
    [self setTimeElapsedF:nil];
    [self setTimeLeftF:nil];
    [self setStopBOutlet:nil];
    [self setToolBar:nil];
    Picker = nil;
    [self setStartOutlet:nil];
    [self setResetOutlet:nil];
    [self setSecsLabel:nil];
    [self setMinsLabel:nil];
    [self setHoursLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//Picker stuff

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)Picker;
{
    return 3;
}



- (void)pickerView:(UIPickerView *)Picker didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
   returnOfPickerComponent0 = [Picker selectedRowInComponent:0];
    returnOfPickerComponent1 = [Picker selectedRowInComponent:1];
    returnOfPickerComponent2 = [Picker selectedRowInComponent:2];

}





- (NSInteger)pickerView:(UIPickerView *)Picker numberOfRowsInComponent:(NSInteger)component;
{
    return [pickerArray count];
}

- (NSString *)pickerView:(UIPickerView *)Picker titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [pickerArray objectAtIndex:row];
}


// end of picker stuff

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(TimerFlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (IBAction)StartB:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSInteger timeTotal = [prefs integerForKey:@"integerKey"];            //recall permi-memory
    Seconds = timeTotal;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countup) userInfo: nil repeats:YES];
    resetOutlet.hidden = YES;
    startOutlet.enabled = NO;
    StopBOutlet.enabled = YES;
    [startOutlet setTitle:@"Start" forState:UIControlStateNormal];

    //startOutlet. = [NSString stringWithFormat:@"continue"];
    
}

- (IBAction)StopB:(id)sender {
    [startOutlet setTitle:@"Continue" forState:UIControlStateNormal];

    [timer invalidate];
    timer = nil;
    resetOutlet.hidden = NO;
    startOutlet.enabled = YES;
 //   StopBOutlet.titleLabel = [NSString stringWithFormat:@"Reset"];
}



- (IBAction)changeTime:(id)sender {
    Picker.hidden = NO;
    toolBar.hidden = NO;
    secsLabel.hidden = NO;
    minsLabel.hidden = NO;
    hoursLabel.hidden = NO;
    startOutlet.enabled = NO;
}

- (IBAction)Reset:(id)sender {
    [startOutlet setTitle:@"Start" forState:UIControlStateNormal];
    [timer invalidate];
    timer = nil;
    timeElapsedF.text = nil;
    timeLeftF.text = nil;
    resetOutlet.hidden = YES;
    startOutlet.enabled = YES;


}

- (IBAction)pickerDone:(id)sender {
    returnOfPickerInSeconds = (returnOfPickerComponent2 + (returnOfPickerComponent0 * 3600) + (returnOfPickerComponent1 * 60));
    timeTotal = returnOfPickerInSeconds;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];  // commit to permi-memory
    
    
    [prefs setInteger: timeTotal forKey:@"integerKey"];
    
    [prefs synchronize];
    
    int totalHours = timeTotal / 3600, 
    totalremainder = timeTotal % 3600, 
    totalMinutes = totalremainder / 60, 
    totalSeconds = totalremainder % 60;
    self.TotalF.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", totalHours, totalMinutes, totalSeconds];
    Picker.hidden = YES;
    toolBar.hidden = YES;
    secsLabel.hidden = YES;
    minsLabel.hidden = YES;
    hoursLabel.hidden = YES;
    startOutlet.enabled = YES;

}


@end

