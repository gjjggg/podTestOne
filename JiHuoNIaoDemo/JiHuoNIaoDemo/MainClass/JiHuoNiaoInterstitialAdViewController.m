//
//  JiHuoNiaoInterstitialAdViewController.m
//  JiHuoNiaoSDKDemo
//
//  Created by ZJL on 2022/07/13.
//

#import "JiHuoNiaoInterstitialAdViewController.h"
@interface JiHuoNiaoInterstitialAdViewController ()<JiHuoNiaoInterstitialAdHZDelegate>
@property(nonatomic,strong) JiHuoNiaoInterstitialAdHZ *JiHuoNiaoInterstitialAd;

@end

@implementation JiHuoNiaoInterstitialAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"插屏Interstitial";
    [self layoutUI];
}

- (void)layoutUI {
   
    NSArray * titleArray = @[@"展示插屏广告"];
    CGFloat top = NavTop+ jihuoniaoMYDistance(24);
    for (int i=0; i<titleArray.count; i++) {
        UIButton *  loadAndShowAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        loadAndShowAdButton.frame = CGRectMake(12,top, self.view.frame.size.width - 24,jihuoniaoMYDistance(104));
        [loadAndShowAdButton setTitle:titleArray[i] forState:UIControlStateNormal];
        [loadAndShowAdButton addTarget:self action:@selector(openAd:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)openAd:(UIButton *)button{

    self.JiHuoNiaoInterstitialAd = [[JiHuoNiaoInterstitialAdHZ alloc] initWithJihuoniaoHZADSiteID:jiHuoNiao_interstitial_ID];
    self.JiHuoNiaoInterstitialAd.delegate = self;
    [self.JiHuoNiaoInterstitialAd jiHuoNiaoHZOnlyLoad];

}

#pragma mark -  插⼴告网络数据正确
- (void)JiHuoNiaoInterstitialAdHZLoadSuccess{
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
    NSLog(@"ecpm------%ld",(long)self.JiHuoNiaoInterstitialAd.jiHuoNiaoHZGetEcpm);
    [self.JiHuoNiaoInterstitialAd jiHuoNiaoHZOnlyShow];
    JiHuoNiaoServerBiddingResultModel * resultModel = [[JiHuoNiaoServerBiddingResultModel alloc]init];
 
    resultModel.jihuoniaoWin =  0;
    resultModel.jihuoniaoWinEcpm =  self.JiHuoNiaoInterstitialAd.jiHuoNiaoHZGetEcpm;
    resultModel.jihuoniaoAdnName =  @"激活鸟";
    resultModel.jihuoniaoAdTitle =  @"插屏";
    resultModel.jihuoniaoAdRequestId =  @"1";
    
    [self.JiHuoNiaoInterstitialAd jiHuoNiaoHZEcpmWinSucessOrFailed:resultModel];
}
#pragma mark -  插⼴告错误
- (void)JiHuoNiaoInterstitialAdHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
    NSLog(@"JiHuoNiao------[%ld-%@]",code,tipStr);
    [XHToast showCenterWithText:tipStr];
}

#pragma mark -  插屏⼴告曝光
- (void)JiHuoNiaoInterstitialAdHZRenderSuccess{
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}

#pragma mark -  插屏⼴告点击
- (void)JiHuoNiaoInterstitialAdHZDidClick{
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}

#pragma mark -  插屏⼴告关闭
- (void)JiHuoNiaoInterstitialAdHZDidClose{
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}


@end
