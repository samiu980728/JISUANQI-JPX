//
//  ViewController.m
//  计算器的实现
//
//  Created by 萨缪 on 2018/9/26.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "ViewController.h"
#import "CaculatorBrain.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _viewReal = [[VView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    //定义字符串
    _viewReal.screenMutStr = [[NSMutableString alloc] init];
    
    _caculator = [[CaculatorBrain alloc] init];
    
    
    
    [_viewReal viewInit];
    
    
    [_viewReal.acButton addTarget:self action:@selector(pressACBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.leftBracketButton addTarget:self action:@selector(pressLeftBracketButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.rightBracketButton addTarget:self action:@selector(pressRightBracketButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.divisionButton addTarget:self action:@selector(pressDivisionButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.sevenButton addTarget:self action:@selector(pressSevenButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.eightButton addTarget:self action:@selector(pressEightButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.nineButton addTarget:self action:@selector(pressNineButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.multiplicativeButton addTarget:self action:@selector(pressmultiplicativeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.fourButton addTarget:self action:@selector(pressFourButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.fiveButton addTarget:self action:@selector(pressFiveButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.sixButton addTarget:self action:@selector(pressSixButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.subtractionButton addTarget:self action:@selector(presssubtractionButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.oneButton addTarget:self action:@selector(pressOneButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.twoButton addTarget:self action:@selector(pressTwoButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.threeButton addTarget:self action:@selector(pressThreeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.additiveButton addTarget:self action:@selector(pressAdditiveButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.zeroButton addTarget:self action:@selector(pressZeroButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.dotButton addTarget:self action:@selector(pressDotButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_viewReal.equalButton addTarget:self action:@selector(pressEqualButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    _caculator = [[CaculatorBrain alloc] init];
//    //初始化数组
    _caculator.numMutArray = [[NSMutableArray alloc] init];
    _caculator.symbolMutArray = [[NSMutableArray alloc] init];
    
    _realNumMutArray = [[NSMutableArray alloc] init];
    _realSymbolMutArray = [[NSMutableArray alloc] init];
//
    self.view.backgroundColor = [UIColor blackColor];
    
    //[_viewReal.symbolAndNumButton addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //NSLog(@"_viewReal.symbolAndNumButton.tag = %li",_viewReal.symbolAndNumButton.tag);
    NSLog(@"啦啦啦啦啦啦");
    
    [self.view addSubview:_viewReal];
    
}

- (void)pressZeroButton:(UIButton *)btn
{
    NSLog(@"0 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        //NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    //NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.0;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"0"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"0"];
        
        
        [_caculator.numMutArray addObject:@"0"];
        
        
        
        [_caculator.XnumMutArray addObject:@"0"];
        [_viewReal.screenMutStr appendFormat:@"0"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressDotButton:(UIButton *)btn
{
    [_realSymbolMutArray addObject:@"."];
    //在其他几个数字加入数组之前都要判断一下 原数组倒数第一个单元是否是 .
    //如果是 . 那么就通过算法 把该数字加到 倒数第二位的小数位
    //同时移除 .
    
    
    [_caculator.symbolMutArray addObject:@"."];
    [_caculator.XsymbolMutArray addObject:@"."];
    [_viewReal.screenMutStr appendFormat:@"."];
    [_viewReal showScreenText:_viewReal.numTextView];
}

- (void)pressEqualButton:(UIButton *)btn
{
    //这里调用算法 加减乘除
    
    
    [_viewReal showScreenText:_viewReal.numTextView];
    [_caculator createNumAndSymobl];
    
    NSString * replaceStr = [NSString stringWithFormat:@"%.2f",_caculator.x];
    [_viewReal.screenMutStr setString:[NSString stringWithString:replaceStr]];
    [_viewReal showScreenText:_viewReal.numTextView];
    
    [_caculator.numMutArray removeAllObjects];
    [_caculator.symbolMutArray removeAllObjects];
    [_caculator.numMutArray addObject:[NSNumber numberWithFloat:_caculator.x]];
    
    NSLog(@"_caculator.numMutArray = %@  _caculator.symbolMutArray = %@",_caculator.numMutArray,_caculator.symbolMutArray);
    //[_caculator.symbolMutArray addObject:@"="];
    
}

//以1为准
- (void)pressOneButton:(UIButton *)btn
{
    int i = 0;
    
    int j = 0;
    
    
    //BUG :  双数 乘除 无法计算！！！！
    
    
    
//    if ( _caculator.numMutArray.count > _caculator.symbolMutArray.count ){
//        //说明前面有数字
//        //然后遍历查找前面的数字是几位数 用 if 判断 0<i<10 9 < i < 100 这样算
//        int numFlag = 0;
//
//        if ( 0 < _caculator.numMutArray[_caculator.numMutArray.count] < 10 ){
//            numFlag = 1;
//        }
//        else if ( 9 < _caculator.numMutArray[_caculator.numMutArray.count] < 100 ){
//
//        }
    
        //确定几位数还有另一种方法
        //通过 数字数组的元素个数 减去 符号数组的元素个数
        //以下为我在榆林的新思路：
    
    NSInteger digitOfNum;
    digitOfNum = _caculator.numMutArray.count - _caculator.symbolMutArray.count;
    NSInteger targetNum = 0;
    NSInteger countJ = -1;
    //然后判断在元素数组中的数字是几位数
    if ( _caculator.numMutArray.count > 0 ){
    targetNum = [_caculator.numMutArray[_caculator.numMutArray.count-1] integerValue];
    while (targetNum > 0) {
        countJ++;
        targetNum = targetNum / 10;
    }
    }
    
    NSLog(@"countJ = %li",countJ);
    
//        int digitOfNum;
//        digitOfNum = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count - _caculator.symbolMutArray.count] intValue];
        //如果是n位数 那么 从数字数组第_caculator.numMutArray.count-n位开始遍历  每变遍历一个元素 给该元素 *i 同时 i *= 10
        //然后 创建一个新的对象 将这些加起来的值 通过 += 赋值给这个新对象
    NSInteger newFinalNum = 0;
    
    NSInteger j1;
    NSInteger i1;
        j1 = 1;
        //给j 赋值 因为 越小的i 位 其实际位数 为千位 百位  十位 个位 等依次递减
        //for ( int k = 0; k <= countJ; k++ ){
            j1 *= 10;
        //}
        NSLog(@"j ====  %li",j1);
    
    //目的是什么？
//        for ( i1 = _caculator.numMutArray.count-digitOfNum-1; i1 < _caculator.numMutArray.count; i1++ ){
//            NSInteger xNum = 0;
//            xNum = [_caculator.numMutArray[i1] integerValue];
//
//            xNum *= j1;
//
//            _caculator.numMutArray[i1] = [NSNumber numberWithInteger:xNum];
//            //_caculator.numMutArray[i1] *= j1;
//            j1 /= 10;
//            newFinalNum += [_caculator.numMutArray[i1] integerValue];
//        }
    
    //全体向后移动10位
    if ( _caculator.numMutArray.count > 0 ){
    for ( i1 = _caculator.numMutArray.count-1; i1 < _caculator.numMutArray.count; i1++ ){
        NSInteger xNum = 0;
        xNum = [_caculator.numMutArray[i1] integerValue];
        NSLog(@"xNum =       %li",xNum);
        
        xNum *= j1;
        
        //_caculator.numMutArray[i1] = [NSNumber numberWithInteger:xNum];
        //_caculator.numMutArray[i1] *= j1;
        j1 /= 10;
        //newFinalNum += [_caculator.numMutArray[i1] integerValue];
        newFinalNum += xNum;
    }
    }
    
    
    //
    newFinalNum += 1;
    
    NSLog(@"newFinalNum ==== %li",newFinalNum);
        
        //然后把得到的newFinalNum 赋值给 数组的第_caculator.numMutArray.count-digitOfNum-1 个 元素  再把 他前面的元素到  _caculator.numMutArray.count-1 的元素 全部移除
//        _caculator.numMutArray[_caculator.numMutArray.count-digitOfNum-1] = [NSNumber numberWithInteger:newFinalNum];
    
    
    //不用移除啊喂！！！
    
    //也不用在这里用等号赋值 ！！！
//    _caculator.numMutArray[_caculator.numMutArray.count-1] = [NSNumber numberWithInteger:newFinalNum];
    
//        //移除元素 从 后面的元素开始移除  这样就不用担心前面元素的位置变动
//
//    if ( _caculator.numMutArray.count >1 ){
//        for ( i1 = _caculator.numMutArray.count-digitOfNum; i1 < _caculator.numMutArray.count;  ){
//
//            //不用i++ 因为 每次删除一个元素 后面的会自动补全
//
//            [_caculator.numMutArray removeObjectAtIndex:[_caculator.numMutArray[i] integerValue]];
//
//        }
//    }
//
//    NSLog(@"三位数资格这里的 :P %@",_caculator.numMutArray);
    
        
        
        
   // }
    
    //以上是在 点击数字1的瞬间 确定 1之前的数字是几位数
    
    //下面还要记得 把1也加上 ！！！！
    
    
    
    
    
//    //先计算符号个数
//    if ( _caculator.symbolMutArray.count > 1 ){
//        //多个 遍历
//        for (NSInteger i = [[NSNumber numberWithInteger:_caculator.symbolMutArray.count-2] integerValue] ; i < [[NSNumber numberWithInteger:_caculator.symbolMutArray.count-1] integerValue]; i++) {
//            <#statements#>
//        }
//    }
    
    
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
    j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
    NSLog(@"12321321312进去啦======");
    i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
    
    }
    int x = 0;
    NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
        NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        NSLog(@"进去啦======");
        float num = 0.1;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"1"];
        [_viewReal showScreenText:_viewReal.numTextView];
  //  }
    }else{
    
    
    
    [_realNumMutArray addObject:@"1"];
        
        NSLog(@"_caculator.numMutArray.count = %li     _caculator.symbolMutArray.count = %li",_caculator.numMutArray.count,_caculator.symbolMutArray.count);
        //思路就是 把他们都变成个位数
        if ( _caculator.numMutArray.count > 0 && _caculator.numMutArray.count != _caculator.symbolMutArray.count ){
            [_caculator.numMutArray replaceObjectAtIndex:_caculator.numMutArray.count-1 withObject:[NSNumber numberWithInteger:newFinalNum]];
        }
        else{
        
    [_caculator.numMutArray addObject:@"1"];
        }
        
        NSLog(@"_caculator.numMutArray = %@",_caculator.numMutArray);
        
    [_caculator.XnumMutArray addObject:@"1"];
    [_viewReal.screenMutStr appendFormat:@"1"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
    [_viewReal showScreenText:_viewReal.numTextView];
    }
}

- (void)pressTwoButton:(UIButton *)btn
{
    
    NSLog(@"2 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.2;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"2"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"2"];
        [_caculator.numMutArray addObject:@"2"];
        [_caculator.XnumMutArray addObject:@"2"];
        [_viewReal.screenMutStr appendFormat:@"2"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressThreeButton:(UIButton *)btn
{
    NSLog(@"3 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        //NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    //NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.3;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"3"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"3"];
        [_caculator.numMutArray addObject:@"3"];
        [_caculator.XnumMutArray addObject:@"3"];
        [_viewReal.screenMutStr appendFormat:@"3"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressAdditiveButton:(UIButton *)btn
{
    [_realSymbolMutArray addObject:@"+"];
    [_caculator.symbolMutArray addObject:@"+"];
    [_caculator.XsymbolMutArray addObject:@"+"];
    [_viewReal.screenMutStr appendFormat:@"+"];
    [_viewReal showScreenText:_viewReal.numTextView];
}

- (void)presssubtractionButton:(UIButton *)btn
{
    [_realSymbolMutArray addObject:@"-"];
    [_caculator.symbolMutArray addObject:@"-"];
    [_viewReal.screenMutStr appendFormat:@"-"];
    [_viewReal showScreenText:_viewReal.numTextView];
}

- (void)pressSixButton:(UIButton *)btn
{
    NSLog(@"6 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        //NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    //NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.6;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"6"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"6"];
        [_caculator.numMutArray addObject:@"6"];
        [_caculator.XnumMutArray addObject:@"6"];
        [_viewReal.screenMutStr appendFormat:@"6"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressFiveButton:(UIButton *)btn
{
    NSLog(@"5 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        //NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    //NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.5;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"5"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"5"];
        [_caculator.numMutArray addObject:@"5"];
        [_caculator.XnumMutArray addObject:@"5"];
        [_viewReal.screenMutStr appendFormat:@"5"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressFourButton:(UIButton *)btn
{
    NSLog(@"4 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        //NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    //NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.4;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"4"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"4"];
        [_caculator.numMutArray addObject:@"4"];
        [_caculator.XnumMutArray addObject:@"4"];
        [_viewReal.screenMutStr appendFormat:@"4"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressmultiplicativeButton:(UIButton *)btn
{
    [_realSymbolMutArray addObject:@"*"];
    [_caculator.symbolMutArray addObject:@"*"];
    [_viewReal.screenMutStr appendFormat:@"*"];
    [_viewReal showScreenText:_viewReal.numTextView];
}


- (void)pressNineButton:(UIButton *)btn
{
    NSLog(@"9 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        //NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    //NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.9;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"9"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"9"];
        [_caculator.numMutArray addObject:@"9"];
        [_caculator.XnumMutArray addObject:@"9"];
        [_viewReal.screenMutStr appendFormat:@"9"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressEightButton:(UIButton *)btn
{
    NSLog(@"8 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        //NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    //NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.8;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"8"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"8"];
        [_caculator.numMutArray addObject:@"8"];
        [_caculator.XnumMutArray addObject:@"8"];
        [_viewReal.screenMutStr appendFormat:@"8"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressSevenButton:(UIButton *)btn
{
    NSLog(@"7 Button");
    int i = 0;
    
    int j = 0;
    //还要加一个判断 如果数组中元素个数大于1 的时候
    NSString * ifDotStr;
    ifDotStr = [NSString stringWithFormat:@"."];
    if ( _caculator.numMutArray.count >= 1 && _caculator.symbolMutArray.count >= 1 ){
        
        NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
        
        //NSLog(@"_caculator.symbolMutArray[_caculator.symbolMutArray.count-1] = %@",_caculator.symbolMutArray[_caculator.symbolMutArray.count-1]);
        
        //数字 最后一个单元的 位置
        j = [[NSNumber numberWithUnsignedInteger:_caculator.numMutArray.count-1] intValue];
        NSLog(@"12321321312进去啦======");
        
        //符号 最后一个单元的 位置
        i = [[NSNumber numberWithUnsignedInteger:_caculator.symbolMutArray.count-1] intValue];
        
    }
    int x = 0;
    //NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
    //if ( _caculator.symbolMutArray.count > 0 ){
    //NSLog(@"第一层----------");
    if ( _caculator.symbolMutArray.count > 0 && [_caculator.symbolMutArray[i] isEqualToString:ifDotStr] ){
        //NSLog(@"进去啦======");
        
        
        //这里要修改
        float num = 0.7;
        float realNum =  [_caculator.numMutArray[i] floatValue];
        float finalNum = num + realNum;
        //把两个float相加，然后把结果转成nsnumber存进去
        //然后  在进行下一步 把 那个 . 移除
        //这个还没写！！！！
        NSLog(@"finalNum =======     %.2f",finalNum);
        
        [_caculator.numMutArray replaceObjectAtIndex:[[NSNumber numberWithInt:j] integerValue] withObject:[NSNumber numberWithFloat:finalNum]];
        
        //移除符号位点
        [_caculator.symbolMutArray removeObjectAtIndex:[[NSNumber numberWithInt:i] integerValue]];
        
        //添加 1 在屏幕上
        [_viewReal.screenMutStr appendFormat:@"7"];
        [_viewReal showScreenText:_viewReal.numTextView];
        
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
        //  }
    }else{
        [_realNumMutArray addObject:@"7"];
        [_caculator.numMutArray addObject:@"7"];
        [_caculator.XnumMutArray addObject:@"7"];
        [_viewReal.screenMutStr appendFormat:@"7"];
        NSLog(@"_viewReal.screenStr = %@",_viewReal.screenStr);
        [_viewReal showScreenText:_viewReal.numTextView];
        
        NSLog(@"最终的_caculator.numMutArray = %@",_caculator.numMutArray);
    }
}

- (void)pressDivisionButton:(UIButton *)btn
{
    [_realSymbolMutArray addObject:@"/"];
    [_caculator.symbolMutArray addObject:@"/"];
    [_viewReal.screenMutStr appendFormat:@"/"];
    [_viewReal showScreenText:_viewReal.numTextView];
}

- (void)pressRightBracketButton:(UIButton *)btn
{
    [_realSymbolMutArray addObject:@")"];
    [_caculator.symbolMutArray addObject:@")"];
    [_viewReal.screenMutStr appendFormat:@")"];
    [_viewReal showScreenText:_viewReal.numTextView];
}

- (void)pressLeftBracketButton:(UIButton *)btn
{
    [_realSymbolMutArray addObject:@"("];
    [_caculator.symbolMutArray addObject:@"("];
    [_viewReal.screenMutStr appendFormat:@"("];
    [_viewReal showScreenText:_viewReal.numTextView];
    NSLog(@"_caculator.symbolMutArray = %@",_caculator.symbolMutArray);
}

- (void)pressACBtn:(UIButton *)btn
{
    [_caculator.numMutArray removeAllObjects];
    [_caculator.symbolMutArray removeAllObjects];
    
    NSLog(@"全部移除之后 的 _caculator.numMutArray = %@",_caculator.numMutArray);
    
    [_viewReal.screenMutStr setString:@"0"];
    [_viewReal showScreenText:_viewReal.numTextView];
    NSLog(@"已经全部移除");
}

- (void)pressBtn:(UIButton *)btn
{
    
    
    if ( btn.tag == 0 ){

        [_caculator.numMutArray removeAllObjects];
        [_caculator.symbolMutArray removeAllObjects];
    }
    if (btn.tag == 1 ){
        //括号入栈 并且显示在屏幕上
        [_caculator.symbolMutArray addObject:[NSString stringWithFormat:@"("]];

    }
    if ( btn.tag == 3 || btn.tag == 7 || btn.tag == 11 || btn.tag == 15 || btn.tag == 19 ){
        [btn setBackgroundColor:[UIColor blueColor]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
