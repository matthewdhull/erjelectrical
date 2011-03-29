//
//  HotBus2TableController.h
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HotBus2TableController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *hotBus2List;
    
}


@property (nonatomic, retain) NSMutableArray *hotBus2List;

@end
