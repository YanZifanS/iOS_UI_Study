//
//  ZFBaseNetwork.m
//  ZFNews
//
//  Created by yanzifan-mini on 2018/4/23.
//  Copyright © 2018年 yanzifan-mini. All rights reserved.
//

/*
     AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
     session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
     NSDictionary *parameter = nil;
     [session GET:@"https://is.snssdk.com/article/category/get_subscribed/v1/?" parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
     NSDictionary *responseDic = (NSDictionary *)responseObject;
     ZFCategoryModel *model = [ZFCategoryModel yy_modelWithDictionary:responseDic];
     NSDictionary *resultDic = [model valueForKey:@"data"];
     NSArray *listArray = [resultDic valueForKey:@"data"];
     NSMutableArray *array = [[NSMutableArray alloc]init];
     for (id obj in listArray) {
     NSDictionary *dic = (NSDictionary *)obj;
     ZFDataContentModel *dataModel = [ZFDataContentModel yy_modelWithDictionary:dic];
     [array addObject:dataModel];
     }
 
     } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
     NSLog(@"%@", error);
     }];
 */




#import "ZFBaseNetwork.h"
#import "AFNetworking.h"

static AFHTTPSessionManager *manager = nil;

@implementation ZFBaseNetwork

+ (AFHTTPSessionManager *)sharedAFManager {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    });
    return manager;
}

+ (id)Get:(NSString *)strUrl parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    
    return [[self sharedAFManager] GET:strUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        complete(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        complete(nil, error);
    }];
}

@end






