//
//  JiHuoNiaoSelcetedItem.h
//  JIHuoNIaoDemo
//
//  Created by ooo on 2024/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JiHuoNiaoSelcetedItem : NSObject
@property (nonatomic, copy) NSString *slotID;
@property (nonatomic, copy) NSString *title;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
