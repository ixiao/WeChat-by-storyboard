//
//  SignNumberViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/29.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "SignNumberViewController.h"
#import <sqlite3.h>
#define FILENAME @"MySQLite3.sqlite"
#import "UsersViewController.h"
@interface SignNumberViewController ()

@end

@implementation SignNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNumber.delegate=self;
    self.userPass.delegate=self;
    // Do any additional setup after loading the view.
    [self create_sqlite3_table];
}

#pragma mark 创建SQLite3表
- (void)create_sqlite3_table {
    //打开SQLite3数据库
    sqlite3 *db = [self sqlite3_open_database];
    //准备创建表的sql语句
    const char *sql = "CREATE TABLE IF NOT EXISTS student(id integer primary key,name varchar2(255),age int)";
    //声明保存错误信息的c类型字符串
    char *errMsg = NULL;
    //执行sql语句创建表
    int result = sqlite3_exec(db, sql, NULL, NULL, &errMsg);
    //创建表出错
    if (result != SQLITE_OK) {
        [self myAlert:[NSString stringWithFormat:@"数据库出错：%s",errMsg]];
    } else {
//        [self myAlert:@"创建表成功！"];
        NSLog(@"数据库正常");
    }
    //无论出错与否都要关闭数据库
    sqlite3_close(db);
}

//左导航按钮关闭模态视图的方法
- (IBAction)Cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 触摸回收键盘
//回车键回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.userNumber resignFirstResponder];
    [self.userPass resignFirstResponder];
    [self btnSign:nil];
    return YES;
}
//触摸屏幕回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userNumber resignFirstResponder];
    [self.userPass resignFirstResponder];
}
#pragma mark 注册方法
- (IBAction)btnSign:(id)sender {
    
    
//    NSArray * array = @[self.userNumber.text,self.userPass.text];
//    [array writeToFile:[self getFilePath:@"array.plist"] atomically:YES];
//    [self myAlert:@"注册成功"];
   
    
    //1、打开数据库
    sqlite3 *db = [self sqlite3_open_database];
    //2、建立预编译语句对象并编译
    char *sql = "INSERT INTO student(name,age) VALUES(?,?)";//？为占位符，代表此处将来用变量值替换
    //2.1、准备预编译语句对象
    sqlite3_stmt *stmt = NULL;
    //2.2、预编译sql语句
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    //2.3、预编译成功，绑定值
    if (result == SQLITE_OK) {
        //绑定界面数据到预编译sql语句中
        sqlite3_bind_text(stmt, 1, [self.userNumber.text UTF8String], -1, NULL);
        sqlite3_bind_int(stmt, 2, [self.userPass.text intValue]);
        //3、执行预编译语句对象，4、使用结果
        result = sqlite3_step(stmt);
        if (result == SQLITE_DONE) {
            [self myAlert:@"注册成功！"];
        } else {
            [self myAlert:@"注册失败！"];
        }
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
    


//#pragma  mark 获取Plist文件绝对路径
//-(NSString *)getFilePath:(NSString *)fileName
//{
//    //获取documents目录数组
//    NSArray * docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    //获取document目录
//    NSString  * docPath = docPaths[0];
//    //组合文件完整返回路径
//    NSString * filePath = [docPath stringByAppendingPathComponent:fileName];
//    return filePath;
//}

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
