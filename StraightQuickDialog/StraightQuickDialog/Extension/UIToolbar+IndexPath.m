//
//  UIToolbar+IndexPath.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-9.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "UIToolbar+IndexPath.h"
#import <objc/runtime.h>
#import "StraightElement.h"

static char* PropertyIndexPathKey="IndexPathKey";
static void * PropertyElementKey="ElementKey";

@implementation UIToolbar (IndexPath)

@dynamic indexPath;


-(NSIndexPath*)indexPath{
    
    return objc_getAssociatedObject(self, PropertyIndexPathKey);
   
}
-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, PropertyIndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

/*
@implementation UITableViewCell (Element)

@dynamic element;

-(StraightElement*)getElement{
    return objc_getAssociatedObject(self, PropertyElementKey);
}

-(void)setElement:(StraightElement *)element{
    objc_setAssociatedObject(self, PropertyElementKey, element, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
 */
