//
//  BackupEssentialBusTableController.h
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BackupEssentialBusTableController : UITableViewController<UITableViewDelegate, UITableViewDataSource>  {
    NSMutableArray *backupEssentialBusList;
}

@property (nonatomic, retain) NSMutableArray *backupEssentialBusList;


@end
