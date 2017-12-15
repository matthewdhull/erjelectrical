//
//  ModeSelectView.m
//  Power Source
//
//  Created by Matthew Hull on 2/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define LOG_FRAME NSLog(@"Frame: x: %.02f y: %.02f w:%.02f, h: %.02f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
#define degreesToRadians(x) (M_PI * x / 180.0)
#define radiansToDegrees(x) (x * 180.0 / M_PI)

#import "ModeSelectView.h"
#import "DiodeView.h"
#import <QuartzCore/QuartzCore.h>


@implementation ModeSelectView

@synthesize mainScreenView;
@synthesize loadInteractiveViewButton;
@synthesize loadTableViewButton;
@synthesize loadManualButton;
@synthesize diodeView;


- (id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])){
        

        self.backgroundColor = [UIColor blackColor];

//        UIImageView *mainImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"MainScreen_WIP.png"]];
//        self.mainScreenView = mainImage;
        CGRect diodeRect = CGRectMake(76.0, 200.0, 168.0, 109.0);
        self.diodeView = [[DiodeView alloc] initWithFrame: diodeRect];



        if (IS_IPHONE_5) {
            self.mainScreenView.frame = [[UIScreen mainScreen] bounds];
        }
        
        else {

            CGRect smallScreenDiodeFrame = CGRectMake(diodeRect.origin.x, diodeRect.origin.y - 60.0f, diodeRect.size.width, diodeRect.size.height);
//            CGRect smallScreenMainViewFrame = CGRectMake(0.0, -25.0f, [[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height);
//            self.mainScreenView.frame = smallScreenMainViewFrame;
            diodeView.frame = smallScreenDiodeFrame;
        }

        
        [self addSubview: self.mainScreenView];
//        [mainImage release];
        
       [diodeView setBackgroundColor: [UIColor clearColor]];
       [self addSubview: diodeView];
        


        
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

        // TODO: repair XIBs
//        loadTableViewButton = [UIButton buttonWithType: UIButtonTypeCustom];
//        loadTableViewButton.frame = CGRectMake((self.frame.size.width - 200)/2, self.frame.size.height * 0.775f, 200, 40);
//        loadTableViewButton.backgroundColor = [UIColor clearColor];
//        loadTableViewButton.highlighted = NO;
//        [loadTableViewButton setTitle: @"Power Sources" forState: UIControlStateNormal];
//        [loadTableViewButton setTitleColor: [UIColor colorWithWhite: 1.0f alpha: 0.75f] forState: UIControlStateNormal];
//        [loadTableViewButton setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
//        loadTableViewButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        loadTableViewButton.titleLabel.font = [UIFont systemFontOfSize: 15];
//        loadTableViewButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview: loadTableViewButton];

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

-(void)translateDiodeAnimation {
    
    [self.diodeView.layer valueForKeyPath:@"rotation.z"];

    CATransform3D rotationTransform =  CATransform3DMakeRotation(degreesToRadians(90.0f), 0.0f, 0.0f, 1.0f);
    CATransform3D currentTransform = CATransform3DMakeRotation(degreesToRadians(0.0f), 0.0f, 0.0f, 1.0f);
    CATransform3D trans1 = CATransform3DMakeRotation(degreesToRadians(45.0f), 0.0f, 0.0f, 1.0f);
    CATransform3D overTransform = CATransform3DMakeRotation(degreesToRadians(100.0f), 0.0f, 0.0f, 1.0f);


    NSValue *finalTrans = [NSValue valueWithCATransform3D: rotationTransform];
    NSValue *currentTrans = [NSValue valueWithCATransform3D: currentTransform];
    NSValue *interTrans1 = [NSValue valueWithCATransform3D:trans1];
    NSValue *overTrans = [NSValue valueWithCATransform3D:overTransform];


    NSArray *angles = [NSArray arrayWithObjects: currentTrans, interTrans1, overTrans, finalTrans, nil];
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath: @"transform"];
    
    keyFrameAnimation.values = angles;
    keyFrameAnimation.duration = 0.30f;
//        keyFrameAnimation.cumulative = YES;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    keyFrameAnimation.repeatCount = 1;
    keyFrameAnimation.delegate = self;
    
    self.diodeView.layer.transform = rotationTransform;
    [self.diodeView.layer addAnimation: keyFrameAnimation forKey: @"RotateIndicatorLine"];
    

    
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    [self.diodeView setStrokeColor: [UIColor blueColor]];
}



//
//- (void)drawRect:(CGRect)rect {
//}
//

- (void)dealloc {
    [mainScreenView release];
    [diodeView release];
    [super dealloc];
}


@end
