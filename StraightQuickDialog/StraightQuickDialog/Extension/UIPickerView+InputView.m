//
//  UIPickerView+InputView.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-10.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "UIPickerView+InputView.h"
#import <objc/runtime.h>


static void * PropertyTableViewCellKey="TableViewCellKey";

@implementation UIPickerView (InputView)

@dynamic tableViewCell;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UITableViewCell*)tableViewCell{
    return objc_getAssociatedObject(self, PropertyTableViewCellKey);
}
-(void)setTableViewCell:(UITableViewCell *)tableViewCell{
    objc_setAssociatedObject(self, PropertyTableViewCellKey, tableViewCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
