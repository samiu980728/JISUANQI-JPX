//
//  VView.h
//  计算器的实现
//
//  Created by 萨缪 on 2018/9/28.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaculatorBrain.h"
@interface VView : UIView

@property (nonatomic, strong) UIButton * symbolAndNumButton;

@property (nonatomic, strong) UIButton * acButton;

@property (nonatomic, strong) UIButton * leftBracketButton;

@property (nonatomic, strong) UIButton * rightBracketButton;

@property (nonatomic, strong) UIButton * divisionButton;

@property (nonatomic, strong) UIButton * sevenButton;

@property (nonatomic, strong) UIButton * eightButton;

@property (nonatomic, strong) UIButton * nineButton;

@property (nonatomic, strong) UIButton * multiplicativeButton;

@property (nonatomic, strong) UIButton * fourButton;

@property (nonatomic, strong) UIButton * fiveButton;

@property (nonatomic, strong) UIButton * sixButton;

@property (nonatomic, strong) UIButton * subtractionButton;

@property (nonatomic, strong) UIButton * oneButton;

@property (nonatomic, strong) UIButton * twoButton;

@property (nonatomic, strong) UIButton * threeButton;

@property (nonatomic, strong) UIButton * additiveButton;

@property (nonatomic, strong) UIButton * zeroButton;

@property (nonatomic, strong) UIButton * dotButton;

@property (nonatomic, strong) UIButton * equalButton;

@property (nonatomic, strong) UITextField * numTextField;

@property (nonatomic, strong) UILabel * numLabel;

@property (nonatomic, strong) UITextView * numTextView;

@property (nonatomic, strong) CaculatorBrain * caculator;

@property (nonatomic, strong) NSString * screenStr;

@property (nonatomic, strong) NSMutableString * screenMutStr;


- (void)viewInit;

- (void)setButton:(UIButton *)btn;

- (void)setElseButton:(UIButton *)btn;

- (void)showScreenText:(UITextView *)textView;

@end
