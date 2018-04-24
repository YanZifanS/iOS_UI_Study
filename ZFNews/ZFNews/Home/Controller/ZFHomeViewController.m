//
//  ZFHomeViewController.m
//  ZFNews
//
//  Created by yanzifan-mini on 2018/4/23.
//  Copyright © 2018年 yanzifan-mini. All rights reserved.
//

#import "ZFHomeViewController.h"
#import "AFNetworking.h"
#import "ZFCategoryModel.h"
#import "YYModel.h"

#import "ZFBaseNetwork.h"

@interface ZFHomeViewController ()

@end

@implementation ZFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFBaseNetwork Get:@"https://is.snssdk.com/article/category/get_subscribed/v1/?" parameters:nil completionHandler:^(id responseObj, NSError *error) {
        NSDictionary *responseDic = (NSDictionary *)responseObj;
        ZFCategoryModel *model = [ZFCategoryModel yy_modelWithDictionary:responseDic];
        NSDictionary *resultDic = [model valueForKey:@"data"];
        NSArray *listArray = [resultDic valueForKey:@"data"];
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (id obj in listArray) {
            NSDictionary *dic = (NSDictionary *)obj;
            ZFDataContentModel *dataModel = [ZFDataContentModel yy_modelWithDictionary:dic];
            [array addObject:dataModel];
        }
    }];
    
    NSDictionary *dictionary = @{@"category":@"news_military"};
    [ZFBaseNetwork Get:@"https://is.snssdk.com/api/news/feed/v58/?" parameters:dictionary completionHandler:^(id responseObj, NSError *error) {
        NSString *strResponse = [NSString stringWithFormat:@"%@", responseObj];
        NSLog(@"%@", strResponse);
    }];
    
}


@end
