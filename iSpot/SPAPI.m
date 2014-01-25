//
//  SPAPI.m
//  iSpot
//
//  Created by Nicholas Otter on 1/24/14.
//  Copyright (c) 2014 Nicholas Otter. All rights reserved.
//

#import "SPAPI.h"

@implementation SPAPI {
    NSURLConnection * _connection;
    NSMutableData * _responseData;
    NSURL * _myURL;
    NSMutableURLRequest * _request;

    UILabel * _label;
}

- (id) initWithLabel:(UILabel *)label {
    self = [self init];

    if (self) {
        _label = label;
        
        _myURL = [NSURL URLWithString:@"http://dj.nickotter.com:5051/playing"];
        
        
        _request = [NSMutableURLRequest requestWithURL:_myURL];
        
        _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self /*startImmediately:NO*/];
        
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
    [_label setText:@"Unable to fetch data"];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Succeeded! Received %d bytes of data",[_responseData
                                                   length]);
    [_label setText:[[NSString alloc] initWithData:_responseData encoding: NSASCIIStringEncoding]];
    
}

@end
