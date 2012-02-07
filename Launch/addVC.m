//
//  addVC.m
//  Launch
//
//  Created by Wataru Nishimoto on 12/02/06.
//  Copyright (c) 2012年 none. All rights reserved.
//

#import "addVC.h"

@implementation addVC
@synthesize cancelButton,saveButton,safariButton,evernoteButton,fasteverButton,pictshareButton,readerButton,smsButton,phoneButton,mapButton,mailButton,pathButton,tweetbotButton,onecamButton;
@synthesize titleTextField,actionTextField;
@synthesize dateButton,repeatButton;
@synthesize pickerView,datePicker;
@synthesize indexID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)saveButtonAction:(id)sender{
    if ([titleTextField.text isEqualToString:@""]|| [actionTextField.text isEqualToString:@""] /*|| 
        [dateTextField.text isEqualToString:@""] || [repeatTextField.text isEqualToString:@""]*/) {
        return;    
    }else{
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        NSMutableArray* ary = [NSMutableArray arrayWithArray:[ud arrayForKey:@"list"]];
        NSMutableDictionary *md = [NSMutableDictionary dictionary];
        [md setValue:titleTextField.text forKey:@"title"];
        [md setValue:actionTextField.text forKey:@"action"];
        [md setValue:dateButton.titleLabel.text forKey:@"date"];
        [md setValue:[NSNumber numberWithInt:repeat] forKey:@"repeat"];

        if (indexID != -1) {
            [ary replaceObjectAtIndex:indexID withObject:md];
        }else{
            [ary addObject:md];
        }
        
        [ud setValue:ary forKey:@"list"];
        [self dismissModalViewControllerAnimated:YES];   
    }
}

-(IBAction)cancelButtonAction:(id)sender{
    if ([cancelButton.titleLabel.text isEqualToString:@"Delete"]) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        NSMutableArray* ary = [NSMutableArray arrayWithArray:[ud arrayForKey:@"list"]];
        [ary removeObjectAtIndex:[[ary valueForKeyPath:@"title"] indexOfObject:titleTextField.text]];
        [ud setValue:ary forKey:@"list"];
    }
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - IBActions for Input URL Scheme
-(IBAction)safariButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"http://";
}
-(IBAction)mailButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"mailto:";
}
-(IBAction)fasteverButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"fastever:";
}
-(IBAction)tweetbotButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"tweetbot:";
}
-(IBAction)pictshareButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"jp.itok.pictshare:";
}
-(IBAction)readerButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"reeder:";
}
-(IBAction)mapButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"maps:";
}
-(IBAction)smsButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"sms:";
}
-(IBAction)evernoteButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"evernote:";
}
-(IBAction)pathButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"path:";
}
-(IBAction)phoneButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"tel:";
}
-(IBAction)onecamButtonAction:(id)sender{
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    actionTextField.text = @"OneCam-photoapplink:";

}

-(IBAction)dateButtonAction:(id)sender{
    [self.view endEditing: YES];
    if (datePicker.hidden){
        datePicker.hidden = NO;
        pickerView.hidden = YES;
    }else{
        datePicker.hidden = YES;
    }
}

-(IBAction)repeatButtonAction:(id)sender{
    [self.view endEditing: YES];
    if (pickerView.hidden){
        pickerView.hidden = NO;
        datePicker.hidden = YES;
    }else{
        pickerView.hidden = YES;
    }
}

-(IBAction)datePickerAction:(id)sender{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"yyyy/MM/dd HH:mm:ss";
    NSString *str = [df stringFromDate:[datePicker date]];
    [dateButton setTitle:str forState:UIControlStateNormal];
}


- (IBAction)actionDidEndOnExit:(id)sender{
    [self.view endEditing: YES];
    datePicker.hidden = YES;
    pickerView.hidden = YES;
}

#pragma mark - UIPickerView

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 6;
}

-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (row) {
        case 0:
            return @"Don't Repeat";
        case 1:
            return @"Every Hour";
        case 2:
            return @"Every Day";
        case 3:
            return @"Every Week";
        case 4:
            return @"Every Month";
        default:
            return @"NO";
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    repeat = row;
    switch (row) {
        case 0:
            [repeatButton setTitle:@"Don't Repeat" forState:UIControlStateNormal];
            break;
        case 1:
            [repeatButton setTitle:@"Every Hour" forState:UIControlStateNormal];
            break;
        case 2:
            [repeatButton setTitle:@"Every Day" forState:UIControlStateNormal];
            break;
        case 3:
            [repeatButton setTitle:@"Every Week" forState:UIControlStateNormal];
            break;
        case 4:
            [repeatButton setTitle:@"Every Week" forState:UIControlStateNormal];
            break;
        case 5:
            [repeatButton setTitle:@"AllWays" forState:UIControlStateNormal];
            break;
        default:
            [repeatButton setTitle:@"NO" forState:UIControlStateNormal];
            break;
    }
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (indexID != -1) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        NSMutableArray* ary = [NSMutableArray arrayWithArray:[ud arrayForKey:@"list"]];
        NSDictionary *dict = [ary objectAtIndex:indexID];
        titleTextField.text = [dict valueForKey:@"title"];
        actionTextField.text = [dict valueForKey:@"action"];
        repeat = [[dict valueForKey:@"repeat"] intValue];        
        [dateButton setTitle:[dict valueForKey:@"date"] forState:UIControlStateNormal];
        [self pickerView:pickerView didSelectRow:repeat inComponent:0];
        [cancelButton setTitle:@"Delete" forState:UIControlStateNormal];
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
