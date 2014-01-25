//
//  SPAPIControl.m
//  iSpot
//
//  Created by Nicholas Otter on 1/24/14.
//  Copyright (c) 2014 Nicholas Otter. All rights reserved.
//

#import "SPAPIControl.h"

@implementation SPAPIControl {
    NSURLConnection * _connection;
    NSMutableData * _responseData;
    NSURL * _myURL;
    NSMutableURLRequest * _request;
}

- (id) initWithEndpoint:(NSString *)endpoint method:(NSString *)method {
    self = [self init];
    
    if (self) {
        
        _myURL = [NSURL URLWithString:endpoint];
        
        
        _request = [NSMutableURLRequest requestWithURL:_myURL];
        [_request setHTTPMethod:method];
        
        _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
        
    }
    
    return self;
}

- (void)run {
    
    [_connection start];
    
}

#pragma mark HttpRequests

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Unable to fetch data");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Succeeded! Received %d bytes of data",[_responseData
                                                   length]);
    
}


@end
