//
//  LoginViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/28.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "LoginViewController.h"
#import <sqlite3.h>
#import "UsersViewController.h"
#define FILENAME @"MySQLite3.sqlite"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtLogin;//登录账户
@property (strong, nonatomic) IBOutlet UITextField *txtPass;//登录密码
@property (nonatomic,strong) NSMutableArray * usersArr;//用户数组
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtLogin.delegate=self;
    self.txtPass.delegate=self;
 
    // Do any additional setup after loading the view.
}

- (IBAction)btnCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 登录
- (IBAction)btnLogin:(id)sender {
//UserDefaults 验证登录
    
//    NSString * userNumber = @"admin";
//    NSString * userPass = @"admin";
//    if ([self.txtLogin.text isEqualToString:userNumber] && [self.txtPass.text isEqualToString: userPass])
//    {
//        UITabBarController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"tabVC"];
//        [self presentViewController:nav animated:YES completion:nil];
//    }
//    else{
//        [self myAlert:@"您输入的账户或密码有误"];
//    }
    
//使用读写plist 方法登录
//    NSArray *array = [NSArray arrayWithContentsOfFile:[self getFilePath:@"array.plist"]];
//    if ([self.txtLogin.text isEqualToString:array[0]]&&[self.txtPass.text isEqualToString:array[1]])
//    {
//        UITabBarController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"tabVC"];
//        [self presentViewController:nav animated:YES completion:nil];
////        [self showViewController:nav sender:self];
//    }
//    else
//        [self myAlert:@"您输入的账户或密码有误,请重新输入"];

//使用Sqlite3 数据库登录
    //1、打开数据库
    sqlite3 *db = [self sqlite3_open_database];
    //2、准备预编译语句并编译
    char *sql = "SELECT * FROM student WHERE id = ?";
    //2.1声明预编译语句对象
    sqlite3_stmt *stmt = NULL;
    //2.2预编译sql语句
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    //2.3预编译成功，绑定值
    if (result == SQLITE_OK) {
        //获取文本框ID值绑定到预编译语句中
//        sqlite3_bind_int(stmt, 1, [self.txtId.text intValue]);
//        [self myAlert:@"查询成功！请查看控制台！"];
        UITabBarController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"tabVC"];
        [self presentViewController:nav animated:YES completion:nil];
        [self.usersArr removeAllObjects];
        //3、执行预编译语句
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //4、处理结果，取出结果行中每一列赋值到模型对象的属性当中，把模型对象放入数组中
            UsersViewController * user = [UsersViewController new];
//            stu.id = sqlite3_column_int(stmt, 0);
            user.name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
//            user.pass = sqlite3_column_int(stmt, 2);
            user.pass=[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2) ];
            [self.usersArr addObject:user];
        }
        NSLog(@"%@",self.usersArr);
    } else {
        [self myAlert:@"查询失败！"];
    }
    //5、销毁预编译语句对象，关闭数据库
    sqlite3_finalize(stmt);
    sqlite3_close(db);
    
    
}
//限制用户输入
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //NSString * test = @"asdfghjklo";//10位
    if (textField.text.length==10)
    {
        return NO;
    }
    else
    {
        return YES;
    }
    
}

//登录遇到问题?
- (IBAction)btnQuestion:(id)sender {
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"找回密码" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"使用QQ号找回密码",@"使用微信号找回密码",@"使用手机号找回密码", nil];
    [actionSheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            [self myAlert:@"QQ号找回"];
            break;
        case 1:
            [self myAlert:@"微信号找回"];
            break;
        case 2:
            [self myAlert:@"手机号找回"];
            break;
        default:
            break;
    }
}

#pragma mark 打开SQLite3数据库
- (sqlite3 *)sqlite3_open_database {
    //创建sqlite3类型的指针
    sqlite3 *db = NULL;
    //打开sqlite3数据库，如果有则打开，没有则创建
    NSString *filePath = [self getFilePath];
    int result = sqlite3_open([filePath UTF8String], &db);
    //数据库打开失败
    if (result != SQLITE_OK) {
        //数据库打开失败，关闭数据库
        NSString *errorMsg = NULL;//捕获数据库错误信息
        sqlite3_close(db);
        NSAssert(0, @"数据库打开失败！",errorMsg);//断言调试程序，当第一个参数为假时，控制台显示自定义的错误信息，捕获数据库操作错误信息
        [self myAlert:@"数据库打开失败！"];
    }
    return db;
}

#pragma mark 获取数据库文件路径
- (NSString *)getFilePath {
    //需要返回的文件路径
    NSString *filePath = nil;
    //获取应用程序沙盒中的documents目录
    NSArray *docPathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = docPathArray[0];
    NSLog(@"docPath:%@",docPath);
    filePath = [docPath stringByAppendingPathComponent:FILENAME];
    return filePath;
}

#pragma mark 回收键盘
//回车键 回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.txtPass resignFirstResponder];
    [self.txtLogin resignFirstResponder];
    [self btnLogin:nil];
    return YES;
}
//触摸屏幕 回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtLogin resignFirstResponder];
    [self.txtPass resignFirstResponder];
}
#pragma  mark 获取文件绝对路径
-(NSString *)getFilePath:(NSString *)fileName
{
    //获取documents目录数组
    NSArray * docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取document目录
    NSString  * docPath = docPaths[0];
    //组合文件完整返回路径
    NSString * filePath = [docPath stringByAppendingPathComponent:fileName];
    NSLog(@"%@",filePath);
    return filePath;
}
#pragma mark 封装Alert方法
-(void)myAlert:(NSString *)sender
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:sender delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
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
