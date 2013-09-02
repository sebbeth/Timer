//
//  TimerFlipsideViewController.m
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

#import "TimerFlipsideViewController.h"

@interface TimerFlipsideViewController ()

@end

@implementation TimerFlipsideViewController

@synthesize delegate = _delegate;
@synthesize ringerDurationLabel = _ringerDurationLabel;
@synthesize ringerDurationTextFieldOutlet = _ringerDurationTextFieldOutlet;

bool switchIsOn = 1;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [ringForeverSwitch addTarget:self action:@selector(onRoff) forControlEvents:UIControlEventValueChanged];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    
    [self setRingerDurationLabel:nil];
    [self setRingerDurationTextFieldOutlet:nil];
    ringForeverSwitch = nil;
    ringForeverSwitch = nil;
    [super viewDidUnload];

    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions


- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
    NSLog(@"%i", switchIsOn);

}


-(void)onRoff { 
    
    if(ringForeverSwitch.on) { 
        switchIsOn = 1;
        _ringerDurationTextFieldOutlet.hidden = YES;
        _ringerDurationLabel.hidden = YES;
        
    } 
    
    else { 
        switchIsOn = 0;
        _ringerDurationTextFieldOutlet.hidden = NO;
        _ringerDurationLabel.hidden = NO;
    } 
    
}
- (IBAction)ringerDurationTextFieldAction:(id)sender {
}
@end
