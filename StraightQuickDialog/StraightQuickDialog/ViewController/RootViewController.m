//
//  RootViewController.m
//  StraightQuickDialog
//
//  Created by VooleDev6 on 14-10-8.
//  Copyright (c) 2014年 Voole. All rights reserved.
//

#import "RootViewController.h"
#import "StraightSection.h"
#import "StraightElement.h"
#import "EntryViewController.h"
@interface RootViewController (){
    @private
    NSMutableArray*sectionArray;
}

@end

@implementation RootViewController

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
    return sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    StraightSection*sc=[sectionArray objectAtIndex:section];
    return sc.elementArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString*identifer=@"TextCellIdentifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    StraightSection*ssc=[sectionArray objectAtIndex:indexPath.section];
    StraightElement*elem=[ssc.elementArray objectAtIndex:indexPath.row];
    cell.textLabel.text=elem.title;
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    StraightSection*ssc=[sectionArray objectAtIndex:indexPath.section];
    StraightElement*elem=[ssc.elementArray objectAtIndex:indexPath.row];
    NSInvocation*invk=elem.invocation;
    [invk invoke];
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    StraightSection*ssc=[sectionArray objectAtIndex:section];
    return ssc.footerText;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    StraightSection*ssc=[sectionArray objectAtIndex:section];
    return ssc.headerText;
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

-(void)pushLoginFormViewController{
    
}
-(void)pushSampleControlViewController{
    
}
-(void)pushSubformViewContrller{
    
}
-(void)pushReallyLongListViewController{
    
}


-(void)pushEntryViewController{
    UIStoryboard*storyboar=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EntryViewController*evc=[storyboar instantiateViewControllerWithIdentifier:@"EntryViewController"];
    [self.navigationController pushViewController:evc animated:YES];
    
}
#pragma private messages
-(void)initPrivateField{
    
    sectionArray=[[NSMutableArray alloc]init];
    [self addSetion1];
    [self addUsageExampleSection];
    [self addJsonSampleSection];
    
    
}
-(void)addSetion1{
    StraightSection*sc=[[StraightSection alloc]init];
    sc.footerText=@"Hey there, this is a footer";
    StraightElement*loginform=[self straightElement:@"Login Form" selector:@selector(pushLoginFormViewController)];
    [sc.elementArray addObject:loginform];
    StraightElement*smpCtrl=[self straightElement:@"SampleControl" selector:@selector(pushSampleControlViewController)];
    [sc.elementArray addObject:smpCtrl];
    StraightElement*subform=[self straightElement:@"Subform" selector:@selector(pushSubformViewContrller)];
    [sc.elementArray addObject:subform];
    StraightElement*rlg=[self straightElement:@"Really long list" selector:@selector(pushReallyLongListViewController)];
    [sc.elementArray addObject:rlg];
    
    [sectionArray addObject:sc];
    
    
}
-(void)addUsageExampleSection{
    
    StraightSection*sc=[[StraightSection alloc]init];
    sc.headerText=@"USAGE EXAMPLE";
    StraightElement*entryElement=[self straightElement:@"Entry" selector:@selector(pushEntryViewController)];
    [sc.elementArray addObject:entryElement];

    [sectionArray addObject:sc];
    
}
-(void)addJsonSampleSection{
    
}
-(StraightElement*)straightElement:(NSString*)title selector:(SEL)selector{
    return [StraightElement straightElement:title target:self selector:selector];
}

@end
