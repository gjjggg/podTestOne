//
//  JiHuoNiaoServerBiddingResultModel.h
//  JiHuoNiaoAdHZSDK
//
//  Created by ooo on 2024/11/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JiHuoNiaoServerBiddingResultModel : NSObject
/** 是否竞价成功 1 成功 0 失败*/
@property (nonatomic, assign) NSInteger jihuoniaoWin;
// 竞胜方，报价，单位分/千次
@property (nonatomic, assign) NSInteger  jihuoniaoWinEcpm;
// 竞价排名第二的报价，单位分/千次
@property (nonatomic, assign) NSInteger  jihuoniaoSecondEcpm;
// 竞胜方为第三方 ADN 时 (adnType=AdnType.THIRD_PARTY_AD)，竞胜平台名称
@property (nonatomic, copy) NSString * jihuoniaoAdnName;
// 竞胜广告主名称
@property (nonatomic, copy) NSString * jihuoniaoAdUserName;
// 竞胜广告标题
@property (nonatomic, copy) NSString * jihuoniaoAdTitle;
// 竞胜方请求 ID
@property (nonatomic, copy) NSString * jihuoniaoAdRequestId;
// 竞胜方 dsp 本次请求是否展示 1:是 0：否
@property (nonatomic, assign) NSInteger  jihuoniaoIsShow;
// 竞胜方 dsp 本次 pv 是否被点击 1:是 0：否
@property (nonatomic, assign) NSInteger  jihuoniaoIsClick;
@end

@interface JiHuoNiaoServerEcpmRequestModel : NSObject
//竞价
@property (nonatomic, assign) NSInteger  ecpm;

@property (nonatomic, copy) NSString * jihuoniao_ad_site_id;

@end
NS_ASSUME_NONNULL_END
