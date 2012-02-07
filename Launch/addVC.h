//
//  addVC.h
//  Launch
//
//  Created by Wataru Nishimoto on 12/02/06.
//  Copyright (c) 2012年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addVC : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>{
    int repeat;
    
}
@property (nonatomic) NSInteger indexID;

@property (strong,nonatomic) IBOutlet UIButton* saveButton; 
@property (strong,nonatomic) IBOutlet UIButton* cancelButton; 
@property (strong,nonatomic) IBOutlet UIButton* safariButton; 
@property (strong,nonatomic) IBOutlet UIButton* mailButton; 
@property (strong,nonatomic) IBOutlet UIButton* fasteverButton; 
@property (strong,nonatomic) IBOutlet UIButton* tweetbotButton; 
@property (strong,nonatomic) IBOutlet UIButton* pictshareButton;
@property (strong,nonatomic) IBOutlet UIButton* readerButton; 
@property (strong,nonatomic) IBOutlet UIButton* mapButton; 
@property (strong,nonatomic) IBOutlet UIButton* smsButton; 
@property (strong,nonatomic) IBOutlet UIButton* evernoteButton;
@property (strong,nonatomic) IBOutlet UIButton* pathButton; 
@property (strong,nonatomic) IBOutlet UIButton* phoneButton; 
@property (strong,nonatomic) IBOutlet UIButton* onecamButton; 
@property (strong,nonatomic) IBOutlet UITextField* titleTextField;
@property (strong,nonatomic) IBOutlet UITextField* actionTextField;
@property (strong,nonatomic) IBOutlet UIButton* dateButton;
@property (strong,nonatomic) IBOutlet UIButton* repeatButton;
@property (strong,nonatomic) IBOutlet UIDatePicker* datePicker;
@property (strong,nonatomic) IBOutlet UIPickerView* pickerView;

-(IBAction)saveButtonAction:(id)sender;
-(IBAction)cancelButtonAction:(id)sender;
-(IBAction)safariButtonAction:(id)sender;
-(IBAction)mailButtonAction:(id)sender;
-(IBAction)fasteverButtonAction:(id)sender;
-(IBAction)tweetbotButtonAction:(id)sender;
-(IBAction)pictshareButtonAction:(id)sender;
-(IBAction)readerButtonAction:(id)sender;
-(IBAction)mapButtonAction:(id)sender;
-(IBAction)smsButtonAction:(id)sender;
-(IBAction)evernoteButtonAction:(id)sender;
-(IBAction)pathButtonAction:(id)sender;
-(IBAction)phoneButtonAction:(id)sender;
-(IBAction)onecamButtonAction:(id)sender;
-(IBAction)repeatButtonAction:(id)sender;
-(IBAction)dateButtonAction:(id)sender;

-(IBAction)datePickerAction:(id)sender;

@end
