//
//  SignNumberViewController.h
//  One-WeChat
//
//  Created by 闫潇 on 15/1/29.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignNumberViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNumber;
@property (strong, nonatomic) IBOutlet UITextField *userPass;

@end
