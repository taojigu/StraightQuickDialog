//
//  PickerTableViewCell.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-10.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "PickerTableViewCell.h"
#import "UIPickerView+InputView.h"
#import "PickerElement.h"

@implementation PickerTableViewCell

@synthesize pickerElement;
@synthesize pickerView;
@synthesize textField;

- (void)awakeFromNib {
    // Initialization code
    self.pickerElement=nil;
    
    [self createSubviews];
    self.accessoryType=UITableViewCellStyleDefault;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textField.frame=self.detailTextLabel.frame;
    
}

-(void)createSubviews{
    pickerView=[[UIPickerView alloc]initWithFrame:CGRectZero];
    pickerView.tableViewCell=self;

    self.textField=[[UITextField alloc]init];
    
    self.textField.inputView=pickerView;
    [self.contentView addSubview:self.textField];
    self.textField.hidden=NO;

    
}

#pragma UITextFieldDelegate messages

-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.detailTextLabel.text=@"hello";
}


@end
