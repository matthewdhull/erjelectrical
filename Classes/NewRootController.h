//
//  NewRootController.h
//  Power Source
//
//  Created by Matthew Hull on 2/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewDismissalDelegate.h"

@class ElectricalSystemEngineViewController;
@class PwrSrcDistroLoadListViewController;
@class ManualNavigationController;
@class ModeSelectView;



@interface NewRootController : UIViewController <ModalViewDismissalDelegate> {
    
    ElectricalSystemEngineViewController *electricalSystemEngineViewController;
    PwrSrcDistroLoadListViewController *pwrSrcDistroLoadListViewController;
    ManualNavigationController *manualNavigationController;
    ModeSelectView *modeSelectView;
    
    UIImageView *interactiveButtonHighlighted;
    UIImageView *tableViewButtonHighlighted;



}

@property (nonatomic, retain) ElectricalSystemEngineViewController *electricalSystemEngineViewController;
@property (nonatomic, retain) PwrSrcDistroLoadListViewController *pwrSrcDistroLoadListViewController;
@property (nonatomic, retain) ManualNavigationController *manualNavigationController;
@property (nonatomic, retain) ModeSelectView *modeSelectView;
@property (nonatomic, retain) UIImageView *interactiveButtonHighlighted;
@property (nonatomic, retain) UIImageView *tableViewButtonHighlighted;

-(void)loadInteractiveView:(id)sender;

-(void)showInteractiveModalController;

-(void)loadDistroLoadListView:(id)sender;

-(void)showDistroLoadModalController;

-(void)loadManualViewController;

-(void)animateButtonImage:(UIImageView *)imageView withSelector: (SEL)aSelector;







@end
