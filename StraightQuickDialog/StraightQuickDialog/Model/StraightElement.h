//
//  StraightElement.h
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-8.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StraightElement : NSObject{
    
}


@property(nonatomic,strong)NSString*title;
@property(nonatomic,strong)NSInvocation*invocation;

+(StraightElement*)straightElement:(NSString*)title target:(id)target selector:(SEL)selector;

@end
