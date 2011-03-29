//
//  EssentialBus1TableViewControlller.h
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EssentialBus1TableViewControlller : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    
    NSMutableArray *essBus1List;

}

@property (nonatomic, retain) NSMutableArray *essBus1List;



@end
