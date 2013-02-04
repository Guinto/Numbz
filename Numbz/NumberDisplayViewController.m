//
//  NumberDisplayViewController.m
//  Numbz
//
//  Created by Trent Ellingsen on 2/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "NumberDisplayViewController.h"

@interface NumberDisplayViewController ()

@property (nonatomic) NSInteger representedNumber;

@end

@implementation NumberDisplayViewController

#define LARGEST_DIGIT 100
- (void)setRepresentedNumber:(NSInteger)representedNumber
{
	_representedNumber = representedNumber;
	self.number.text = [NSString stringWithFormat:@"%d", self.representedNumber];
}

- (IBAction)numberPressed:(UIButton *)sender
{
	if (self.representedNumber > LARGEST_DIGIT) {
		NSString *currentValueString = [NSString stringWithFormat:@"%d", self.representedNumber];
		currentValueString = [currentValueString substringFromIndex:1];
		self.representedNumber = [currentValueString integerValue];
	}
	self.representedNumber *= 10;
	self.representedNumber += [sender.titleLabel.text integerValue];
}

- (IBAction)handleTap:(UITapGestureRecognizer *)sender {
	for (UIView *view in [self.view subviews]) {
		if ([view isKindOfClass:[UIButton class]]) {
			[UIView animateWithDuration:0.5 animations:^{
				view.alpha = 1;
			}];
		}
	}
}

- (IBAction)donePressed
{
	for (UIView *view in [self.view subviews]) {
		if ([view isKindOfClass:[UIButton class]]) {
			[UIView animateWithDuration:0.5 animations:^{
				view.alpha = 0;
			}];
		}
	}
}

- (IBAction)clearPressed
{
	self.representedNumber = 0;
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)sender
{
	BOOL pannedRight = [sender translationInView:self.view].x > 0;
	if (sender.state == UIGestureRecognizerStateBegan && pannedRight) {
		[self.navigationController popViewControllerAnimated:YES];
	}
}

@end
