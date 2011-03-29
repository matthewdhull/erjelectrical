//
//  ShedBus1TableController.m
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShedBus1TableController.h"
#import "BusListCustomCell.h"


@implementation ShedBus1TableController
@synthesize shedBus1List;


- (void)viewDidLoad {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor colorWithRed: 4.0/255.0 green: 27.0/255.0 blue: 45.0/255.0 alpha: 1.0];

    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *plistPath = [bundle pathForResource: @"ShedBus1" ofType: @"plist"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile: plistPath];
    [array sortedArrayUsingSelector: @selector(compare:)];
    self.shedBus1List = array;
    [array release];
    
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {

    
    [super didReceiveMemoryWarning];
	
	
}

- (void)viewDidUnload {
self.shedBus1List = nil;
[super viewDidUnload];
}

-(void)dealloc {
    [shedBus1List release];
    [super dealloc];
}


#pragma mark Table view methods


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.shedBus1List count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *BusListCustomCellIdentifier = @"BusListCustomCell";
    
    BusListCustomCell *cell = (BusListCustomCell *)[tableView dequeueReusableCellWithIdentifier: BusListCustomCellIdentifier];
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed: @"BusListCustomCell" owner: self options: nil];
        
        for (id oneObject in nib) {
            if([oneObject isKindOfClass: [BusListCustomCell class]])
                cell = (BusListCustomCell *)oneObject;
        }
        
    }
    
    NSUInteger row = [indexPath row];
    cell.titleLabel.text = [shedBus1List objectAtIndex: row];
    cell.detailLabel.text = @"Shed Bus 1";
    
	
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

 
@end