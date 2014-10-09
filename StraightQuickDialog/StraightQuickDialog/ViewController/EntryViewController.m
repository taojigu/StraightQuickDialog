//
//  EntryViewController.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-8.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "EntryViewController.h"
#import "EntryTableViewCell.h"
#import "UIToolbar+IndexPath.h"
#import "StraightSection.h"
#import "StraightElement.h"
@interface EntryViewController ()<UITextFieldDelegate>{
    @private
    UISegmentedControl*_prevNext;
    UIToolbar*keyboardToolBar;
    
    
    StraightSection*sectionData;
    UITextField*currentTextField;
    

}

@end

@implementation EntryViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    currentTextField=nil;
    [self initPrivateField];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    keyboardToolBar=[self createActionBar];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sectionData.elementArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EntryTableViewCell* cell =(EntryTableViewCell*) [tableView dequeueReusableCellWithIdentifier:@"EntryCellIdentifer" forIndexPath:indexPath];
    StraightElement*element=[sectionData.elementArray objectAtIndex:indexPath.row];
    cell.element=element;
    
    cell.textField.placeholder=@"Place Holder";
    cell.textField.delegate=self;
    cell.textField.inputAccessoryView=keyboardToolBar;
    cell.textLabel.text=element.title;
    cell.textField.keyboardType=UIKeyboardTypeDefault;
    cell.textField.keyboardAppearance=UIKeyboardAppearanceDark;

    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma selector messages

- (void)handleActionBarPreviousNext:(UISegmentedControl *)control {
    UITextField*tf=(UITextField*)keyboardToolBar.superview;
    [tf resignFirstResponder];
    BOOL isPre=control.selectedSegmentIndex==0;
    NSIndexPath*targetCellIndexPath=nil;
    if (isPre) {
        targetCellIndexPath=[self findPreCellIndexPath:keyboardToolBar.indexPath];
    }
    else{
        targetCellIndexPath=[self findNextCellIndexPath:keyboardToolBar.indexPath];
    }
    [self.tableView scrollToRowAtIndexPath:targetCellIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    EntryTableViewCell*cell=(EntryTableViewCell*)[self.tableView cellForRowAtIndexPath:targetCellIndexPath];
    [cell.textField becomeFirstResponder];
    
}
- (BOOL)handleActionBarDone:(UIBarButtonItem *)doneButton {
    
    [currentTextField resignFirstResponder];
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    UIView*contentView=(UITableViewCell*)textField.superview;
    while (![contentView isKindOfClass:[UITableViewCell class]]) {
        contentView=contentView.superview;
    }
    EntryTableViewCell*cell=(EntryTableViewCell*)contentView;
    keyboardToolBar.indexPath=cell.element.indexPath;
    currentTextField=textField;
    

}
-(void)textFieldDidEndEditing:(UITextField *)textField{

    currentTextField=nil;
}

#pragma private messages
-(UIToolbar *)createActionBar {
    UIToolbar *actionBar = [[UIToolbar alloc] init];
    [actionBar sizeToFit];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", @"")
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(handleActionBarDone:)];
    
    _prevNext = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"Previous", @""), NSLocalizedString(@"Next", @""), nil]];
    _prevNext.momentary = YES;
    //_prevNext.segmentedControlStyle = UISegmentedControlStyleBar;
    _prevNext.tintColor = actionBar.tintColor;
    [_prevNext addTarget:self action:@selector(handleActionBarPreviousNext:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *prevNextWrapper = [[UIBarButtonItem alloc] initWithCustomView:_prevNext];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [actionBar setItems:[NSArray arrayWithObjects:prevNextWrapper, flexible, doneButton, nil]];
    
    return actionBar;
}
-(NSIndexPath*)findPreCellIndexPath:(NSIndexPath*)indexPath{
    if (0==indexPath.row) {
        return indexPath;
    }
    return [NSIndexPath indexPathForRow:indexPath.row-1 inSection:0];
}
-(NSIndexPath*)findNextCellIndexPath:(NSIndexPath*)indexPath{
    if (sectionData.elementArray.count-1==indexPath.row) {
        return indexPath;
    }
    return [NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];

}

-(void)initPrivateField{
    sectionData=[[StraightSection alloc]init];
    sectionData.sectionIndex=0;
    for (NSInteger idx=0; idx<5; idx++) {
        NSString*title=[NSString stringWithFormat:@"EntryElemnt %d",idx];
        StraightElement*ele=[StraightElement straightElement:title  target:self selector:nil];
        ele.indexPath=[NSIndexPath indexPathForRow:idx inSection:sectionData.sectionIndex];
        [sectionData.elementArray addObject:ele];
    }
    
    
}

-(UIView*)findCurrentCell{
    

    UIView*cell=(UIView*)keyboardToolBar.superview;
    while (![cell isKindOfClass:[EntryTableViewCell class]]) {
        cell=cell.superview;
    }
    return cell;
}


@end
