//
//  FriendViewController.m
//  One-WeChat
//
//  Created by 闫潇 on 15/1/29.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "FriendViewController.h"
#import "FindViewController.h"
@interface FriendViewController ()
@property (nonatomic,strong) FindViewController * findVC;
@property (nonatomic,strong) UIImagePickerController * imagePickerController;//图片选取器
@property (nonatomic,strong) MPMoviePlayerController * moviePlayerController;//视频选取器
@end

@implementation FriendViewController

//-(void)viewWillAppear:(BOOL)animated
//{
//    [self viewWillAppear:YES];
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIStoryboard * s  = [UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]];
    
    
    
}


//-(void)btnFind{
//
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    
//
//}



- (IBAction)btnFind:(id)sender {
    
//    UINavigationController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"findVC"];
//    [self showDetailViewController:nav sender:self];
//    [self showViewController:nav sender:self];
        self.findVC=[self.storyboard instantiateViewControllerWithIdentifier:@"findVC"];

 }
    
    
//    [self.navigationController presentViewController:self.findVC animated:YES completion:nil];

//    [self.navigationController popToViewController:self.findVC animated:YES];

- (IBAction)btnCamera:(id)sender {
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"请选择您所需要的功能" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打开相册",@"拍照功能",@"拍摄视频", nil];
    [actionSheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            [self openPhoto];
            break;
        case 1:
            [self shootNewPhoto];
            break;
        case 2:
            [self shootNewVideo];
            break;
            
        default:
            break;
    }
}

-(void)openPhoto
{
    // 检查是否有图片库（图片选取器的isSourceTypeAvailable类方法）
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        [self myAlert:@"对不起您的设备不存在图片库"];
        
    }
    // 检查图片选取器是否存在，不存在创建并指定委托
    if (!self.imagePickerController) {
        self.imagePickerController = [UIImagePickerController new];
        self.imagePickerController.delegate = self;
    }
    // 设定照相机可以获取那些类型的媒体（图片选取器的mediaTypes属性kUTTypeMovie和kUTTypeImage）
    self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie];
    // 设定图片的来源为图片库（图片选取器的sourceType属性UIImagePickerControllerSourceTypePhotoLibrary）
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // 打开图片选取器视图控制器（模态视图方式）
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
-(void)shootNewPhoto
{
    // 检查是否有相机（图片选取器的isSourceTypeAvailable类方法）
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self myAlert:@"对不起，您的设备不存在相机"];

        return;
    }
    // 检查图片选取器是否存在，不存在创建并指定委托
    if (!self.imagePickerController) {
        self.imagePickerController = [UIImagePickerController new];
        self.imagePickerController.delegate = self;
    }
    // 设定照相机可以获取那些类型的媒体（图片选取器的mediaTypes属性kUTTypeMovie或者kUTTypeImage）
    self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    // 设定图片的来源为摄像头（图片选取器的sourceType属性UIImagePickerControllerSourceTypeCamera）
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 设定图片选取器的摄像头捕获模式（图片选取器的cameraCaptureMode属性UIImagePickerControllerCameraCaptureModePhoto或者UIImagePickerControllerCameraCaptureModeVideo）
    self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    // 设定使用前置摄像头，默认是后置摄像头
    self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    // 打开图片选取器视图控制器（模态视图方式）
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
-(void)shootNewVideo
{
    // 检查是否有相机（图片选取器的isSourceTypeAvailable类方法）
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self myAlert:@"对不起，您的设备不存在相机"];
        return;
    }
    // 检查图片选取器是否存在，不存在创建并指定委托
    if (!self.imagePickerController) {
        self.imagePickerController = [UIImagePickerController new];
        self.imagePickerController.delegate = self;
    }
    // 设定照相机可以获取那些类型的媒体（图片选取器的mediaTypes属性kUTTypeMovie或者kUTTypeImage）
    self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeMovie];
    // 设定图片的来源为摄像头（图片选取器的sourceType属性UIImagePickerControllerSourceTypeCamera）
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 设定图片选取器的摄像头捕获模式（图片选取器的cameraCaptureMode属性UIImagePickerControllerCameraCaptureModePhoto或者UIImagePickerControllerCameraCaptureModeVideo）
    self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    // 设置摄像图像品质
    self.imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    // 打开图片选取器视图控制器（模态视图方式）
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark 封装Alert方法
-(void)myAlert:(NSString *)sender
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:sender delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
@end
