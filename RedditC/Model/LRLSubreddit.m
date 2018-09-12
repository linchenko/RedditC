//
//  LRLSubreddit.m
//  RedditC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLSubreddit.h"

@implementation LRLSubreddit

-(instancetype)initWithDictionary:(NSDictionary *)postDictionary
//1) Pull all the values out of the dictionary & make sure they're the right type
//2) Initialize a Model Object from the values we've pulled out of the json dictionary
{
    //1) Pull all the values out of the dictionary

    NSString *title = postDictionary[@"data"][@"title"];
    NSNumber *likeCount = postDictionary[@"data"][@"ups"];
    NSNumber *commentCount = postDictionary[@"data"][@"num_comments"];
    NSString *imageURLString = postDictionary[@"data"][@"thumbnail"];
    
    //1.5) Make sure they're the right type
    
    if (![title isKindOfClass:[NSString class]] || !(title) || ![likeCount isKindOfClass:[NSNumber class]] || ![commentCount isKindOfClass:[NSNumber class]])
    {
        return nil;
    }
    //2) Initialize a Model Object from the values we've pulled out of the json dictionary
    self = [super init];
    if (self)
    {
        _title = title;
        _likeCount = likeCount;
        _commentCount = commentCount;
        _imageURLString = imageURLString;
    }
    
    return self;

    
}



@end
