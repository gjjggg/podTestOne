//
//  JiHuoNiaoFeedAdViewController.m
//  JiHuoNiaoSDKDemo
//
//  Created by ZJL on 2022/08/03.
//

#import "JiHuoNiaoFeedAdViewController.h"

// 方便将来测试用
#define JiHuoNiao_FeedDistributionNumber      5
#define JiHuoNiao_FeedDefaultCellHeight       100

@interface JiHuoNiaoFeedAdViewController ()<JiHuoNiaoFeedAdHZDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIButton *loadAdBtn;
@property(nonatomic,strong) JiHuoNiaoFeedAdHZ *JiHuoNiaoFeedAd;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) NSMutableArray *feedAdAdViews;

@end

@implementation JiHuoNiaoFeedAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"信息流Feed";
    
    [self createTableView];
    [self loadFeedAd];
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
   
}
- (void)createTableView {

    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"jihuoniaoNativeExpressCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"jihuoniaoSplitNativeExpressCell"];
   
}

//广告请求接口
- (void)loadFeedAd {
    
    //设置宽度。高度是按宽度自适应
    CGFloat width = [UIScreen mainScreen].bounds.size.width-28;
    self.JiHuoNiaoFeedAd = [[JiHuoNiaoFeedAdHZ alloc] initWithJihuoniaoHZADSiteID:jiHuoNiao_feed_ID Size:CGSizeMake(width, 0)];
    self.JiHuoNiaoFeedAd.delegate = self;
    //拉取广告，count为拉取范围1-3，最大值为3条
    [self.JiHuoNiaoFeedAd jihuoniaoHZLoadAdWithCount:3];
    
    
   
    
}
-(void)JiHuoNiaoFeedAdHZLoad:(NSArray<JiHuoNiaoServerEcpmRequestModel *> *)adList{
    for (JiHuoNiaoServerEcpmRequestModel * model in adList) {
        JiHuoNiaoServerBiddingResultModel * resultModel = [[JiHuoNiaoServerBiddingResultModel alloc]init];
        resultModel.jihuoniaoWinEcpm = model.ecpm;
        if(model.ecpm>5){
            resultModel.jihuoniaoWin = 1;

        }else{
            resultModel.jihuoniaoWin = 0;
        }
        resultModel.jihuoniaoAdnName =  @"激活鸟";
        resultModel.jihuoniaoAdTitle =  @"信息流";
        resultModel.jihuoniaoAdRequestId =  @"1";
        [self.JiHuoNiaoFeedAd jiHuoNiaoHZEcpmWinSucessOrFailed:resultModel withJihuoniaoAdSiteId:model.jihuoniao_ad_site_id];
    }
    NSLog(@"JiHuoNiao------成功请求到广告数据 ");
}
#pragma mark  信息流⼴告加载成功 返回数据源
- (void)JiHuoNiaoFeedAdHZDidLoadView:(NSArray *)feedDataArray{
    
    NSLog(@"JiHuoNiao------成功请求到广告View ");
    self.feedAdAdViews = [NSMutableArray arrayWithArray:feedDataArray];
    [self.tableView reloadData];
}

#pragma mark   信息流视频⼴告错误
- (void)JiHuoNiaoFeedAdHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage{
    NSLog(@"JiHuoNiao------[%ld-%@]",code,tipStr);
    [XHToast showCenterWithText:tipStr];
}

#pragma mark   信息流⼴告渲染成功
- (void)JiHuoNiaoFeedAdHZViewRenderSuccess{
    NSLog(@"JiHuoNiao------JiHuoNiaoFeedAdHZViewRenderSuccess");
    //渲染成功 刷新tableview
//    [self.tableView reloadData];
}
#pragma mark    信息流⼴告曝光成功
- (void)JiHuoNiaoFeedAdHZViewExposure {
    NSLog(@"JiHuoNiao------JiHuoNiaoFeedAdHZViewExposure");
}

#pragma mark     信息流⼴告关闭
- (void)JiHuoNiaoFeedAdHZDidClose:(id)feedAd {
    NSLog(@"JiHuoNiao------JiHuoNiaoFeedAdHZDidClose");

    [self.feedAdAdViews removeObject:feedAd];
    [self.tableView reloadData];
}
#pragma mark  点击
- (void)JiHuoNiaoFeedAdHZDidClick{
    NSLog(@"JiHuoNiao------JiHuoNiaoFeedAdHZDidClick");
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % JiHuoNiao_FeedDistributionNumber == 0) {
        UIView *view = [self.feedAdAdViews objectAtIndex:indexPath.row / JiHuoNiao_FeedDistributionNumber];
        return view.bounds.size.height+20;
    }
    else {
        return JiHuoNiao_FeedDefaultCellHeight;
    }

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.feedAdAdViews.count * JiHuoNiao_FeedDistributionNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
  
    if (indexPath.row % JiHuoNiao_FeedDistributionNumber == 0) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"jihuoniaoNativeExpressCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = [UIColor clearColor];
       
     
        UIView *subView = (UIView *)[cell.contentView viewWithTag:1000];
        if ([subView superview]) {
            [subView removeFromSuperview];
        }
        NSInteger i =indexPath.row / JiHuoNiao_FeedDistributionNumber ;
        UIView *view = self.feedAdAdViews[i];
        view.tag = 1000;
        view.clipsToBounds = YES;
        view.layer.cornerRadius = 8;

        [self addAccessibilityIdentifier:view];
        view.frame =  CGRectMake(14, 10,view.bounds.size.width, view.bounds.size.height);
        [cell.contentView addSubview:view];
        cell.contentView.backgroundColor =  AdSColor(245, 247, 250);
        
        return cell;
    }else{
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"jihuoniaoSplitNativeExpressCell" forIndexPath:indexPath];
        cell.textLabel.text = @"1";
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView *view = [cell.contentView viewWithTag:1000];
    if (view) {
        [self removeAccessibilityIdentifier:view];
    }
}

- (void)addAccessibilityIdentifier:(UIView *)adView {
    adView.accessibilityIdentifier = @"express_feed_view";
}

- (void)removeAccessibilityIdentifier:(UIView *)adView {
    adView.accessibilityIdentifier = nil;
}


- (NSMutableArray *)feedAdAdViews {
    if (!_feedAdAdViews) {
        _feedAdAdViews = [NSMutableArray array];
    }
    return _feedAdAdViews;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
//        _tableView.frame = CGRectMake(0,100, SCREEN_WIDTH, SCREEN_WIDTH-100);
        _tableView.frame = self.view.bounds;
//        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = AdSColor(245, 247, 250);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
    }
    return _tableView;
}
-(void)dealloc{
     NSLog(@"dell");
}
@end
