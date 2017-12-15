//
//  ModeSelectView.h
//  Power Source
//
//  Created by Matthew Hull on 2/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class DiodeView;

@interface ModeSelectView : UIView {
    UIImageView *mainScreenView;
    
    UIButton *loadInteractiveViewButton;
    UIButton *loadTableViewButton;
    UIButton *loadManualButton;
    
    DiodeView *diodeView;
    
}

@property (nonatomic, retain) UIImageView *mainScreenView;
@property (nonatomic, retain) UIButton *loadInteractiveViewButton;
@property (nonatomic, retain) UIButton *loadTableViewButton;
@property (nonatomic, retain) UIButton *loadManualButton;
@property (nonatomic, retain) DiodeView *diodeView;




-(void)translateDiodeAnimation;



@end
