//
//  TYKSDKManager.h
//  JIHuoNiaoAdSDK
//
//  Created by ooo on 2024/9/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JiHuoNiaoSDKManagerHZ : NSObject

/**
 appID ：应用id
 appkey：appkey
 isLocation：是否允许获取位置信息 允许能有效提高广告收益
*/
+ (void)startWithAppid:(NSString *)appID AppKey:(NSString *)appkey isGetLocation:(BOOL)isLocation;
/**
 SDK版本号
*/
+ (NSString *)SDKVersion;

@end

NS_ASSUME_NONNULL_END
