//
//  SPAPIControl.h
//  iSpot
//
//  Created by Nicholas Otter on 1/24/14.
//  Copyright (c) 2014 Nicholas Otter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPAPIControl : NSObject

- (id) initWithEndpoint:(NSString *)endpoint method:(NSString *)method;

@end
