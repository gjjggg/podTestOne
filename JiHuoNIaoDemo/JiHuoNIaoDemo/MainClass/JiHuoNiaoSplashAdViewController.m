//
//  JiHuoNiaoSplashAdViewController.m
//  GuangGaoCeDemo
//
//  Created by ooo on 2024/9/5.
//

#import "JiHuoNiaoSplashAdViewController.h"


@interface JiHuoNiaoSplashAdViewController ()<JiHuoNiaoSplashAdHZDelegate>
@property (nonatomic,strong)JiHuoNiaoSplashAdHZ *JiHuoNiaoSplashAd;
@property(nonatomic,strong) UIImageView *logoImgView;
@end

@implementation JiHuoNiaoSplashAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开屏Splash";
    [self layoutUI];
    
}

- (void)layoutUI {
   
    //开屏广告
    self.JiHuoNiaoSplashAd =  [[JiHuoNiaoSplashAdHZ alloc] initWithJihuoniaoHZADSiteID:jiHuoNiao_splash_ID];
    self.JiHuoNiaoSplashAd.delegate = self;
    NSArray * titleArray = @[@"开屏自定义底部广告",@"默认开屏广告"];
    CGFloat top = NavTop + jihuoniaoMYDistance(24);
    for (int i=0; i<titleArray.count; i++) {
        UIButton *  loadAndShowAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        loadAndShowAdButton.frame = CGRectMake(12,top, self.view.frame.size.width - 24,jihuoniaoMYDistance(104));
        [loadAndShowAdButton setTitle:titleArray[i] forState:UIControlStateNormal];
        [loadAndShowAdButton addTarget:self action:@selector(loadAndBottomShowAd:) forControlEvents:UIControlEventTouchUpInside];
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
-(void)loadAndBottomShowAd:(UIButton *)button{
    if(button.tag == 100){
        [self.JiHuoNiaoSplashAd jiHuoNiaoHZOnlyLoad];
        [self.JiHuoNiaoSplashAd setJiHuoNiaoHZLogoBottom:[self bottomView]];
    }else{
        //加载并显示
       [self.JiHuoNiaoSplashAd jiHuoNiaoHZOnlyLoad];
       [self.JiHuoNiaoSplashAd setJiHuoNiaoHZLogoBottom:nil];
    
    }
}


#pragma mark 开屏⼴告曝光
- (void)JiHuoNiaoSplashViewHZRenderSuccess {
  
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}
#pragma mark 开屏⼴告点击
- (void)JiHuoNiaoSplashViewHZDidClick {
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}
#pragma mark 开屏⼴告关闭
- (void)JiHuoNiaoSplashViewHZDidClose {
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}
#pragma mark 开屏⼴告错误
- (void)JiHuoNiaoSplashViewHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
    NSLog(@"JiHuoNiao------[%ld-%@]",code,tipStr);
    [XHToast showCenterWithText:tipStr];
}
/**
 This method is called when material load successful
 */
- (void)JiHuoNiaoSplashViewHZLoadSuccess{
   
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
    NSLog(@"ecpm------%ld",(long)self.JiHuoNiaoSplashAd.jiHuoNiaoHZGetEcpm);
    [self.JiHuoNiaoSplashAd jiHuoNiaoHZOnlyShow];
    
    JiHuoNiaoServerBiddingResultModel * resultModel = [[JiHuoNiaoServerBiddingResultModel alloc]init];
    resultModel.jihuoniaoWin =  0;
    resultModel.jihuoniaoWinEcpm =  self.JiHuoNiaoSplashAd.jiHuoNiaoHZGetEcpm;
    resultModel.jihuoniaoAdnName =  @"激活鸟";
    resultModel.jihuoniaoAdTitle =  @"开屏";
    resultModel.jihuoniaoAdRequestId =  @"1";
    
    [self.JiHuoNiaoSplashAd jiHuoNiaoHZEcpmWinSucessOrFailed:resultModel];
}




/*------------底部视图----------*/
-(UIImageView *)logoImgView{
    
    if (!_logoImgView) {
        UIImage *image = [UIImage imageNamed:@"jihuoniao_img_kp_logo"];
        _logoImgView = [[UIImageView alloc] initWithImage:image];
        _logoImgView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 137/2, 35, 137, 47);

    }
    return _logoImgView;
}

-(UIView *)bottomView{
    UIView * bottomView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120)];
    bottomView.backgroundColor = UIColor.whiteColor;
    [bottomView addSubview:self.logoImgView];
    return bottomView;
}



@end
