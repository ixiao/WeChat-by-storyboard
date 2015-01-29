//
//  RootViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/27.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "IndexViewController.h"


@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark 登录
- (IBAction)btnLogin:(id)sender {
//    if (!self.loginVC)
//    {
//        [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
//    }
//    [self presentViewController:self.loginVC animated:YES completion:nil];

    
    UINavigationController *sb = [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
    [self presentViewController:sb animated:YES completion:nil];
}

#pragma mark 注册
- (IBAction)btnSign:(id)sender {
//    UINavigationController * sb = [self.storyboard instantiateViewControllerWithIdentifier:@"signVC"];
//    [self presentViewController:sb animated:YES completion:nil];
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"请选择注册方式" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"微信号注册",@"手机号注册", nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {
            UINavigationController * sb = [self.storyboard instantiateViewControllerWithIdentifier:@"signNumberVC"];
            [self presentViewController:sb animated:YES completion:nil];
        }
            break;
        case 1:
        {
            UINavigationController * sb = [self.storyboard instantiateViewControllerWithIdentifier:@"signVC"];
            [self presentViewController:sb animated:YES completion:nil];
        }
            break;
            
        default:
            break;
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
