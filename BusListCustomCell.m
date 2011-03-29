//
//  BusListCustomCell.m
//  Power Source
//
//  Created by Matthew Hull on 12/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BusListCustomCell.h"


@implementation BusListCustomCell
@synthesize titleLabel;
@synthesize detailLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [titleLabel release];
    [detailLabel release];
    [super dealloc];
}


@end
