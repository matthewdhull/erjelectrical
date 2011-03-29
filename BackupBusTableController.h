//
//  BackupBusTableController.h
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BackupBusTableController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    
    NSMutableArray *backupBusList;

}


@property (nonatomic, retain) NSMutableArray *backupBusList;
@end
