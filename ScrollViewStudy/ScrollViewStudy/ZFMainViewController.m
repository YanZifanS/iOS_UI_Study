//
//  ZFMainViewController.m
//  ScrollViewStudy
//
//  Created by yanzifan-mini on 2018/4/24.
//  Copyright © 2018年 yanzifan-mini. All rights reserved.
//

#import "ZFMainViewController.h"


#define kNavigationH self.navigationController.navigationBar.bounds.size.height

@interface ZFMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *viewArray;
@property (weak, nonatomic) NSTimer *scrollTimer;
@property (weak, nonatomic) UIPageControl *pageControl;

@end

@implementation ZFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ScrollView";
    [self setUP];
    [self startAutoScroll];
    
    
}

- (void)setUP {
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kNavigationH + 20, self.view.bounds.size.width, 200)];
    self.scrollView = scrollView;
    //self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.viewArray = [NSMutableArray arrayWithObjects:@"128", @"123", @"124", @"125", @"126", @"127", @"128", @"123", nil];
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * self.viewArray.count, 400);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.alwaysBounceVertical = NO;
    
    [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:NO];
    // CA BDEF CA
    
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.scrollView.bounds.size.height, self.scrollView.bounds.size.width, 50)];
    self.pageControl = pageControl;
    self.pageControl.numberOfPages = self.viewArray.count - 2;//指定页面个数
    self.pageControl.currentPage = 0;//指定pagecontroll的值，默认选中的小白点（第一个）
    //添加委托方法，当点击小白点就执行此方法
    self.pageControl.userInteractionEnabled = NO;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];// 设置非选中页的圆点颜色
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [self.view addSubview:self.pageControl];
    
    //一般来说解析出来的array是scrollView的
    //copy 一次就可以了
    
    
    [self.viewArray enumerateObjectsUsingBlock:^(NSString *strImageName, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * idx, 0, self.view.bounds.size.width, scrollView.frame.size.height)];

        
        UIImage *anotherImage = [UIImage imageNamed:strImageName];
        //开启图片上下文
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
        CGFloat width = self.view.bounds.size.width  * 0.5;
        CGFloat begin = 17 * 3.1415926 / 12;
        CGFloat end = 19 * 3.1415926 / 12;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width, 200 + 3.732 * width)
                                        radius:width*3.864
                                    startAngle:begin
                                      endAngle:end
                                     clockwise:YES];
        [path addLineToPoint:CGPointMake(width*2, 0)];
        [path addLineToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(0, 200)];
        [path addClip];
        
        [anotherImage drawInRect:imageView.bounds];
        imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndImageContext();
        
    
        [self.scrollView addSubview:imageView];
    }];
}

- (void)makeInfiniteScrolling {
   //CABCA
    NSInteger currentPage = (self.scrollView.contentOffset.x) / self.scrollView.bounds.size.width;
    if (currentPage == self.viewArray.count - 1) {
        self.pageControl.currentPage = 0;
        [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:NO];
    }
    else if (currentPage == 0) {
        self.pageControl.currentPage = self.viewArray.count - 5;
        [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width * (self.viewArray.count-2), 0) animated:NO];
    }
    else {
        self.pageControl.currentPage = currentPage - 1;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self makeInfiniteScrolling];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self makeInfiniteScrolling];
}

- (void)startAutoScroll {
    if (self.scrollTimer) {
        return;
    }
    NSTimer *scrollTimer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(doScroll) userInfo:nil repeats:YES];
    self.scrollTimer = scrollTimer;
    [[NSRunLoop mainRunLoop] addTimer:self.scrollTimer forMode:NSDefaultRunLoopMode];
}

- (void)doScroll {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + self.scrollView.frame.size.width, 0) animated:YES];
}

//滑动的时候停止定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopAutoScroll];
}

- (void)stopAutoScroll {
    [self.scrollTimer invalidate];
    self.scrollTimer = nil;
}

//停止滑动之后开启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startAutoScroll];
}

@end
