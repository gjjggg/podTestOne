//
//  JiHuoNiaoBannerAdViewController.m
//  JIHuoNIaoDemo
//
//  Created by ooo on 2024/12/30.
//

#import "JiHuoNiaoBannerAdViewController.h"
#import "JiHuoNiaoSelcetedItem.h"

@interface JiHuoNiaoBannerAdViewController ()<JiHuoNiaoBannerADHZDelegate>
@property (nonatomic,strong)JiHuoNiaoBannerADHZ *JiHuoNiaoBannerADHZ;
@property(nonatomic, strong)NSArray  *sizeArray;
@property(nonatomic, strong)NSDictionary  *sizeDcit;
@end

@implementation JiHuoNiaoBannerAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"banner广告";
    [self layoutUI];
    
}


- (void)layoutUI {
    self.sizeDcit = @{
                      jiHuoNiao_banner_ID_750100   :  [NSValue valueWithCGSize:CGSizeMake(750, 100)],
                      jiHuoNiao_banner_ID_750160  :  [NSValue valueWithCGSize:CGSizeMake(750, 160)],
                      jiHuoNiao_banner_ID_750200  :  [NSValue valueWithCGSize:CGSizeMake(750, 200)],
                      jiHuoNiao_banner_ID_750240  :  [NSValue valueWithCGSize:CGSizeMake(750, 240)],
                      jiHuoNiao_banner_ID_750300  :  [NSValue valueWithCGSize:CGSizeMake(750, 300)]
                          };
    
    JiHuoNiaoSelcetedItem *item1 = [[JiHuoNiaoSelcetedItem  alloc] initWithDict:@{@"slotID":jiHuoNiao_banner_ID_750100,@"title":@"750*100"}];
    JiHuoNiaoSelcetedItem *item2 = [[JiHuoNiaoSelcetedItem  alloc] initWithDict:@{@"slotID":jiHuoNiao_banner_ID_750160,@"title":@"750*160"}];
    JiHuoNiaoSelcetedItem *item3 = [[JiHuoNiaoSelcetedItem  alloc] initWithDict:@{@"slotID":jiHuoNiao_banner_ID_750200,@"title":@"750*200"}];
    JiHuoNiaoSelcetedItem *item4 = [[JiHuoNiaoSelcetedItem alloc] initWithDict:@{@"slotID":jiHuoNiao_banner_ID_750240,@"title":@"750*240"}];
    JiHuoNiaoSelcetedItem *item5 = [[JiHuoNiaoSelcetedItem alloc] initWithDict:@{@"slotID":jiHuoNiao_banner_ID_750300,@"title":@"750*300"}];
    self.sizeArray = @[item1,item2,item3,item4,item5];

    CGFloat marginX = jihuoniaoMYDistance(32);
    CGFloat marginY = jihuoniaoMYDistance(20);
    CGFloat btnWidth = (SCREEN_WIDTH- marginY*2-marginX*2)/3;
    CGFloat btnHeight = jihuoniaoMYDistance(90);
    CGFloat top = NavTop + jihuoniaoMYDistance(24);
    
    for (int i=0; i<self.sizeArray.count; i++) {
        JiHuoNiaoSelcetedItem * childItem = self.sizeArray[i];
        int row = i %3;
        int loc = i/3;
        CGFloat appviewx=marginX+(marginY+btnWidth)*row;
        CGFloat appviewy=(marginX+btnHeight)*loc+top;
        
        UIButton *  loadAndShowAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        loadAndShowAdButton.frame = CGRectMake(appviewx,appviewy, btnWidth,btnHeight);
        [loadAndShowAdButton setTitle:childItem.title forState:UIControlStateNormal];
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
        loadAndShowAdButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
    }

}

-(void)openAd:(UIButton *)btn{
    JiHuoNiaoSelcetedItem *item = self.sizeArray[btn.tag -100];
    NSValue *sizeValue = [self.sizeDcit objectForKey:item.slotID];
    CGSize size = [sizeValue CGSizeValue];
//    NSValue *sizeValue = [self.sizeDcit objectForKey:slotID];
    [self.JiHuoNiaoBannerADHZ removeFromSuperview];
        self.JiHuoNiaoBannerADHZ =   [[JiHuoNiaoBannerADHZ alloc]initWithJihuoniaoHZADSiteID: item.slotID];
  
    self.JiHuoNiaoBannerADHZ.frame = CGRectMake(20, 300, jihuoniaoMYDistance(size.width)-40 , jihuoniaoMYDistance(size.height));
    self.JiHuoNiaoBannerADHZ.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.JiHuoNiaoBannerADHZ];
//    self.JiHuoNiaoBannerADHZ.delegate = self;
//    [self.JiHuoNiaoBannerADHZ jiHuoNiaoHZOnlyLoad];
   
    
    
}
#pragma mark Banner⼴告曝光
- (void)JiHuoNiaoBannerADHZViewRenderSuccess
{
  
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}
#pragma mark Banner⼴告点击
- (void)JiHuoNiaoBannerADHZDidClick {
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
}

#pragma mark banner⼴告拉取成功
- (void)JiHuoNiaoBannerADHZLoadSuccess{
    NSLog(@"JiHuoNiao------%@",NSStringFromSelector(_cmd));
 
    NSLog(@"ecpm------%ld",(long)self.JiHuoNiaoBannerADHZ.jiHuoNiaoHZGetEcpmModel.ecpm);
    [self.view addSubview:self.JiHuoNiaoBannerADHZ];
    [self.JiHuoNiaoBannerADHZ jiHuoNiaoHZOnlyShow];
    
    JiHuoNiaoServerBiddingResultModel * resultModel = [[JiHuoNiaoServerBiddingResultModel alloc]init];
    resultModel.jihuoniaoWin =  0;
    resultModel.jihuoniaoWinEcpm =  self.JiHuoNiaoBannerADHZ.jiHuoNiaoHZGetEcpmModel.ecpm;
    resultModel.jihuoniaoAdnName =  @"激活鸟";
    resultModel.jihuoniaoAdTitle =  @"banner";
    resultModel.jihuoniaoAdRequestId =  @"1";
    
    [self.JiHuoNiaoBannerADHZ jiHuoNiaoHZEcpmWinSucessOrFailed:resultModel];
}
#pragma mark banner⼴告错误
- (void)JiHuoNiaoBannerADHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
    NSLog(@"JiHuoNiao------[%ld-%@]",code,tipStr);
    [XHToast showCenterWithText:tipStr];
    
}

@end
