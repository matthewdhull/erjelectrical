//
//  EssentialBus2TableViewController.m
//  Power Source
//
//  Created by Matthew Hull on 11/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EssentialBus2TableViewController.h"
#import "BusListCustomCell.h"


@implementation EssentialBus2TableViewController
@synthesize essBus2List;



- (void)viewDidLoad {
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor colorWithRed: 4.0/255.0 green: 27.0/255.0 blue: 45.0/255.0 alpha: 1.0];

    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *plistPath = [bundle pathForResource: @"EssBus2" ofType: @"plist"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile: plistPath];
    [array sortedArrayUsingSelector: @selector(compare:)];
    self.essBus2List = array;
    [array release];
    
    
    [super viewDidLoad];



}





- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
	

}

- (void)viewDidUnload {
    
    self.essBus2List = nil;
    [super viewDidUnload];
    
}


- (void)dealloc {
    [essBus2List release];
    [super dealloc];
}



#pragma mark Table view methods



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.essBus2List count];

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
    cell.titleLabel.text = [essBus2List objectAtIndex: row];
    cell.detailLabel.text = @"Essential Bus 2";
    
	
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

