//
//  ViewController.m
//  DVNotificationsExample
//
//  Created by Dave van Dugteren on 16/03/2015.
//  Copyright (c) 2015 David van Dugteren. All rights reserved.
//

#import "ViewController.h"
#import "DVNotification.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (void) viewDidAppear:(BOOL)animated{
	[DVNotification setNotificationBackgroundColour: [UIColor redColor]];
	[DVNotification showNotificationWithText: @"Example message one.  Tap here and dimiss me!"];
	[DVNotification showNotificationWithText: @"Message 2"];
	[DVNotification showNotificationWithText: @"Message 3"];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
