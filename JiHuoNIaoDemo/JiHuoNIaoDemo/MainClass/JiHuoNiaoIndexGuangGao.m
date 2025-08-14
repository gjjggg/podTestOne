//
//  JiHuoNiaoIndexGuangGao.m
//  GuDaShuZhi
//
//  Created by ooo on 2023/12/8.
//

#import "JiHuoNiaoIndexGuangGao.h"


#define QiDongImageName @"qidong_img_10003"


@interface JiHuoNiaoIndexGuangGao()<JiHuoNiaoSplashAdHZDelegate>
@property (nonatomic, strong) UIImageView *imageView;
/** <#name#> */
@property(nonatomic,strong) UIView *lunachImage;
@property (nonatomic,strong)JiHuoNiaoSplashAdHZ *JiHuoNiaoSplashAd;

@end
@implementation JiHuoNiaoIndexGuangGao
+(void)showView{
    JiHuoNiaoIndexGuangGao * guanggao = [[JiHuoNiaoIndexGuangGao alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}
-(instancetype)initWithFrame:(CGRect)frame
{
   
    if ( self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
    
}
-(void)createUI{
    

    self.backgroundColor = UIColor.yellowColor;
    
    
    UIImageView *rootImageView = [[UIImageView alloc] init];
    self.imageView = rootImageView;
    rootImageView.backgroundColor = UIColor.brownColor;
    rootImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT);
    rootImageView.contentMode = UIViewContentModeScaleAspectFill;
    rootImageView.image = [UIImage imageNamed:QiDongImageName];
    rootImageView.userInteractionEnabled = YES;
    [self addSubview:rootImageView];
    [GDWindow addSubview:self];
    

    //开屏广告
    self.JiHuoNiaoSplashAd =  [[JiHuoNiaoSplashAdHZ alloc] initWithJihuoniaoHZADSiteID:jiHuoNiao_splash_ID];
    self.JiHuoNiaoSplashAd.delegate = self;
    
    [self.JiHuoNiaoSplashAd jiHuoNiaoHZLoadAd];
   
 
}
#pragma mark Delegate
//这个方法在渲染成功时被调用。
- (void)JiHuoNiaoSplashViewHZRenderSuccess {
    [self disMissViewLunachImage:0.2];
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}

- (void)JiHuoNiaoSplashViewHZDidClick {
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}

- (void)JiHuoNiaoSplashViewHZDidClose {
   
//    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
//    NSError *setCategoryError = nil;
//    BOOL success = [audioSession setCategory:AVAudioSessionCategoryPlayback
//                                 withOptions:AVAudioSessionCategoryOptionMixWithOthers
//                                       error:&setCategoryError];
//
//    if (!success) {
//        // 处理错误
//        NSLog(@"Error setting AVAudioSession category: %@", setCategoryError);
//    }
//
//    NSError *activationError = nil;
//    success = [audioSession setActive:YES error:&activationError];
//    if (!success) {
//        // 处理错误
//        NSLog(@"Error activating AVAudioSession: %@", activationError);
//    }
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
//    [self JiHuoNiaoSplashViewDidClose];
    [self disMissViewWith:0.5];
}
- (void)JiHuoNiaoSplashViewHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
     NSLog(@"JiHuoNiao------[%ld-%@]",code,tipStr);
     [[NSNotificationCenter defaultCenter] postNotificationName:StartAnimateEnd object:nil];
     [self disMissViewWith:0.5];
}

/**
 This method is called when material load successful
 */
- (void)JiHuoNiaoSplashViewLoadSuccess{
    NSLog(@"JiHuoNiaoSplashViewLoadSuccess");
}


-(void)disMissViewWith:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
         [[NSNotificationCenter defaultCenter] postNotificationName:StartAnimateEnd object:nil];
    }];
}
-(void)disMissViewLunachImage:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
         self.imageView.alpha = 0;
    }completion:^(BOOL finished) {
        [self.imageView removeFromSuperview];
       
    }];
}


-(void)dealloc{
    
}
@end
