//
//  ModeSelectView.m
//  Power Source
//
//  Created by Matthew Hull on 2/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ModeSelectView.h"


@implementation ModeSelectView

@synthesize mainScreenView;
@synthesize loadInteractiveViewButton;
@synthesize loadTableViewButton;
@synthesize loadManualButton;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.frame = CGRectMake(0.0, 0.0, 320.0, 460.0);
        self.backgroundColor = [UIColor clearColor];
        UIImageView *mainImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"MainScreen.png"]];
        self.mainScreenView = mainImage;
        [self addSubview: mainScreenView];
        [mainImage release];
        
        loadInteractiveViewButton = [UIButton buttonWithType: UIButtonTypeCustom];
        loadInteractiveViewButton.frame = CGRectMake(49.0, 343.0, 97.0, 79.0);
        loadInteractiveViewButton.highlighted = NO;
        [loadInteractiveViewButton setTitle: @"Interactive Mode" forState: UIControlStateNormal];
        [loadInteractiveViewButton setTitleColor: [UIColor grayColor] forState: UIControlStateNormal];
        loadInteractiveViewButton.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        loadInteractiveViewButton.titleLabel.font = [UIFont systemFontOfSize: 15];
        loadInteractiveViewButton.titleLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview: loadInteractiveViewButton];
        
        loadTableViewButton = [UIButton buttonWithType: UIButtonTypeCustom];
        loadTableViewButton.frame = CGRectMake(175.0, 343.0, 97.0, 79.0);
        loadTableViewButton.highlighted = NO;
        [loadTableViewButton setTitle: @"Power Src List Mode" forState: UIControlStateNormal];
        [loadTableViewButton setTitleColor: [UIColor grayColor] forState: UIControlStateNormal];
        loadTableViewButton.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        loadTableViewButton.titleLabel.font = [UIFont systemFontOfSize: 15];
        loadTableViewButton.titleLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview: loadTableViewButton];
        
        loadManualButton = [UIButton buttonWithType: UIButtonTypeCustom];
        loadManualButton.frame = CGRectMake( 96.0, 289.0, 128.0, 30.0);
        [loadManualButton setTitle: @"Manual" forState: UIControlStateNormal];
        [loadManualButton setTitleColor: [UIColor greenColor] forState: UIControlStateNormal];
        [loadManualButton setTitleColor: [UIColor colorWithRed: 212.0/255.0 green: 255.0/255.0 blue: 212.0/255.0 alpha: 1.0] 
                               forState: UIControlStateHighlighted];
        loadManualButton.titleLabel.font = [UIFont systemFontOfSize: 15];
        loadManualButton.titleLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview: loadManualButton];
        
      }
       return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [mainScreenView release];
    [super dealloc];
}


@end
