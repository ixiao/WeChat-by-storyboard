//
//  ContactsViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/25.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ContactsViewController.h"
#import "AddBroViewController.h"
@interface ContactsViewController ()
@property (nonatomic,strong) AddBroViewController * addBroVC;
@property (nonatomic,strong) UIBarButtonItem * right;
@property (nonatomic,strong) NSArray * nicknameArr;//昵称数据源
@property (nonatomic,strong) NSArray * iconArr;//图标数据源
@property (nonatomic,strong) NSArray * detailArr;//详情数据源
@end

@implementation ContactsViewController
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tabBarItem.title=@"通讯录";
    
    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_contacts@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.selectedImage= [[UIImage imageNamed:@"tabbar_contactsHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tableView=[[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //准备数据源
    self.nicknameArr=@[@"小王子的花",@"a.ivan.chou",@"腊肉",@"散人",@"小楠",@"Blue。",@"负二",@"BABY小奕奕",@"被西边吃了节操的大珊",@"skipper",@"贫僧是来化妞的、",@"AK",@"小培陪",@"吃大珊节操的西边儿",@"囧泥",@"Rain",@"赵宇",@"小隐于野",@"biubiubiu",@"Sailor Moon"];
    self.iconArr=@[@"IMG_4192.JPG",@"IMG_4194.JPG",@"IMG_4199.png",@"IMG_4198.JPG",@"IMG_4193.JPG",@"002@2x.jpeg",@"002@2x.jpeg",@"002@2x.jpeg",@"IMG_4195.JPG",@"002@2x.jpeg",@"IMG_4196.JPG",@"002@2x.jpeg",@"002@2x.jpeg",@"IMG_4197.JPG",@"002@2x.jpeg",@"002@2x.jpeg",@"002@2x.jpeg",@"002@2x.jpeg",@"002@2x.jpeg",@"002@2x.jpeg"];
    
    self.detailArr=@[@"❤你很逊内!...",@"这就货很懒，什么也没留下...",@"生活不是眼前的苟且,生活有诗和远方",@"星辰 大海",@"这就货很懒，什么也没留下...",@"这就货很懒，什么也没留下...",@"给你一个看得见的未来。",@"bis dass der Tod uns scheide",@"我是打不死的姗姗小公主！！！",@"据考证，此人反射弧有一光年之长。",@"[命是弱者的借口，运是强者的谦词。]",@"这就货很懒，什么也没留下...",@"手工蛋糕预订",@"吃饭，蛋B，边吃饭边蛋B",@"孤独****(看不懂思密达~)",@"这就货很懒，什么也没留下...",@"为何不从现在开始",@"一整个宇宙换一颗红豆",@"没关系，是爱情啊",@"水壶啊，你为什么哭泣，是因为屁股太烫了吗"];
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"00");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.nicknameArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.imageView.image=[UIImage imageNamed:self.iconArr[indexPath.row]];
    cell.textLabel.text=self.nicknameArr[indexPath.row];
    cell.detailTextLabel.text=self.detailArr[indexPath.row];

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
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
