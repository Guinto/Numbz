//
//  RandomNumberGeneratorViewController.m
//  Numbz
//
//  Created by Trent Ellingsen on 2/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "RandomNumberGeneratorViewController.h"
#import <math.h>

@interface RandomNumberGeneratorViewController ()

@property (nonatomic) NSInteger randomNumber;

@end

@implementation RandomNumberGeneratorViewController

- (void)setRandomNumber:(NSInteger)randomNumber
{
	_randomNumber = randomNumber;
	self.number.text = [NSString stringWithFormat:@"%d", randomNumber];
}


#define HIGHEST_NUMBER 999
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (motion == UIEventSubtypeMotionShake)
	{
		self.randomNumber = arc4random_uniform(HIGHEST_NUMBER);
	}
}

- (BOOL)canBecomeFirstResponder
{
	return YES;
}

- (IBAction)handleTap:(UITapGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateEnded) {
		self.randomNumber = arc4random_uniform(HIGHEST_NUMBER);
	}
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)sender
{
	BOOL pannedRight = [sender translationInView:self.view].x > 0;
	if (sender.state == UIGestureRecognizerStateBegan && pannedRight) {
		[self.navigationController popViewControllerAnimated:YES];
	}
	
	BOOL pannedLeft = [sender translationInView:self.view].x < 0;
	if (sender.state == UIGestureRecognizerStateBegan && pannedLeft) {
		[self performSegueWithIdentifier:@"showNumberDisplay" sender:self];
	}
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.randomNumber = arc4random_uniform(HIGHEST_NUMBER);
}

@end
