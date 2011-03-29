//
//  ShedBus1TableController.h
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ShedBus1TableController : UITableViewController <UITableViewDataSource, UITableViewDelegate>  {
    NSMutableArray *shedBus1List;
}


@property (nonatomic, retain)     NSMutableArray *shedBus1List;
@end
