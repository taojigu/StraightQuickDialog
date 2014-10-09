//
//  EntryTableViewCell.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-8.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "EntryTableViewCell.h"

@implementation EntryTableViewCell

@synthesize textField;

- (void)awakeFromNib {
    // Initialization code

}

-(void)layoutSubviews{
    [super layoutSubviews];
    //UIFont*titleFont=self.textLabel.font;
    CGRect titleRect=self.textLabel.frame;
    CGSize sz=titleRect.size;
    sz.width=180;
    titleRect.size=sz;
    self.textLabel.frame=titleRect;
    /*
    
    NSMutableDictionary*attriDict=[[NSMutableDictionary alloc]init];
    [attriDict setObject:titleFont forKey:NSFontAttributeName];
    CGSize sz=CGSizeMake(200, MAXFLOAT);
    
    CGRect rect=[self.textLabel.text boundingRectWithSize:sz options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attriDict context:nil];
     */
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
