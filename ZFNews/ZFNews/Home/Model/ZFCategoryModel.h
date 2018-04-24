//
//  ZFCategoryModel.h
//  ZFNews
//
//  Created by yanzifan-mini on 2018/4/23.
//  Copyright © 2018年 yanzifan-mini. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 {
 "message": "success",
 "data": {
 "version": "0",
 "data": [
 {
 "category": "news_hot",
 "web_url": "",
 "flags": 0,
 "name": "热点",
 "tip_new": 0,
 "default_add": 1,
 "concern_id": "",
 "type": 4,
 "icon_url": ""
 },
 {
 "category": "video",
 "web_url": "",
 "flags": 0,
 "name": "视频",
 "tip_new": 0,
 "default_add": 1,
 "concern_id": "",
 "type": 4,
 "icon_url": ""
 }
 // ...
 ]
 }
 }
 */
@class ZFDataModel, ZFDataContentModel;

@interface ZFCategoryModel : NSObject

@property (copy, nonatomic) NSString *message;
@property (strong, nonatomic) ZFDataModel *data;

@end



@interface ZFDataModel : NSObject

@property (copy, nonatomic) NSString *version;
@property (strong, nonatomic) NSArray <ZFDataContentModel *> *data;

@end


@interface ZFDataContentModel : NSObject

@property (copy, nonatomic) NSString *category;
@property (copy, nonatomic) NSString *web_url;
@property (assign, nonatomic) NSInteger flags;
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger tip_new;
@property (assign, nonatomic) NSInteger default_add;
@property (copy, nonatomic) NSString *concern_id;
@property (assign, nonatomic) NSInteger type;
@property (copy, nonatomic) NSString *icon_url;

@end







