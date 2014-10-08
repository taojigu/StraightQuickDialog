//
//  StraightSection.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-8.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "StraightSection.h"
#import "NSMutableString+Extension.h"

@implementation StraightSection
@synthesize headerText;
@synthesize footerText;
@synthesize elementArray;


-(id)init{
    self=[super init];
    self.elementArray=[[NSMutableArray alloc]init];
    return self;
}


-(NSString*)description{
    NSMutableString*buffer=[[NSMutableString alloc]init];
    if (0!=self.headerText.length) {
        [buffer appendFormat:@"The Header text is :%@",self.headerText];
        [buffer appendLine];
    }
    if (0!=self.footerText.length) {
        [buffer appendFormat:@"The Footer text is :%@",self.footerText];
        [buffer appendLine];
    }
    
    if (0!=self.elementArray.count) {
        [buffer appendFormat:@"The elmement is %@",self.elementArray];
    }
    return buffer;
}

@end
