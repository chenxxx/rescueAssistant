//
//  RootViewController.m
//  
//
//  Created by chenxxx on 17/3/27.
//
//

#import "RootViewController.h"
#import "LoginViewController.h"

@interface RootViewController ()

@property (assign,nonatomic)BOOL *islogin;

@end

@implementation RootViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.parallaxEnabled = NO;
    self.scaleContentView = YES;
    self.contentViewScaleValue = 0.95;
    self.scaleMenuView = NO;
    self.contentViewShadowEnabled = YES;
    self.contentViewShadowRadius = 4.5;
    self.panGestureEnabled = NO;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   /* self.islogin = FALSE;
    if(self.islogin){
        NSLog(@"2");
    } else{
        LoginViewController *loginNC = [[LoginViewController alloc]init];
        [self presentModalViewController:loginNC animated:NO];
        NSLog(@"1");
    }*/
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
