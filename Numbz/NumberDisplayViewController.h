//
//  NumberDisplayViewController.h
//  Numbz
//
//  Created by Trent Ellingsen on 2/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberDisplayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *number;

- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)handleTap:(UITapGestureRecognizer *)sender;
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender;
- (IBAction)donePressed;
- (IBAction)clearPressed;

@end
