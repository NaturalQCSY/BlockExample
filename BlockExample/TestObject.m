//
//  TestObject.m
//  BlockExample
//
//  Created by chenshenyi on 16/3/17.
//  Copyright © 2016年 chenshenyi. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    
    return sharedInstance;
}

- (void)sendHTTPRequest
{
    //获取数据，各种请求
    //...
    //...
    //最终请求道的数据json转换成了NSDictionary
    NSDictionary *jsonDictionary = [[NSDictionary alloc] init];
    
    //第一种，用之前声明的block传出去
    if (self.testFirstBlock) {
        self.testFirstBlock(jsonDictionary);
    }
    
    //第三种，同样要单独传出去
    if (self.testThirdBlock) {
        self.testThirdBlock(jsonDictionary);
    }
}

#pragma mark - 网络请求
- (void)sendHTTPRequestWithSuccessSecondBlock:(void(^)(NSDictionary *dictionary))successSecondBlock
{
    //获取数据，各种请求
    //...
    //...
    //最终请求道的数据json转换成了NSDictionary
    NSDictionary *jsonDictionary = [[NSDictionary alloc] init];
    
    //拿到数据之后通过方法里面写的block传出去
    successSecondBlock(jsonDictionary);
}


//第三种
- (void)sendHTTPRequestWithSuccessThirdBlock:(TestThirdBlock)successThirdBlock
{
    self.testThirdBlock = successThirdBlock;
}

@end
