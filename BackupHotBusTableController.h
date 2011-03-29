//
//  BackupHotBusTableController.h
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BackupHotBusTableController : UITableViewController<UITableViewDelegate, UITableViewDataSource>  {
    NSMutableArray *backupHotBusList;
}


@property (nonatomic, retain) NSMutableArray *backupHotBusList;


@end
