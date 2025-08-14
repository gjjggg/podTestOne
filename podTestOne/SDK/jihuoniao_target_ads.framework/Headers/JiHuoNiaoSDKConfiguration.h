//
//  JiHuoNiaoSDKConfiguration.h
//  JiHuoNiaoAdHZSDK
//
//  Created by ooo on 2024/10/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, JiHuoNiaoAdSDKAgeGroup) {
    JiHuoNiaoAdSDKAgeGroupAdult        = 0, // Default
    JiHuoNiaoAdSDKAgeGroupTeenager     = 1, // Age 15~18
    JiHuoNiaoAdSDKAgeGroupMinor        = 2, // Age < 15
};
@interface JiHuoNiaoSDKConfiguration : NSObject
+ (instancetype)configuration;
//自定义idfa
@property (nonatomic, copy) NSString * jihuoniaoCustomIdfa;
//是否是个人推荐
@property (nonatomic, assign) BOOL jihuoniaoIsPersonalAds;
//是否允许程序化
@property (nonatomic, assign) BOOL jihuoniaoIsPprogrammaticAds;
//年龄
@property (nonatomic, assign) JiHuoNiaoAdSDKAgeGroup jihuoniaoSDKAgeGroup;

/// 外部媒体通过该接口传递经纬度
/// @param lon 经度
/// @param lat 纬度
+ (void)setjihuoniaoSDKLBSLon:(NSString *)lon lat:(NSString *)lat;
@end

NS_ASSUME_NONNULL_END
