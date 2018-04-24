//
//  ZFImageView.m
//  ScrollViewStudy
//
//  Created by 彦子凡 on 2018/4/24.
//  Copyright © 2018年 yanzifan-mini. All rights reserved.
//

#import "ZFImageView.h"

@implementation ZFImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(200, 80)];
    
    path.lineWidth = 5.0;
    [path stroke];
}


@end
