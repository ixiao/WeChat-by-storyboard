//
//  FindViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/25.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "FindViewController.h"
#import "NearByViewController.h"
@interface FindViewController ()
@property (strong, nonatomic) UILabel *lblLongitude;// 经度
@property (strong, nonatomic) UILabel *lblLatitude;// 纬度
@property (strong, nonatomic) UILabel *lblAltitude;// 海拔高度
@property (strong, nonatomic) CLLocationManager *locationManager;// 位置管理器
@property (strong, nonatomic) CLLocation *location;// 位置对象
@property (strong, nonatomic) NearByViewController *mapVC;// 地图视图
@end

@implementation FindViewController
//-(void)awakeFromNib
//{
//    [super awakeFromNib];

//    self.tabBarItem.title=@"发现";
    
//    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_discover@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discoverHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    self.tabBarController.navigationItem.title=@"发现";
//    
//    
//}



- (void)viewDidLoad {
    [super viewDidLoad];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString * cellID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID ];
//    if (!cell)
//    {
//        cell=[UITableViewCell alloc]initWithStyle:uita reuseIdentifier:<#(NSString *)#>;
//    }
//    
//    
//    return cell;
//}
#pragma mark 朋友圈
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    switch (indexPath.row)
//    {
//        case 0:
//            self.friendVC=[self.storyboard instantiateViewControllerWithIdentifier:@"friendVC"];
//            [self.navigationController pushViewController:self.friendVC animated:YES];
//            break;
//            
//        default:
//            break;
//    }
//}

#pragma mark 附近的人

#pragma mark 创建位置管理器
- (void)createLocationManager
{
    // 初始化位置管理器
    _locationManager = [CLLocationManager new];
    // 指定委托
    _locationManager.delegate = self;
    // 指定期望精度
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // 指定筛选距离（就是你的设备每移动多少米刷新位置信息）
    _locationManager.distanceFilter = 1000;
    // 指定始终允许用户访问位置信息
    [_locationManager requestAlwaysAuthorization];
    // 启动位置管理器(开始回调委托方法)
    [_locationManager startUpdatingLocation];
}

#pragma mark -CLLocationManagerDelegate
// 此委托方法是更新位置信息
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // 获取当前位置对象（数组最后一个元素就是）
    _location = [locations lastObject];
    //从当前位置中获取经纬度、水平精准度、海拔、海拔精准度
    //%g如果没有指明精度，则只会给出6个数字，而且会四舍五入
    //Unicode编码“\u00B0”表示“°”
    // 更新界面
    self.lblLongitude.text = [NSString stringWithFormat:@"%g\u00B0", _location.coordinate.longitude];
    self.lblLatitude.text = [NSString stringWithFormat:@"%g\u00B0", _location.coordinate.latitude];
    self.lblAltitude.text = [NSString stringWithFormat:@"%g千米", _location.altitude];
}

// 位置信息访问权限发生改变时回调
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [_locationManager requestWhenInUseAuthorization];
            }
            break;
            
        default:
            break;
    }
}

// 此委托方法是获取用户位置数据失败回调的方法，在此通知用户
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorDenied) {
        // 访问被拒绝
        [self myAlert:@"访问被拒绝"];
    }
    
    if ([error code] == kCLErrorLocationUnknown) {
        // 无法获取位置信息
        [self myAlert:@"无法获取位置信息"];
    }
}

#pragma mark 封装UIAlertView
- (void)myAlert:(NSString *)errorMsg {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:errorMsg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
