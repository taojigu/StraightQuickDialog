//
//  PickerTableViewCell.h
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-10.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PickerElement;
@interface PickerTableViewCell : UITableViewCell<UITextFieldDelegate>{
    @private
    
    
}

@property(nonatomic,strong)PickerElement*pickerElement;
@property(nonatomic,strong)UIPickerView*pickerView;
@property(nonatomic,strong)UITextField*textField;

@end
