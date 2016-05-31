//
//  PersonView.m
//  NibUnderstand
//
//  Created by 三少 on 16/5/31.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "PersonView.h"

@implementation PersonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)personBtnPressed:(id)sender forEvent:(UIEvent *)event {
    
    NSLog(@"%@:我的button点击了", NSStringFromClass([self class]));
}

@end
