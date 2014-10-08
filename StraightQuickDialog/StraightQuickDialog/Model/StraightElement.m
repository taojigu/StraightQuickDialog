//
//  StraightElement.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-8.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "StraightElement.h"

@implementation StraightElement



+(StraightElement*)straightElement:(NSString*)title target:(id)target selector:(SEL)selector{
    StraightElement*element=[[StraightElement alloc]init];
    element.title=title;
    NSMethodSignature*sig=[target methodSignatureForSelector:selector];
    NSInvocation*invocation=[NSInvocation invocationWithMethodSignature:sig];
    invocation.target=target;
    invocation.selector=selector;
    element.invocation=invocation;
    return element;
}

@end
