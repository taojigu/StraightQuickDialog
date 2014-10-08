//
//  NSMutableString+Extension.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-8.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "NSMutableString+Extension.h"

@implementation NSMutableString (Extension)

-(void)appendLine{
    [self appendString:@"/r/n"];
}


@end
