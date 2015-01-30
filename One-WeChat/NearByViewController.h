//
//  NearByViewController.h
//  One-WeChat
//
//  Created by 闫潇 on 15/1/29.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface NearByViewController : UIViewController<MKMapViewDelegate>
@property (strong, nonatomic) CLLocation *location;// 需要穿过来的位置

@end
