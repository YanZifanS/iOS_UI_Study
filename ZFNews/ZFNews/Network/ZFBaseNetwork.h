//
//  ZFBaseNetwork.h
//  ZFNews
//
//  Created by yanzifan-mini on 2018/4/23.
//  Copyright © 2018年 yanzifan-mini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBaseNetwork : NSObject

+ (id)Get:(NSString *)strUrl parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

@end
