//
//  TestObject.h
//  BlockExample
//
//  Created by chenshenyi on 16/3/17.
//  Copyright © 2016年 chenshenyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject

typedef void(^TestFirstBlock)(NSDictionary *data);//声明block
@property (nonatomic, copy)TestFirstBlock testFirstBlock;//创建block对象

//第三种和第一种类似
typedef void(^TestThirdBlock)(NSDictionary *thirdDictionary);
@property (nonatomic, copy)TestThirdBlock testThirdBlock;//创建block对象


+ (instancetype)sharedInstance;

#pragma mark - 网络请求
- (void)sendHTTPRequest;

#pragma mark - 网络请求
- (void)sendHTTPRequestWithSuccessSecondBlock:(void(^)(NSDictionary *dictionary))successSecondBlock;

#pragma mark - 网络请求
- (void)sendHTTPRequestWithSuccessThirdBlock:(TestThirdBlock)successThirdBlock;

@end
