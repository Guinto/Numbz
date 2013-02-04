//
//  RandomNumberGeneratorViewController.h
//  Numbz
//
//  Created by Trent Ellingsen on 2/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomNumberGeneratorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *number;

- (IBAction)handleTap:(UITapGestureRecognizer *)sender;
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender;

@end
