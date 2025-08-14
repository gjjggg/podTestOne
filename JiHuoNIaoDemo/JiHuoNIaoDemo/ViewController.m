//
//  ViewController.m
//  GuangGaoCeDemo
//
//  Created by ooo on 2024/9/3.
//

#import "ViewController.h"
#import "JiHuoNiaoSplashAdViewController.h"
#import "JiHuoNiaoRewardAdViewController.h"
#import "JiHuoNiaoInterstitialAdViewController.h"
#import "JiHuoNiaoFeedAdViewController.h"
#import "JiHuoNiaoIndexGuangGao.h"
#import "JiHuoNiaoActionCellView.h"
#import "JiHuoNiaoBannerAdViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    NSLog(@"=====%lf    ====%lf",SCREEN_WIDTH,SCREEN_HEIGHT);
    UIImageView *backimgView = [UIImageView new];
    backimgView.image = [UIImage imageNamed:@"img_feed_yjbj"];
    backimgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//    backimgView.contentMode = UIViewContentModeTop;
    backimgView.contentMode = UIViewContentModeScaleAspectFill;
    backimgView.clipsToBounds = YES;
    [self.view addSubview:backimgView];
    
    [self.navigationController.navigationBar setBarTintColor:UIColor.whiteColor];
    [self.navigationController.navigationBar setTintColor:AdSColor(34, 34, 34)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : AdSColor(34, 34, 34)}];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.title = @"激活鸟广告";
    
    self.view.backgroundColor = AdSColor(255, 246, 246);
    
    [self.view addSubview:self.tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    [self createTableHeader];
    
}

-(void)createTableHeader{
    UIView * tableHeaderView = [[UIView alloc]init];
    tableHeaderView.clipsToBounds = YES;
    tableHeaderView.backgroundColor = UIColor.clearColor;
    
    self.tableView.tableHeaderView = tableHeaderView;
    
  
   
    UILabel * titleLable = [[UILabel alloc] initWithFrame:CGRectMake(35,NavTop+ jihuoniaoMYDistance(10), 500, jihuoniaoMYDistance(32))];
    titleLable.textColor =AdSColor(166, 132, 132);
    titleLable.text = @"HI，欢迎使用激活鸟广告";
    titleLable.font =  jihuoniaoFontMakeRegular(13);
    [tableHeaderView addSubview:titleLable];
    
    UILabel * memoLabel = [[UILabel alloc] initWithFrame:CGRectMake(35,titleLable.frame.size.height+titleLable.frame.origin.y, 500, jihuoniaoMYDistance(74))];
    memoLabel.textColor =AdSColor(72, 38, 38);
    memoLabel.text = @"请选择需要的模版";
    memoLabel.font =  jihuoniaoFontMakeMedium(22);
    tableHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH,memoLabel.frame.size.height+memoLabel.frame.origin.y+jihuoniaoMYDistance(76));
    [tableHeaderView addSubview:memoLabel];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"开屏Splash",@"插屏Interstitial",@"激励视频Reward",@"信息流Feed",@"banner广告"];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 118+20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString  *indentifier = @"adNameCell";
    JiHuoNiaoActionCellView *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[JiHuoNiaoActionCellView alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:indentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.titleLable.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row + 1) {
            
        case 1:[self SplashAd];
            break;
        case 2:[self Interstitial];
            break;
        case 3:[self RewardVideoAd];
            break;
        case 4:[self FeedAd];
            break;
        case 5:[self bannerAd];
            break;
        default:
            break;
    }
}

/* --开屏 */
-(void)SplashAd
{
  
    JiHuoNiaoSplashAdViewController *vc = [[JiHuoNiaoSplashAdViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
/* --插屏 */
-(void)Interstitial
{
    JiHuoNiaoInterstitialAdViewController *vc = [[JiHuoNiaoInterstitialAdViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
/* --激励视频 */
-(void)RewardVideoAd
{
    JiHuoNiaoRewardAdViewController *vc = [[JiHuoNiaoRewardAdViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
/* --信息流 */
-(void)FeedAd
{
    JiHuoNiaoFeedAdViewController *vc = [[JiHuoNiaoFeedAdViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
/* --全屏视频 */
-(void)bannerAd
{
    JiHuoNiaoBannerAdViewController *vc = [[JiHuoNiaoBannerAdViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (scrollView.contentOffset.y>NavTop) {
//        self.navigationController.navigationBarHidden = NO;
//    }else{
//        self.navigationController.navigationBarHidden = YES;
//    }
}


@end
