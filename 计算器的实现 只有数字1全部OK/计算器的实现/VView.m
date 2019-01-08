//
//  VView.m
//  计算器的实现
//
//  Created by 萨缪 on 2018/9/28.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "VView.h"
#import "CaculatorBrain.h"
@implementation VView

- (void)viewInit
{
    _numTextView = [[UITextView alloc] init];
    //_numTextField = [[UITextField alloc] init];
    _numTextView.frame = CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, 80);
    _numTextView.backgroundColor = [UIColor blackColor];
    _numTextView.textAlignment = NSTextAlignmentRight;
    _numTextView.textColor = [UIColor whiteColor];
    _numTextView.font = [UIFont systemFontOfSize:50];
    
    
    [self addSubview:_numTextView];
    
    NSInteger value = 0;
    //存储按钮数组 并放到屏幕上
    int numInScreen;
    
    _acButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _leftBracketButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _rightBracketButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _divisionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sevenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _eightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _nineButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _multiplicativeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _fourButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _fiveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sixButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _subtractionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _oneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _twoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _threeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _additiveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _zeroButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _dotButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _equalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    _acButton.frame = CGRectMake(15, 200, 85, 85);
    _leftBracketButton.frame = CGRectMake(115, 200, 85, 85);
    _rightBracketButton.frame = CGRectMake(215, 200, 85, 85);
    _divisionButton.frame = CGRectMake(315, 200, 85, 85);
    
    _sevenButton.frame = CGRectMake(15, 305, 85, 85);
    _eightButton.frame = CGRectMake(115, 305, 85, 85);
    _nineButton.frame = CGRectMake(215, 305, 85, 85);
    _multiplicativeButton.frame = CGRectMake(315, 305, 85, 85);
    
    _fourButton.frame = CGRectMake(15, 410, 85, 85);
    _fiveButton.frame = CGRectMake(115, 410, 85, 85);
    _sixButton.frame = CGRectMake(215, 410, 85, 85);
    _subtractionButton.frame = CGRectMake(315, 410, 85, 85);
    
    _oneButton.frame = CGRectMake(15, 515, 85, 85);
    _twoButton.frame = CGRectMake(115, 515, 85, 85);
    _threeButton.frame = CGRectMake(215, 515, 85, 85);
    _additiveButton.frame = CGRectMake(315, 515, 85, 85);
    
    _zeroButton.frame = CGRectMake(15, 620, 170, 85);
    _dotButton.frame = CGRectMake(215, 620, 85, 85);
    _equalButton.frame = CGRectMake(315, 620, 85, 85);
    
    _acButton.backgroundColor = [UIColor grayColor];
    _leftBracketButton.backgroundColor = [UIColor grayColor];
    _rightBracketButton.backgroundColor = [UIColor grayColor];
    _divisionButton.backgroundColor = [UIColor orangeColor];
    _sevenButton.backgroundColor = [UIColor darkGrayColor];
    _eightButton.backgroundColor = [UIColor darkGrayColor];
    _nineButton.backgroundColor = [UIColor darkGrayColor];
    _multiplicativeButton.backgroundColor = [UIColor orangeColor];
    _fourButton.backgroundColor = [UIColor darkGrayColor];
    _fiveButton.backgroundColor = [UIColor darkGrayColor];
    _sixButton.backgroundColor = [UIColor darkGrayColor];
    _subtractionButton.backgroundColor = [UIColor orangeColor];
    _oneButton.backgroundColor = [UIColor darkGrayColor];
    _twoButton.backgroundColor = [UIColor darkGrayColor];
    _threeButton.backgroundColor = [UIColor darkGrayColor];
    _additiveButton.backgroundColor = [UIColor orangeColor];
    _zeroButton.backgroundColor = [UIColor darkGrayColor];
    _dotButton.backgroundColor = [UIColor darkGrayColor];
    _equalButton.backgroundColor = [UIColor darkGrayColor];
    
    
    [_acButton setTitle:@"AC" forState:UIControlStateNormal];
    [_leftBracketButton setTitle:@"(" forState:UIControlStateNormal];
    [_rightBracketButton setTitle:@")" forState:UIControlStateNormal];
    [_divisionButton setTitle:@"/" forState:UIControlStateNormal];
    [_sevenButton setTitle:@"7" forState:UIControlStateNormal];
    [_eightButton setTitle:@"8" forState:UIControlStateNormal];
    [_nineButton setTitle:@"9" forState:UIControlStateNormal];
    [_multiplicativeButton setTitle:@"*" forState:UIControlStateNormal];
    [_fourButton setTitle:@"4" forState:UIControlStateNormal];
    [_fiveButton setTitle:@"5" forState:UIControlStateNormal];
    [_sixButton setTitle:@"6" forState:UIControlStateNormal];
    [_subtractionButton setTitle:@"-" forState:UIControlStateNormal];
    [_oneButton setTitle:@"1" forState:UIControlStateNormal];
    [_twoButton setTitle:@"2" forState:UIControlStateNormal];
    [_threeButton setTitle:@"3" forState:UIControlStateNormal];
    [_additiveButton setTitle:@"+" forState:UIControlStateNormal];
    [_zeroButton setTitle:@"0" forState:UIControlStateNormal];
    [_dotButton setTitle:@"." forState:UIControlStateNormal];
    [_equalButton setTitle:@"=" forState:UIControlStateNormal];
    
    
    
    [self setButton:_divisionButton];
    [self setButton:_multiplicativeButton];
    [self setButton:_subtractionButton];
    [self setButton:_additiveButton];
    [self setButton:_equalButton];
    [self setButton:_dotButton];
    
    [self setButton:_sevenButton];
    [self setButton:_eightButton];
    [self setButton:_nineButton];
    [self setButton:_fourButton];
    [self setButton:_fiveButton];
    [self setButton:_sixButton];
    [self setButton:_oneButton];
    [self setButton:_twoButton];
    [self setButton:_threeButton];
    [self setButton:_zeroButton];
    
    [self setElseButton:_acButton];
    [self setElseButton:_leftBracketButton];
    [self setElseButton:_rightBracketButton];
    
    
