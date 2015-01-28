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
    
    // Do any additional setup after loading the view.
}

- (IBAction)btnCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 登录
- (IBAction)btnLogin:(id)sender {
    
    NSString * userNumber = @"admin";
    NSString * userPass = @"admin";
    if ([self.txtLogin.text isEqualToString:userNumber] && [self.txtPass.text isEqualToString: userPass])
    {
        UITabBarController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"tabVC"];
        [self presentViewController:nav animated:YES completion:nil];
    }
    else{
        NSLog(@"------");
    }
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
