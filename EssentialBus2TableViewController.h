//
//  EssentialBus2TableViewController.h
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EssentialBus2TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    
    NSMutableArray *essBus2List;

}

@property (nonatomic, retain) NSMutableArray *essBus2List;


@end
