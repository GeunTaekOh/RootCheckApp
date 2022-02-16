//
//  ViewController.m
//  RootCheckApp
//
//  Created by 오근택 on 2022/02/08.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:UIColor.whiteColor];
    [self.btn setCenter:self.view.center];
    [self.btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    CGPoint tmp = CGPointMake(self.view.center.x, self.view.center.y - self.btn.frame.size.height*1.5);
    [self.label setCenter:tmp];
    [self.label setTextColor:UIColor.blackColor];
    
    
    
    
}
- (IBAction)onClick:(id)sender {
    NSURL *AppOpenUrl = [NSURL URLWithString:@"cydia://package/com.example.package"];
    
    
    UIApplication * application = [UIApplication sharedApplication];
        
    NSLog(@"test");
    
    if([application canOpenURL:AppOpenUrl]){
        [application openURL:AppOpenUrl options:@{} completionHandler:^(BOOL success) {
        }];
    }else{
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"알림" message:@"정상입니다.\n루팅 체크 오탐을 유발하는 앱이 없습니다." preferredStyle:UIAlertActionStyleCancel];
        UIAlertAction * closeAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:closeAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


@end
