//
//  LRLNetworkingClient.m
//  RedditC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLSubredditClient.h"

@implementation LRLSubredditClient

+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void(^)(NSArray<LRLSubreddit*> * _Nullable post))block
{
    
    NSURL *baseURL = [NSURL URLWithString:@"https://www.reddit.com/r/"];
    NSURL * url = [baseURL URLByAppendingPathComponent:title];
    url = [url URLByAppendingPathExtension:@"json"];
//    NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:@"sol" value:@"45"];
//    NSURLQueryItem *queryItem2 = [[NSURLQueryItem alloc] initWithName:@"api_key" value:@"4afsdf9-095"];
//
//    NSURLComponents *componenets = [[NSURLComponents alloc]initWithURL:url resolvingAgainstBaseURL:true];
//    componenets.queryItems = [[NSArray alloc]initWithObjects:queryItem, queryItem2, nil];
//    NSURL * urlWithQueryItems = componenets.URL;
    
    
    
    NSLog(@"%@", [url absoluteString]);
    
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error fetching all subreddits for the title %@, %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        if (!data){
            NSLog(@"No data returned");
            block(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *childrenArray = jsonDictionary[@"data"][@"children"];
        NSMutableArray *subreddits = [[NSMutableArray alloc] init];
        for (NSDictionary * postDictionary in childrenArray){
            LRLSubreddit * post = [[LRLSubreddit alloc] initWithDictionary:postDictionary];
            [subreddits addObject:post];
            
        }
        block(subreddits);
        
    }]resume];
}


+(void)fetchImageDataForURL:(NSString *)imageURLString withBlock:(void(^)(NSData * _Nullable imageData))block
{
    NSURL * url = [NSURL URLWithString:imageURLString];
    NSLog(@"%@", url);
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error fetching all subreddits for the title %@, %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        if (!data){
            NSLog(@"No data available");
            block(nil);
            return;
        }
        
        block(data);
        
        
    }]resume];
    
    
}


@end
