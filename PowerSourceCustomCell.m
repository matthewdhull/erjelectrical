//
//  PowerSourceCustomCell.m
//  Power Source
//
//  Created by Matthew Hull on 12/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PowerSourceCustomCell.h"


@implementation PowerSourceCustomCell
@synthesize title;

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
    [title release];
    [super dealloc];
}


@end
