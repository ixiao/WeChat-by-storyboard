//
//  LoginViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/28.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtLogin;
@property (strong, nonatomic) IBOutlet UITextField *txtPass;

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
    NSArray *array = [NSArray arrayWithContentsOfFile:[self getFilePath:@"array.plist"]];
    if ([self.txtLogin.text isEqualToString:array[0]]&&[self.txtPass.text isEqualToString:array[1]])
    {
        UITabBarController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"tabVC"];
        [self presentViewController:nav animated:YES completion:nil];
    }
    else
        [self myAlert:@"您输入的账户或密码有误,请重新输入"];

    
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
