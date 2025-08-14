//
//  AppDelegate.m
//  JIHuoNIaoDemo
//
//  Created by ooo on 2024/9/16.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "JiHuoNiaoIndexGuangGao.h"
#import <WXApi.h>
#import <AdSupport/ASIdentifierManager.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

        [JiHuoNiaoSDKConfiguration configuration].jihuoniaoCustomIdfa = @"111";
        [JiHuoNiaoSDKConfiguration configuration].jihuoniaoIsPersonalAds = NO;
        [JiHuoNiaoSDKConfiguration configuration].jihuoniaoIsPprogrammaticAds = YES;
        [JiHuoNiaoSDKConfiguration configuration].jihuoniaoSDKAgeGroup = JiHuoNiaoAdSDKAgeGroupAdult;
        [JiHuoNiaoSDKConfiguration setjihuoniaoSDKLBSLon:@"9.1111" lat:@"8.1111"];;
    //    00000000-0000-0000-0000-000000000000
//    NSLog(@"%@",[JiHuoNiaoSDKConfiguration configuration].customIdfa);

    //激活鸟com.jihuoniao.demo
    [JiHuoNiaoSDKManagerHZ startWithAppid:@"100001102" AppKey:@"3ac0dc45a9bdde3f29ebce5f26ab1f5b" isGetLocation:YES];
    NSLog(@"JiHuoNiaoSDKManagerHZ————————————: %@", [JiHuoNiaoSDKManagerHZ SDKVersion]);
    //探影客jihuoniao.tanyingke.com
//    [JiHuoNiaoSDKManagerHZ startWithAppid:@"100018100" AppKey:@"c1754007ab918dc5d623ab112cf0222b" isGetLocation:YES];
    
     UIWindow *keyWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    

    self.window = keyWindow;
    ViewController * vc = [[ViewController alloc]init];
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navigationVC;

    [keyWindow makeKeyAndVisible];
    //向微信注册
    [WXApi startLogByLevel:WXLogLevelDetail logBlock:^(NSString *log) {
        NSLog(@"WeChatSDK————————————: %@", log);
    }];
    
     [WXApi registerApp:@"wx5c94f8202d35e5b7" universalLink:@"https://app.tanyingke.com"];
    
    [JiHuoNiaoIndexGuangGao showView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self requestIDFATracking];
    });
    return YES;
}

- (void)requestIDFATracking {
    if (@available(iOS 14, *)) {
        // iOS14及以上版本需要先请求权限
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            // 获取到权限后，依然使用老方法获取idfa
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
                    NSLog(@"%@",idfa);
            } else {
                NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");
            }
        }];
    } else {
        // iOS14以下版本依然使用老方法
        // 判断在设置-隐私里用户是否打开了广告跟踪
        if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
            NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
            NSLog(@"%@",idfa);
        } else {
            NSLog(@"请在设置-隐私-广告中打开广告跟踪功能");
        }
    }
}


@end

