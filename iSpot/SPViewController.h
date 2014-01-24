//
//  SPViewController.h
//  iSpot
//
//  Created by Nicholas Otter on 1/24/14.
//  Copyright (c) 2014 Nicholas Otter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *playButton;
- (IBAction)playButtonTapped:(UIButton *)sender;

@end
