//
//  ViewController.m
//  NibUnderstand
//
//  Created by 三少 on 16/5/31.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "ViewController.h"
#import "PersonView.h"
#import "PersonHandle.h"
#import "PersonCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UIView *testView;/*objec*/
@property (weak, nonatomic) IBOutlet UITableView *aTableView;

@end

@implementation ViewController{
    
    UINib *_personNib;
    
    PersonHandle *_aPersonHandle;
    NSDictionary *_cellOptionDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _aPersonHandle = [PersonHandle new];
    
    _personNib = [UINib nibWithNibName:@"PersonCell" bundle:nil ];//PersonCell.xib放到了内存里
    _cellOptionDic = @{UINibExternalObjects :@{@"cellKey":_aPersonHandle}};


    
    
    
    NSDictionary *prameDic = @{@"testKey":_aPersonHandle};
    NSDictionary *optionDic = @{UINibExternalObjects : prameDic};
    
    PersonView *view = [[[NSBundle mainBundle] loadNibNamed:@"PersonView" owner:self options:optionDic] firstObject];
    NSLog(@"%@",[[NSBundle mainBundle] loadNibNamed:@"PersonView" owner:self options:optionDic]);
    [self.view addSubview:view];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"person"];
    if (!cell) {
        cell = [[_personNib instantiateWithOwner:nil options:_cellOptionDic] firstObject];//最初屏幕显示的cell都没有重用，都是要创建的，但是此时创建的过程都是走的内存缓存，大大提高了效率
    }
    return cell;
}




- (IBAction)personViewBtnPressed:(id)sender {
    NSLog(@"%@:我的PersonView上的button点击了", NSStringFromClass([self class]));
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 options必须有NSKeyValueObservingOptionInitial，因为这是初始化阶段，必须有NSKeyValueObservingOptionInitial才会发生回调，只用NSKeyValueObservingOptionNew是没有回调发生的，只有初始化之后再重新赋值的时候用NSKeyValueObservingOptionNew才会发生回调。
 
 action关系的建立就是调用UIControl类的addTarget:action:forControlEvents:方法。我们给xib上的一个button建立一个outlet，属性名字叫testBtn，再建立一个action，函数名字叫btnPressed，则xib的source code中就会将两者放在<connections>标签中，nib加载到步骤3的时候就会根据这个标签去建立对应的关系。
 
 [self addObserver:self forKeyPath:@"PersonView" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];
 文／二亮子（简书作者）
 原文链接：http://www.jianshu.com/p/2f9e71ef7f52
 著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。
 */
@end
