//
//  ViewController.m
//  BlockExample
//
//  Created by chenshenyi on 16/3/17.
//  Copyright © 2016年 chenshenyi. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"
@interface ViewController ()
{

}
@property (nonatomic, strong)NSDictionary *dataDict;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getData];
    [self testBlockMethod];
}

- (void)getData
{
    //第一种
    [TestObject sharedInstance].testFirstBlock = ^(NSDictionary *dictionary){
        self.dataDict = dictionary;
    };
}

- (void)testBlockMethod
{
    [[TestObject sharedInstance] sendHTTPRequest];
    
    //第二种
    [[TestObject sharedInstance] sendHTTPRequestWithSuccessSecondBlock:^(NSDictionary *dictionary) {
        self.dataDict = dictionary;
    }];
    
    //第三种
    [[TestObject sharedInstance] sendHTTPRequestWithSuccessThirdBlock:^(NSDictionary *thirdDictionary) {
        self.dataDict = thirdDictionary;
    }];
}
@end
