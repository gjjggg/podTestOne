//
//  JiHuoNiaoRewardAdViewController.m
//  JiHuoNiaoSDKDemo
//
//  Created by ZJL on 2022/07/13.
//

#import "JiHuoNiaoRewardAdViewController.h"

@interface JiHuoNiaoRewardAdViewController ()<JiHuoNiaoRewardAdHZDelegate>
@property (nonatomic,strong)UIButton *loadAdBtn;
@property (nonatomic,strong)UIButton *showAdBtn;
@property (nonatomic,strong)UIButton *loadShowAdBtn;
@property (nonatomic,strong)JiHuoNiaoRewardAdHZ *JiHuoNiaoRewardAd;

@end

@implementation JiHuoNiaoRewardAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"激励视频Reward";
    // Do any additional setup after loading the view.
    [self layoutUI];
}

- (void)layoutUI {
    //拉取广告
    self.JiHuoNiaoRewardAd = [[JiHuoNiaoRewardAdHZ alloc]initWithJihuoniaoHZADSiteID:jiHuoNiao_reward_ID];
    self.JiHuoNiaoRewardAd.jiHuoNiao_user_id = @"sss";
    
    NSDictionary * dic = @{
        @"key":@"测试"
    };
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];

    NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    self.JiHuoNiaoRewardAd.jiHuoNiao_user_extra = str;
    self.JiHuoNiaoRewardAd.delegate = self;
   
    NSArray * titleArray = @[@"显示激励视频"];
    CGFloat top = NavTop+ jihuoniaoMYDistance(24);
    for (int i=0; i<titleArray.count; i++) {
        UIButton *  loadAndShowAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        loadAndShowAdButton.frame = CGRectMake(12,top, self.view.frame.size.width - 24,jihuoniaoMYDistance(104));
        [loadAndShowAdButton setTitle:titleArray[i] forState:UIControlStateNormal];
        [loadAndShowAdButton addTarget:self action:@selector(loadShowAction:) forControlEvents:UIControlEventTouchUpInside];
        loadAndShowAdButton.tag = 100+i;
        loadAndShowAdButton.backgroundColor = UIColor.whiteColor;
        [loadAndShowAdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        loadAndShowAdButton.layer.cornerRadius = 8;
        loadAndShowAdButton.layer.masksToBounds = NO;
        [loadAndShowAdButton setTitleColor:AdSColor(34, 34, 34) forState:UIControlStateNormal];
        [loadAndShowAdButton  setTitleColor:AdSColor(34, 34, 34) forState:UIControlStateDisabled];
        [self.view addSubview:loadAndShowAdButton];
        loadAndShowAdButton.titleLabel.font = jihuoniaoFontMakeMedium(14);
        loadAndShowAdButton.titleEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 16);
        loadAndShowAdButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        top = loadAndShowAdButton.frame.origin.y+loadAndShowAdButton.frame.size.height+jihuoniaoMYDistance(20);
    }

}

//加载并显示
- (void)loadShowAction:(UIButton *)button{
    
    [self.JiHuoNiaoRewardAd jiHuoNiaoHZLoadRewardAd];

}

#pragma mark 激励视频⼴告网络加载成功
- (void)JiHuoNiaoRewardedVideoAdHZDidLoad{
   
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
    NSLog(@"ecpm------%ld",(long)self.JiHuoNiaoRewardAd.jiHuoNiaoHZGetEcpm);
    [self.JiHuoNiaoRewardAd jiHuoNiaoHZShowRewardAd:self];
    
    JiHuoNiaoServerBiddingResultModel * resultModel = [[JiHuoNiaoServerBiddingResultModel alloc]init];
    resultModel.jihuoniaoWin =  0;
    resultModel.jihuoniaoWinEcpm =  self.JiHuoNiaoRewardAd.jiHuoNiaoHZGetEcpm;
    resultModel.jihuoniaoAdnName =  @"激活鸟";
    resultModel.jihuoniaoAdTitle =  @"激励视频";
    resultModel.jihuoniaoAdRequestId =  @"1";
    [self.JiHuoNiaoRewardAd jiHuoNiaoHZEcpmWinSucessOrFailed:resultModel];
}
#pragma mark  激励视频⼴告曝光
- (void)JiHuoNiaoRewardedVideoAdHZViewRenderSuccess{
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}
#pragma mark  激励视频⼴告关闭
- (void)JiHuoNiaoRewardedVideoAdHZDidClose{
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
    self.showAdBtn.enabled = NO;
}

#pragma mark  激励视频⼴告点击
- (void)JiHuoNiaoRewardedVideoAdHZDidClick{
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}

#pragma mark   激励视频⼴告奖励
- (void)JiHuoNiaoRewardedVideoAdHZHasReward{
//    NSLog(@"JiHuoNiao------%@------%@",NSStringFromSelector(_cmd),tID);
    NSLog(@"激励成功JiHuoNiao------%@",NSStringFromSelector(_cmd));
}
#pragma mark  激励视频⼴告错误
- (void)JiHuoNiaoRewardedVideoAdHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
    NSLog(@"JiHuoNiao------[%ld-%@]",code,tipStr);
    [XHToast showCenterWithText:tipStr];
}

@end
