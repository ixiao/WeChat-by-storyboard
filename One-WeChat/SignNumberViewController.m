//
//  SignNumberViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/29.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "SignNumberViewController.h"

@interface SignNumberViewController ()

@end

@implementation SignNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNumber.delegate=self;
    self.userPass.delegate=self;
    // Do any additional setup after loading the view.
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
    
    
    NSArray * array = @[self.userNumber.text,self.userPass.text];
    [array writeToFile:[self getFilePath:@"array.plist"] atomically:YES];
    [self myAlert:@"注册成功"];
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
