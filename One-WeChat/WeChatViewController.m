//
//  WeChatViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/25.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "WeChatViewController.h"
#import "TalkViewController.h"
@interface WeChatViewController ()
@property (nonatomic,strong) UIBarButtonItem * rightBtn;
@property (nonatomic,strong) TalkViewController * talkVC;
@end

@implementation WeChatViewController
#pragma 从storyboard中唤醒当前类对象
//-(void)awakeFromNib
//{
//    [super awakeFromNib];
//    self.tabBarItem.title=@"微信";
    
//    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    self.tabBarItem.selectedImage= [[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//}
#pragma mark 视图将要出现时
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.tintColor=[UIColor greenColor];
//    
//    self.tabBarController.navigationItem.title=@"微信";

    //创建右导航按钮
//    if (!self.rightBtn)
//    {
//        self.rightBtn=[[UIBarButtonItem alloc]initWithTitle:@"聊天" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
//    }
//    self.tabBarController.navigationItem.rightBarButtonItem=self.rightBtn;

//}
//-(void)next:(UIBarButtonItem *)sender
//{
//    if (!self.talkVC)
//    {
//        self.talkVC=[TalkViewController new];
//        
//    }
//    
//    [self.tabBarController.navigationController pushViewController:self.talkVC animated:YES];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.badgeValue=@"1";
    [self.tabBarItem setBadgeValue:@"2"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
