//
//  CaculatorBrain.h
//  计算器的实现
//
//  Created by 萨缪 on 2018/9/26.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorBrain : NSObject

@property (nonatomic, strong) NSMutableArray * numMutArray;

@property (nonatomic, strong) NSMutableArray * symbolMutArray;

@property (nonatomic, strong) NSMutableArray * XnumMutArray;

@property (nonatomic, strong) NSMutableArray * XsymbolMutArray;

@property (nonatomic, strong) NSMutableArray * finalMutArray;

@property (nonatomic, strong) NSMutableArray * temporaryMutArray;

@property (nonatomic, assign) float x;

- (void)createNumAndSymobl;

- (float)cacluateNum;

@end
