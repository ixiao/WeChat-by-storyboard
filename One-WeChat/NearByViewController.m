//
//  NearByViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/29.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "NearByViewController.h"

@interface NearByViewController ()
@property (nonatomic,strong) MKMapView * mapView;
@end

@implementation NearByViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    CGRect mapViewFrame = _mapView.frame;
    mapViewFrame.size.height -= 50;
    _mapView.frame = mapViewFrame;
    // 指定委托
    _mapView.delegate = self;
    // 加入view中
    [self.view addSubview:_mapView];
}


#pragma mark 视图出现时动画显示地图
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 创建地图显示区域
    MKCoordinateRegion region;
    // 指定显示区域中心点
    region.center.latitude = _location.coordinate.latitude;
    region.center.longitude = _location.coordinate.longitude;
    // 指定显示区域范围(111米之内)
    region.span.latitudeDelta = 0.001;
    region.span.longitudeDelta = 0.001;
    // 设置地图显示范围
    [_mapView setRegion:region animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
