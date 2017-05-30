//
//  LoginViewController.m
//  rescueAssistant
//
//  Created by chenxxx on 17/4/5.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import "LoginViewController.h"
#import <BmobSDK/Bmob.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "RootViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
- (IBAction)login:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (IBAction)login:(id)sender {
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text=@"登录中";
    [BmobUser loginWithUsernameInBackground:self.userID.text password:self.userPassword.text block:^(BmobUser *user, NSError *error) {
        NSLog(@"%@",user);
        if (user) {
          
            [hud hideAnimated:YES afterDelay:0];
     
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            RootViewController *rootViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"rootViewController"];
            
            self.navigationController.navigationBarHidden = YES;
            [self.navigationController pushViewController:rootViewController animated:YES];
         
        } else {
            [hud hideAnimated:YES afterDelay:0];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:error.localizedDescription preferredStyle: UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userID resignFirstResponder];
    [self.userPassword resignFirstResponder];
}
@end
