//
//  ManualNavigationController.m
//  Power Source
//
//  Created by Matthew Hull on 3/4/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "ManualNavigationController.h"
#import "UserManualViewController.h"


@implementation ManualNavigationController


@synthesize delegate;
@synthesize manualNavigationController;
@synthesize userManualViewController;


- (void)viewDidLoad {
    //initialize the root view controller for the navigationcontroller
    UserManualViewController *manualViewController = [[UserManualViewController alloc] initWithNibName:@"UserManualViewController" bundle:nil];
    self.userManualViewController = manualViewController;
    [manualViewController release];
    userManualViewController.title = @"User Manual";
    
    //the maualViewController (root view controller) has a close button that allows the view to be dismissed.
    UIBarButtonItem *closeButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"Close" 
                                                                        style: UIBarButtonItemStylePlain 
                                                                       target: self
                                                                       action: @selector(backToMainMenu:)];
    
    //assigning the closeButton to the manualViewController
    userManualViewController.navigationItem.leftBarButtonItem = closeButtonItem;
    [closeButtonItem release];
            
    //setup for the navigationController & its root: the manualViewController
    manualNavigationController = [[UINavigationController alloc] initWithRootViewController: userManualViewController];
    manualNavigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    manualNavigationController.view.frame = CGRectMake(0.0, 0.0, 320.0, 460.0);
    [self.view addSubview: [manualNavigationController view]];
    
    [super viewDidLoad];
}


-(IBAction)backToMainMenu:(id)sender {
    [delegate didRequestMainMenu: self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    

}

- (void)viewDidUnload {
    self.manualNavigationController = nil;
    self.userManualViewController = nil;
    [super viewDidUnload];
}


- (void)dealloc {
    [manualNavigationController release];
    [userManualViewController release];
    [super dealloc];
}


@end
