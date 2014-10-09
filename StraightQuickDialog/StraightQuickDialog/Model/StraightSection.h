//
//  StraightSection.h
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-8.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StraightSection : NSObject{
    
}

@property(nonatomic,strong)NSString*headerText;
@property(nonatomic,strong)NSString*footerText;
@property(nonatomic,assign)NSInteger sectionIndex;

@property(nonatomic,strong)NSMutableArray*elementArray;
@end
