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
    
}

@property (nonatomic, retain) ElectricalSystemEngineViewController *electricalSystemEngineViewController;
@property (nonatomic, retain) PwrSrcDistroLoadListViewController *pwrSrcDistroLoadListViewController;
@property (nonatomic, retain) ManualNavigationController *manualNavigationController;
@property (nonatomic, retain) ModeSelectView *modeSelectView;


-(void)showInteractiveModalController;

-(void)showDistroLoadModalController;

-(void)loadManualViewController;


@end
