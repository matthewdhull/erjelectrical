//
//  BusListCustomCell.h
//  Power Source
//
//  Created by Matthew Hull on 12/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BusListCustomCell : UITableViewCell {
    UILabel *titleLabel;
    UILabel *detailLabel;

}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *detailLabel;

@end
