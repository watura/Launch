//
//  LaunchTable.m
//  Launch
//
//  Created by Wataru Nishimoto on 11/12/18.
//  Copyright (c) 2011年 none. All rights reserved.
//

#import "ViewController.h"


@implementation Launch
@synthesize mainTableView;
@synthesize add;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Table view delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    NSArray *ary = [NSArray arrayWithArray:[ud arrayForKey:@"list"]];
    if (ary != nil) {
    NSLog(@"ary count:%d",[ary count]);
        return [ary count];
    }else
        return 0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:CellIdentifier];
    }
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    NSArray *ary = [NSArray arrayWithArray:[ud arrayForKey:@"list"]];
    NSDictionary* dict =[ary objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dict objectForKey:@"title"];
    cell.detailTextLabel.text = [dict objectForKey:@"action"];
    NSLog(@"%@",dict);
    cell.tag = indexPath.row;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    addVC *vc = (addVC *)[segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"addVCModal"]) {
        vc.indexID = [(UITableViewCell*)sender tag];
    }else{
        vc.indexID = -1;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:[NSMutableArray array] forKey:@"list"];
    [ud registerDefaults:defaults];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) addNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    NSArray *ary = [NSArray arrayWithArray:[ud arrayForKey:@"list"]];
    for (NSDictionary *dict in ary){
        UILocalNotification *ln = [[UILocalNotification alloc] init];
        ln.timeZone = [NSTimeZone defaultTimeZone];
    
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        //NSCalendar* cal = [[NSCalendar alloc] initWithCalendarIdentifier: NSJapaneseCalendar];
        NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
        //[df setCalendar: cal];
        [df setLocale:locale];
        [df setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
        ln.fireDate = [df dateFromString:[dict objectForKey:@"date"]];
        NSLog(@"fireDate:%@,%@",ln.fireDate,[dict objectForKey:@"date"]);
        
        ln.alertAction = [dict objectForKey:@"action"];
        ln.alertBody = [dict objectForKey:@"title"];
        ln.userInfo = dict;
        ln.applicationIconBadgeNumber = 0;
        ln.hasAction = YES;
        switch ([[dict objectForKey:@"repeat"] intValue]) {
            case 5:
                ln.repeatInterval = NSMinuteCalendarUnit;
                break;
            case 1:
                ln.repeatInterval = NSHourCalendarUnit;
                break;
            case 2:
                ln.repeatInterval = NSDayCalendarUnit;
                break;
            case 3:
                ln.repeatInterval = NSWeekCalendarUnit;
                break;
            case 4:
                ln.repeatInterval = NSMonthCalendarUnit;
                break;
            default:
                break;
        }
        [[UIApplication sharedApplication] scheduleLocalNotification:ln];
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [mainTableView reloadData];
    [self addNotification];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    LaunchCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LaunchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.count.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
    NSLog(@"%d",indexPath.row);
    return cell;
}
*/
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */



@end
