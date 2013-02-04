//
//  ViewController.m
//  Numbz
//
//  Created by Trent Ellingsen on 2/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "StartWatchViewController.h"

@interface StartWatchViewController ()

@property (nonatomic) NSInteger time;
@property (nonatomic) BOOL started;
@property (nonatomic) NSTimer *timer;

// Colors
@property (nonatomic, readonly) UIColor *stopColor;
@property (nonatomic, readonly) UIColor *goColor;

@end

@implementation StartWatchViewController

- (UIColor *)goColor
{
	return [UIColor colorWithRed:0.65 green:1.0 blue:0.0 alpha:1.0];
}

- (UIColor *)stopColor
{
	return [UIColor colorWithRed:1.0 green:0.45 blue:0.25 alpha:1.0];
}

- (void)setTime:(NSInteger)time
{
	_time = time;
	self.counter.text = [NSString stringWithFormat:@"%d", time];
}

- (void)update
{
	self.time++;
}

- (IBAction)handleTap:(UITapGestureRecognizer *)sender
{
	if (!self.started)
	{
		NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:0.0];
		self.timer = [[NSTimer alloc] initWithFireDate:fireDate
												  interval:1.0
													target:self
												  selector:@selector(update)
												  userInfo:nil
												   repeats:YES];
		[[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
		self.view.backgroundColor = self.goColor;
	}
	else
	{
		[self.timer invalidate];
		self.view.backgroundColor = self.stopColor;
	}
	self.started = !self.started;
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)sender
{
	BOOL pannedLeft = [sender translationInView:self.view].x < 0;
	if (sender.state == UIGestureRecognizerStateBegan && pannedLeft) {
		[self performSegueWithIdentifier:@"showRandom" sender:self];
	}
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (motion == UIEventSubtypeMotionShake)
	{
		self.started = NO;
		[self.timer invalidate];
		self.time = 0;
		self.view.backgroundColor = self.stopColor;
	}
}

- (BOOL)canBecomeFirstResponder
{
	return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = self.stopColor;
	self.time = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
