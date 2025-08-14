//
//  JiHuoNiaoInterstitialAd.h
//  JIHuoNiaoAdSDK
//
//  Created by ooo on 2024/9/13.
//

#import <Foundation/Foundation.h>
#import <jihuoniao_target_ads/JiHuoNiaoServerBiddingResultModel.h>
NS_ASSUME_NONNULL_BEGIN
@protocol JiHuoNiaoInterstitialAdHZDelegate <NSObject>
@optional

/**
 插⼴告错误
 */
- (void)JiHuoNiaoInterstitialAdHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage;
/**
 插屏⼴告网络请求成功
 */
- (void)JiHuoNiaoInterstitialAdHZLoadSuccess;
/**
 插屏⼴告曝光
 */
- (void)JiHuoNiaoInterstitialAdHZRenderSuccess;

/**
 插屏⼴告点击
 */
- (void)JiHuoNiaoInterstitialAdHZDidClick;

/**
 插屏⼴告关闭
 */
- (void)JiHuoNiaoInterstitialAdHZDidClose;

@end

@interface JiHuoNiaoInterstitialAdHZ : NSObject
@property(nonatomic,weak) id<JiHuoNiaoInterstitialAdHZDelegate> delegate;
/*
 广告位id

 **/
- (instancetype)initWithJihuoniaoHZADSiteID:(NSString *)slotID;

/*
 加载成功后直接显示
 */
- (void)jiHuoNiaoHZLoadAd;

/*
 加载广告
 */
- (void)jiHuoNiaoHZOnlyLoad;

/*
 显示
 */
- (void)jiHuoNiaoHZOnlyShow;
/*
 竞价价格
 */
- (NSInteger)jiHuoNiaoHZGetEcpm;
/*
 竞价成功 或失败
 */
-(void)jiHuoNiaoHZEcpmWinSucessOrFailed:(JiHuoNiaoServerBiddingResultModel *)jihuoNiaoResultModel;

@end

NS_ASSUME_NONNULL_END
