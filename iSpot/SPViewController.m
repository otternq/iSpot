//
//  SPViewController.m
//  iSpot
//
//  Created by Nicholas Otter on 1/24/14.
//  Copyright (c) 2014 Nicholas Otter. All rights reserved.
//

#import "SPViewController.h"
#import "SPAPI.h"
#import "SPAPIControl.h"

@interface SPViewController ()

@end

@implementation SPViewController {
    SPAPI * req;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadAux];
    
    //req = [[SPAPI alloc] initWithLabel:_songInfo];

    [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(loadAux) userInfo:nil repeats:YES];
    
}

#pragma mark SpotAux

- (void) loadAux {
    [self loadImage];
    [self loadData];
}

- (void) loadData {
    
    //(void) req.run;
    [[SPAPI alloc] initWithLabel:_songInfo];
    
}

- (void) loadImage {
    NSString * imgURL = @"http://dj.nickotter.com:5051/playing.png";
    NSLog(@"Loading image from url: %@", imgURL);
    
    _imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButton:(id)sender {
    NSLog(@"Pressed play button");
    
    [[SPAPIControl alloc] initWithEndpoint:@"http://dj.nickotter.com:5051/play" method:@"PUT"];
}

- (IBAction)pauseButton:(id)sender {
    NSLog(@"Pressed play button");
    
    [[SPAPIControl alloc] initWithEndpoint:@"http://dj.nickotter.com:5051/pause" method:@"PUT"];
}


- (IBAction)nextButton:(id)sender {
    NSLog(@"Pressed play button");
    
    [[SPAPIControl alloc] initWithEndpoint:@"http://dj.nickotter.com:5051/next" method:@"PUT"];
}

- (IBAction)backButton:(id)sender {
    NSLog(@"Pressed play button");
    
    [[SPAPIControl alloc] initWithEndpoint:@"http://dj.nickotter.com:5051/back" method:@"PUT"];
}


@end
