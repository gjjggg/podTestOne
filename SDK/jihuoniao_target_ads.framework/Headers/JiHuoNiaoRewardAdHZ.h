//
//  JiHuoNiaoRewardAd.h
//  JIHuoNiaoAdSDK
//
//  Created by ooo on 2024/9/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <jihuoniao_target_ads/JiHuoNiaoServerBiddingResultModel.h>
NS_ASSUME_NONNULL_BEGIN


@protocol JiHuoNiaoRewardAdHZDelegate <NSObject>

@optional

/**
激励视频⼴告网络加载成功
*/
- (void)JiHuoNiaoRewardedVideoAdHZDidLoad;
/**
激励视频⼴告
*/
- (void)JiHuoNiaoRewardedVideoAdHZViewRenderSuccess;
/**
激励视频⼴告点击
*/
- (void)JiHuoNiaoRewardedVideoAdHZDidClick;
/**
激励视频⼴告关闭
*/
- (void)JiHuoNiaoRewardedVideoAdHZDidClose;

 /**
 激励视频⼴告错误
 */

- (void)JiHuoNiaoRewardedVideoAdHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage;

/**
 激励视频⼴告奖励
 */
- (void)JiHuoNiaoRewardedVideoAdHZHasReward;

@end

@interface JiHuoNiaoRewardAdHZ : NSObject

@property(nonatomic,weak) id<JiHuoNiaoRewardAdHZDelegate> delegate;
//媒体用户id
@property(nonatomic,strong) NSString * jiHuoNiao_user_id;
//媒体用户扩展信息可选json
@property(nonatomic,strong) NSString * jiHuoNiao_user_extra;



- (instancetype)initWithJihuoniaoHZADSiteID:(NSString *)slotID;

//加载并显示
- (void)jiHuoNiaoHZLoadShowRewardAd:(UIViewController *)viewController;
//仅加载
- (void)jiHuoNiaoHZLoadRewardAd;
//显示
- (void)jiHuoNiaoHZShowRewardAd:(UIViewController *)viewController;
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