//    [self addSubview:_acButton];
//    [self addSubview:_leftBracketButton];
//    [self addSubview:_rightBracketButton];
//    [self addSubview:_divisionButton];
//    [self addSubview:_sevenButton];
//    [self addSubview:_eightButton];
//    [self addSubview:_nineButton];
//    [self addSubview:_multiplicativeButton];
//    [self addSubview:_fourButton];
//    [self addSubview:_fiveButton];
//    [self addSubview:_sixButton];
//    [self addSubview:_subtractionButton];
//    [self addSubview:_oneButton];
//    [self addSubview:_twoButton];
//    [self addSubview:_threeButton];
//    [self addSubview:_additiveButton];
//    [self addSubview:_zeroButton];
//    [self addSubview:_dotButton];
//    [self addSubview:_equalButton];
//
    
//    for (int i = 0; i < 5; i++) {
//        for (int j = 0; j < 4; j++) {
//            _symbolAndNumButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//            _symbolAndNumButton.frame = CGRectMake(15+100*j, 200+105*i, 85, 85);
//            [_symbolAndNumButton.layer setMasksToBounds:YES];
//            [_symbolAndNumButton.layer setCornerRadius:40.0];
//            [_symbolAndNumButton setTag:value];
//            //设置自适应
//            //_symbolAndNumButton.titleLabel.adjustsFontSizeToFitWidth = YES;
//            _symbolAndNumButton.titleLabel.font = [UIFont systemFontOfSize:40];
//
//
//            //加入点击事件
//            //[_symbolAndNumButton addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
//
//            if ( i == 0 && j <= 2){
//                [_symbolAndNumButton setBackgroundColor:[UIColor grayColor]];
//                [_symbolAndNumButton setTintColor:[UIColor blackColor]];
//            }
//
//            if ( j == 3 ){
//                //                [_symbolAndNumButton setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateHighlighted];
//                [_symbolAndNumButton setBackgroundColor:[UIColor orangeColor]];
//
//                [_symbolAndNumButton setTintColor:[UIColor whiteColor]];
//            }
//            if ( j <= 2 && i != 0 ){
//                [_symbolAndNumButton setBackgroundColor:[UIColor darkGrayColor]];
//                [_symbolAndNumButton setTintColor:[UIColor whiteColor]];
//            }
//
//            if ( _symbolAndNumButton.tag == 0 ){
//                [_symbolAndNumButton setTitle:@"AC" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 1 ){
//                [_symbolAndNumButton setTitle:@"(" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 2 ){
//                [_symbolAndNumButton setTitle:@")" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 3 ){
//                [_symbolAndNumButton setTitle:@"/" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 4 ){
//                [_symbolAndNumButton setTitle:@"7" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 5 ){
//                [_symbolAndNumButton setTitle:@"8" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 6 ){
//                [_symbolAndNumButton setTitle:@"9" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 7 ){
//                [_symbolAndNumButton setTitle:@"*" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 8 ){
//                [_symbolAndNumButton setTitle:@"4" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 9 ){
//                [_symbolAndNumButton setTitle:@"5" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 10 ){
//                [_symbolAndNumButton setTitle:@"6" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 11 ){
//                [_symbolAndNumButton setTitle:@"-" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 12 ){
//                [_symbolAndNumButton setTitle:@"1" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 13 ){
//                [_symbolAndNumButton setTitle:@"2" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 14 ){
//                [_symbolAndNumButton setTitle:@"3" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 15 ){
//                [_symbolAndNumButton setTitle:@"+" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 16 ){
//                [_symbolAndNumButton setTitle:@"0" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 17 ){
//                [_symbolAndNumButton setTitle:@"0" forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 18 ){
//                [_symbolAndNumButton setTitle:@"." forState:UIControlStateNormal];
//            }
//            if ( _symbolAndNumButton.tag == 19 ){
//                [_symbolAndNumButton setTitle:@"=" forState:UIControlStateNormal];
//            }
//
//
//            value++;
//
//
//            [self addSubview:_symbolAndNumButton];
//        }
//    }
}

- (void)setButton:(UIButton *)btn
{
    btn.layer.cornerRadius = 40;
    [btn setTintColor:[UIColor whiteColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:40];
    [self addSubview:btn];
}

- (void)setElseButton:(UIButton *)btn
{
    btn.layer.cornerRadius = 40;
    [btn setTintColor:[UIColor blackColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:40];
    [self addSubview:btn];
}

- (void)showScreenText:(UITextView *)textView
{
    textView.text = _screenMutStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
