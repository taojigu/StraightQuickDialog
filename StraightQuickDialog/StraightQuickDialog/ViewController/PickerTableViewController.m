//
//  PickerTableViewController.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-10.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "PickerTableViewController.h"
#import "StraightSection.h"
#import "StraightElement.h"
#import "PickerElement.h"
#import "PickerTableViewCell.h"
#import "UIPickerView+InputView.h"


#define PickerCellIdentifer1 @"PickerCellIdentifer1"

@interface PickerTableViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>{
    @private
    NSMutableArray*sectionArray;
    
}

@end

@implementation PickerTableViewController


-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    [self initPrivateField];
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return [sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    StraightSection*sect=[sectionArray objectAtIndex:section];
    return sect.elementArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PickerTableViewCell *cell = (PickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:PickerCellIdentifer1];
 
    
    // Configure the cell...
    StraightSection*sect=[sectionArray objectAtIndex:indexPath.section];
    PickerElement*ele=[sect.elementArray objectAtIndex:indexPath.row];
    cell.pickerElement=ele;
    cell.pickerView.delegate=self;
    cell.pickerView.dataSource=self;
    
    cell.textLabel.text=ele.title;
    
    
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

#pragma Picker DataSource and Delegate messages
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    PickerTableViewCell*cell=(PickerTableViewCell*)pickerView.tableViewCell;
    PickerElement*element=cell.pickerElement;
    NSArray*array=[element.componentArray objectAtIndex:component];
    NSString*text=[array objectAtIndex:row];
    NSLog(@"The selected text is %@",text);

    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    PickerTableViewCell*cell=(PickerTableViewCell*)pickerView.tableViewCell;
    PickerElement*element=cell.pickerElement;
    NSArray*array=[element.componentArray objectAtIndex:component];
    NSString*text=[array objectAtIndex:row];
    return text;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    PickerTableViewCell*cell=(PickerTableViewCell*)pickerView.tableViewCell;
    PickerElement*element=cell.pickerElement;
    
    return element.componentArray.count;

}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    PickerTableViewCell*cell=(PickerTableViewCell*)pickerView.tableViewCell;
    NSArray*array=[cell.pickerElement.componentArray objectAtIndex:component];
    return array.count;
}





#pragma private messages

-(void)initPrivateField{
    
    sectionArray=[[NSMutableArray alloc]init];
    StraightSection*sect=[[StraightSection alloc]init];
    sect.sectionIndex=0;
    sect.headerText=@"Picker Element";
    PickerElement*ele1=(PickerElement*)[sect createPickerElement:0 title:@"Key"];
        [sect.elementArray addObject:ele1];
    NSArray*keyItems1=@[@"1",@"2",@"3",@"4",@"5"];
    NSArray*keyItems2=@[@"A",@"B"];
    [ele1.componentArray addObject:keyItems1];
    [ele1.componentArray addObject:keyItems2];
    [sectionArray addObject:sect];
    
    
    sect=[[StraightSection alloc]init];
    sect.headerText=@"CUSTOM VALUE PARSER";
    sect.sectionIndex=1;
    PickerElement*ele2=[sect createPickerElement:0 title:@"Period"];
    NSArray*periodArray=@[@"monthly",@"weekly",@"daily"];
    [ele2.componentArray addObject:periodArray];
    [sect.elementArray addObject:ele2];
    [sectionArray addObject:sect];
 
}

@end
