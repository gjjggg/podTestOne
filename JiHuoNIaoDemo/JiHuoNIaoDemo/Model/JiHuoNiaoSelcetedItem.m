//
//  JiHuoNiaoSelcetedItem.m
//  JIHuoNIaoDemo
//
//  Created by ooo on 2024/12/30.
//

#import "JiHuoNiaoSelcetedItem.h"

@implementation JiHuoNiaoSelcetedItem
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.slotID = dict[@"slotID"];
        self.title = dict[@"title"];
    }
    return self;
}
@end
