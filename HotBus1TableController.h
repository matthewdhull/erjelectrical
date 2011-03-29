//
//  HotBus1TableController.h
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HotBus1TableController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *hotBus1List;
}


@property (nonatomic, retain) NSMutableArray *hotBus1List;

@end
