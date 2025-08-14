//
//  JiHuoNiaoBaseExampleViewController.m
//  JIHuoNIaoDemo
//
//  Created by ooo on 2024/10/15.
//

#import "JiHuoNiaoBaseExampleViewController.h"

@interface JiHuoNiaoBaseExampleViewController ()

@end

@implementation JiHuoNiaoBaseExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
        [appearance configureWithDefaultBackground];
        appearance.shadowColor = nil;
        appearance.backgroundEffect = nil;
        appearance.backgroundColor =  UIColor.whiteColor;
        self.navigationController.navigationBar.backgroundColor = UIColor.whiteColor;
        self.navigationController.navigationBar.barTintColor = UIColor.whiteColor;
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.standardAppearance = appearance;
        //iOS15新增特性：滑动边界样式
        self.navigationController.navigationBar.scrollEdgeAppearance= appearance;
    } else {
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        [self.navigationController.navigationBar setBarTintColor:UIColor.whiteColor];
    }
    
   
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    self.view.backgroundColor = AdSColor(245, 247, 250);

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

+(CGFloat)safeAreaInsets{
    CGFloat height = 0.0;//最终高度存储容器
    if (@available(iOS 13.0, *)) {
        CGFloat topHeight = [UIApplication sharedApplication].windows.firstObject.safeAreaInsets.top;
        height = topHeight ? topHeight : 20.0;
    }else {
        height = [[UIApplication sharedApplication] statusBarFrame].size.height;
    }
    return height+44;
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
