//
//  LaunchTable.h
//  Launch
//
//  Created by Wataru Nishimoto on 11/12/18.
//  Copyright (c) 2011年 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addVC.h"

@interface Launch : UIViewController<UITableViewDelegate,UITableViewDataSource>{
}

@property (strong,nonatomic) IBOutlet UITableView* mainTableView;
@property (strong,nonatomic) addVC* add;


-(void)addNotification;
@end
