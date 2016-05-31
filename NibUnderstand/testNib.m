//
//  testNib.m
//  NibUnderstand
//
//  Created by 三少 on 16/5/31.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "testNib.h"

@implementation testNib

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    [super awakeFromNib];//这个函数要先调super
    //...做一些初始化之后的事情
    //注意该函数只会在绑定xib的类中调用，不会在它的File's Owner及其内部的Object类中调用
    
}
- (IBAction)testBtn:(UIButton *)sender {
    
}

@end
