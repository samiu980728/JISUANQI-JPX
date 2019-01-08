//
//  ViewController.h
//  计算器的实现
//
//  Created by 萨缪 on 2018/9/26.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaculatorBrain.h"
#import "VView.h"
@interface ViewController : UIViewController

@property (nonatomic, strong) VView * viewReal;

@property (nonatomic, strong) CaculatorBrain * caculator;

@property (nonatomic, strong) NSMutableArray * realNumMutArray;

@property (nonatomic, strong) NSMutableArray * realSymbolMutArray;

@end

