//
//  JiHuoNiaoBannerADHZ.h
//  jihuoniao.target.ads
//
//  Created by ooo on 2024/12/30.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <jihuoniao_target_ads/JiHuoNiaoServerBiddingResultModel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JiHuoNiaoBannerADHZDelegate <NSObject>

@optional
/**
 Banner⼴告加载成功
 */
-(void)JiHuoNiaoBannerADHZLoadSuccess;

/**
 Banner视频⼴告错误
 */
- (void)JiHuoNiaoBannerADHZFailWithCode:(NSInteger)code TipStr:(NSString *)tipStr ErrorMessage:(NSString *)errorMessage;

/**
 Banner⼴告渲染成功
 */
- (void)JiHuoNiaoBannerADHZViewRenderSuccess;
/**
 Banner⼴告点击
 */
- (void)JiHuoNiaoBannerADHZDidClick;

@end

@interface JiHuoNiaoBannerADHZ : UIView

@property(nonatomic,weak) id<JiHuoNiaoBannerADHZDelegate> delegate;
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
- (JiHuoNiaoServerEcpmRequestModel *)jiHuoNiaoHZGetEcpmModel;
/*
 竞价成功 或失败
 */
-(void)jiHuoNiaoHZEcpmWinSucessOrFailed:(JiHuoNiaoServerBiddingResultModel *)jihuoNiaoResultModel;
@end

NS_ASSUME_NONNULL_END
