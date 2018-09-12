//
//  LRLSubreddit.h
//  RedditC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRLSubreddit : NSObject


@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber * likeCount;
@property (nonatomic, copy, readonly) NSNumber * commentCount;
@property (nonatomic, readonly, copy) NSString *imageURLString;
@property (nonatomic, readwrite, nullable) UIImage *photo;

-(instancetype)initWithDictionary:(NSDictionary *)postDictionary;



@end

NS_ASSUME_NONNULL_END
