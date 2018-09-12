//
//  LRLNetworkingClient.h
//  RedditC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRLSubreddit.h"

@interface LRLSubredditClient : NSObject

+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void(^)(NSArray<LRLSubreddit*> * _Nullable post))block;

+(void)fetchImageDataForURL:(NSString *)imageURLString withBlock:(void(^)(NSData * _Nullable imageData))block;

@end
