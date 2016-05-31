//
//  PersonHandle.m
//  NibUnderstand
//
//  Created by 三少 on 16/5/31.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "PersonHandle.h"

@implementation PersonHandle
- (IBAction)personHandle:(id)sender {
    NSLog(@"%@可以处理personView中的button点击事件", NSStringFromClass([self class]));

}
- (IBAction)cellBtnCicked:(id)sender {
    NSLog(@"className:%@cell点击事件",NSStringFromClass([self class]));
}

@end
