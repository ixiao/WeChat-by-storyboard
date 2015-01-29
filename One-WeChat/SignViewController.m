//
//  SignViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/28.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "SignViewController.h"

@interface SignViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtNumber;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;

@end

@implementation SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 国家表视图
- (IBAction)btnCountry:(id)sender {
    
    UINavigationController * navVC = [self.storyboard instantiateViewControllerWithIdentifier:@"countriesNAV"];
    [self presentViewController:navVC animated:YES completion:nil];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtNumber resignFirstResponder];
    [self.phoneNumber resignFirstResponder];
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
