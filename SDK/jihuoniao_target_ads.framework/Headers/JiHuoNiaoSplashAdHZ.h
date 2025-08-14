//
//  TYKSplashAd.h
//  JIHuoNiaoAdSDK
//
//  Created by ooo on 2024/9/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <jihuoniao_target_ads/JiHuoNiaoServerBiddingResultModel.h>

NS_ASSUME_NONNULL_BEGIN
@protocol JiHuoNiaoSplashAdHZDelegate <NSObject>
/**
 开屏⼴告
 */
- (void)JiHuoNiaoSplashViewHZRenderSuccess;
/**
 开屏⼴告点击
 */
- (void)JiHuoNiaoSplashViewHZDidClick;
/**
 开屏⼴告关闭
 */
- (void)JiHuoNiaoSplashViewHZDidClose;

/**
 开屏网络请求成功
 */
- (void)JiHuoNiaoSplashViewHZLoadSuccess;

/**
 开屏网络请求错误
 */
- (void)JiHuoNiaoSplashViewHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage;

@end

@interface JiHuoNiaoSplashAdHZ : NSObject

@property(nonatomic,weak) id<JiHuoNiaoSplashAdHZDelegate> delegate;
/*
 广告位id

 **/
- (instancetype)initWithJihuoniaoHZADSiteID:(NSString *)slotID;
/*
 如果需要设置logo则调用，非必需
 **/
- (void)setJiHuoNiaoHZLogoBottom:(UIView *)logoBottom;

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
