//
//  NumberDisplayViewController.m
//  Numbz
//
//  Created by Trent Ellingsen on 2/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "NumberDisplayViewController.h"

@interface NumberDisplayViewController ()

@end

@implementation NumberDisplayViewController

- (IBAction)handlePan:(UIPanGestureRecognizer *)sender
{
	BOOL pannedRight = [sender translationInView:self.view].x > 0;
	if (sender.state == UIGestureRecognizerStateBegan && pannedRight) {
		[self.navigationController popViewControllerAnimated:YES];
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
