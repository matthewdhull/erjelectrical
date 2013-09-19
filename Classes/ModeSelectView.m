//
//  ModeSelectView.m
//  Power Source
//
//  Created by Matthew Hull on 2/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define LOG_FRAME NSLog(@"Frame: x: %.02f y: %.02f w:%.02f, h: %.02f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);

#import "ModeSelectView.h"
#import "DiodeView.h"
#import <QuartzCore/QuartzCore.h>


@implementation ModeSelectView

@synthesize mainScreenView;
@synthesize loadInteractiveViewButton;
@synthesize loadTableViewButton;
@synthesize loadManualButton;


- (id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])){
        

        self.backgroundColor = [UIColor clearColor];

        UIImageView *mainImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"MainScreen_WIP.png"]];
        self.mainScreenView = mainImage;
        
        DiodeView *diodeView = [[DiodeView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

        if (IS_IPHONE_5) {
            self.mainScreenView.frame = [[UIScreen mainScreen] bounds];
        }
        
        else {

            CGRect smallScreenDiodeFrame = CGRectMake(0.0, -50.0f, [[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height);
            CGRect smallScreenMainViewFrame = CGRectMake(0.0, -25.0f, [[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height);
            self.mainScreenView.frame = smallScreenMainViewFrame;
            diodeView.frame = smallScreenDiodeFrame;
        }

        
        [self addSubview: self.mainScreenView];
        [mainImage release];
                                                   
       [diodeView setBackgroundColor: [UIColor clearColor]];
       [self addSubview: diodeView];
       [diodeView release];

        
        
        
        
        loadInteractiveViewButton = [UIButton buttonWithType: UIButtonTypeCustom];
        loadInteractiveViewButton.frame = CGRectMake((self.frame.size.width - 200)/2, self.frame.size.height * 0.689f, 200, 40);
        loadInteractiveViewButton.backgroundColor = [UIColor clearColor];
        [loadInteractiveViewButton setTitle: @"Interact" forState: UIControlStateNormal];
        [loadInteractiveViewButton setTitleColor: [UIColor colorWithWhite: 1.0f alpha: 0.75f] forState: UIControlStateNormal];
        [loadInteractiveViewButton setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
        loadInteractiveViewButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        loadInteractiveViewButton.titleLabel.font = [UIFont systemFontOfSize: 15];
        loadInteractiveViewButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview: loadInteractiveViewButton];

        loadTableViewButton = [UIButton buttonWithType: UIButtonTypeCustom];
        loadTableViewButton.frame = CGRectMake((self.frame.size.width - 200)/2, self.frame.size.height * 0.775f, 200, 40);
        loadTableViewButton.backgroundColor = [UIColor clearColor];
        loadTableViewButton.highlighted = NO;
        [loadTableViewButton setTitle: @"Power Sources" forState: UIControlStateNormal];
        [loadTableViewButton setTitleColor: [UIColor colorWithWhite: 1.0f alpha: 0.75f] forState: UIControlStateNormal];
        [loadTableViewButton setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
        loadTableViewButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        loadTableViewButton.titleLabel.font = [UIFont systemFontOfSize: 15];
        loadTableViewButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview: loadTableViewButton];

        loadManualButton = [UIButton buttonWithType: UIButtonTypeCustom];
        loadManualButton.frame = CGRectMake((self.frame.size.width-200)/2, self.frame.size.height * 0.862f, 200,40);
        loadManualButton.backgroundColor = [UIColor clearColor];
        [loadManualButton setTitle: @"Guide" forState: UIControlStateNormal];
        [loadManualButton setTitleColor: [UIColor colorWithWhite: 1.0f alpha: 0.75f] forState: UIControlStateNormal];
        [loadManualButton setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
        loadManualButton.titleLabel.font = [UIFont systemFontOfSize: 15];
        loadManualButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview: loadManualButton];
      }
       return self;
}


/*
- (void)drawRect:(CGRect)rect {
}
*/

- (void)dealloc {
    [mainScreenView release];
    [super dealloc];
}


@end
