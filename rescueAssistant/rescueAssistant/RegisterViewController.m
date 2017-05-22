//
//  RegisterViewController.m
//  rescueAssistant
//
//  Created by chenxxx on 17/4/5.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import "RegisterViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <BmobSDK/Bmob.h>

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
@property (weak, nonatomic) IBOutlet UITextField *userConfirmPassword;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)cancel:(id)sender {
  
    [self dismissViewControllerAnimated:YES completion:^(void){
    
    }];
}

- (IBAction)save:(id)sender {
    if(self.userPassword.text != self.userConfirmPassword.text){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉" message:@"两次密码输入不同" preferredStyle: UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.userPassword.text = nil;
            self.userConfirmPassword.text = nil;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    } else if(self.userID.text.length<6||self.userID.text.length>12){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉" message:@"用户名长度需在6到12个字符之间" preferredStyle: UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.userID.text = nil;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    } else if(self.userPassword.text.length<6||self.userPassword.text.length>16){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉" message:@"密码长度需在6到16个字符之间" preferredStyle: UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.userID.text = nil;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    } else{
        BmobUser *bUser = [[BmobUser alloc] init];
        [bUser setUsername:self.userID.text];
        [bUser setPassword:self.userPassword.text];
        [bUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
            if (isSuccessful){
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功,请牢记账号密码" preferredStyle: UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }]];
                [self presentViewController:alert animated:true completion:nil];
            } else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:error.localizedDescription preferredStyle: UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    self.userID.text = nil;
                }]];
                 [self presentViewController:alert animated:true completion:nil];
            }
        }];
    }
}




@end
