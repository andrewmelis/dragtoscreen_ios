//
//  ViewController.m
//  DragToScreen
//
//  Created by Andrew Melis on 12/8/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property BOOL colorBool;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self checkForExistingScreenAndInitializeIfPresent];
}


- (IBAction)onButtonPress:(UIButton *)sender {
    if (self.secondWindow) {
        NSLog(@"inside if statement");
        
        if (self.colorBool) {
            [[[self.secondWindow subviews] objectAtIndex:0] setBackgroundColor:[UIColor greenColor]];
        } else {
            [[[self secondWindow].subviews objectAtIndex:0] setBackgroundColor:[UIColor blueColor]];
        }
        
        self.colorBool = !self.colorBool;

    }
}

-(void)checkForExistingScreenAndInitializeIfPresent
{
    if ([[UIScreen screens] count] > 1)
    {
        //get the screen object that represents the external display
        UIScreen *secondScreen = [[UIScreen screens] objectAtIndex:1];
        
        //get the screen's bounds so that you can create a window of the correct size
        CGRect secondScreenBounds = secondScreen.bounds;
        
        //allocate and initalize second screen
        self.secondWindow = [[UIWindow alloc] initWithFrame:secondScreenBounds];
        self.secondWindow.screen = secondScreen;
        
        //set up initial content to display
        UIView *extView = [[UIView alloc] initWithFrame:secondScreenBounds];
        extView.backgroundColor = [UIColor redColor];
        
        [self.secondWindow addSubview:extView];
        
        //show the window
        self.secondWindow.hidden = NO;
        
    }
}

#pragma mark
#pragma memory management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
