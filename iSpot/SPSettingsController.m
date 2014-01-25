//
//  SPSettingsController.m
//  iSpot
//
//  Created by Nicholas Otter on 1/24/14.
//  Copyright (c) 2014 Nicholas Otter. All rights reserved.
//

#import "SPSettingsController.h"

@implementation SPSettingsController

- (void) viewDidLoad {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString * host = [defaults objectForKey:@"spotURL"];
    
    if (host != NULL) {
        [_urlInput setText:host];
    }
}

- (IBAction)saveButton:(id)sender {
    
    NSLog(@"Enter Save Button");
    
    NSString *spotUrl = [_urlInput text];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:spotUrl forKey:@"spotURL"];
    [defaults synchronize];
    NSLog(@"Data saved: %@", spotUrl);

}

@end
