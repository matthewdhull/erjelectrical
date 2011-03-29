//
//  ManualNavigationController.h
//  Power Source
//
//  Created by Matthew Hull on 3/4/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewDismissalDelegate.h"

@class UserManualViewController;


@interface ManualNavigationController : UIViewController {
    id <ModalViewDismissalDelegate> delegate;
    UINavigationController *manualNavigationController;
    UserManualViewController *userManualViewController;
}


@property (assign) id <ModalViewDismissalDelegate> delegate;
@property (nonatomic, retain) IBOutlet UINavigationController *manualNavigationController;
@property (nonatomic, retain) UserManualViewController *userManualViewController;

-(IBAction)backToMainMenu:(id)sender;

@end
