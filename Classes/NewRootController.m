//
//  NewRootController.m
//  Power Source
//
//  Created by Matthew Hull on 2/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "NewRootController.h"
#import "ElectricalSystemEngineViewController.h"
#import "PwrSrcDistroLoadListViewController.h"
#import "ManualNavigationController.h"
#import "ModeSelectView.h"




@implementation NewRootController

@synthesize electricalSystemEngineViewController;
@synthesize pwrSrcDistroLoadListViewController;
@synthesize manualNavigationController;
@synthesize modeSelectView;

- (void)viewDidLoad {
    
    //backgroundView
    ModeSelectView *modeView = [[ModeSelectView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.modeSelectView = modeView;
    [self.view addSubview: modeSelectView];
    [modeView release];
    
    ElectricalSystemEngineViewController *interactController = [[ElectricalSystemEngineViewController alloc] init];
    interactController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [interactController setDelegate: self];
    self.electricalSystemEngineViewController = interactController;
    [interactController release];

    PwrSrcDistroLoadListViewController *distroLoadController = [[PwrSrcDistroLoadListViewController alloc]
                                                                initWithNibName: @"PwrSrcDistroLoadListViewController" bundle: nil];
    distroLoadController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [distroLoadController setViewDelegate: self];
    self.pwrSrcDistroLoadListViewController = distroLoadController;
    [distroLoadController release];
    
    ManualNavigationController *modalNavController = [[ManualNavigationController alloc] 
                                              initWithNibName: @"ManualNavigationController" bundle: nil];
    modalNavController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [modalNavController setDelegate: self];
    self.manualNavigationController = modalNavController;
    [modalNavController release];
    
    
    //adding appropriate selectors to the buttons
    [modeSelectView.loadInteractiveViewButton addTarget: self action: @selector(showInteractiveModalController) forControlEvents: UIControlEventTouchUpInside];
    [modeSelectView.loadTableViewButton addTarget: self action: @selector(showDistroLoadModalController) forControlEvents: UIControlEventTouchUpInside];
    [modeSelectView.loadManualButton addTarget: self action:@selector(loadManualViewController) forControlEvents: UIControlEventTouchUpInside];

    [super viewDidLoad];

}



-(void)showInteractiveModalController {
    [modeSelectView translateDiodeAnimation];
    [self presentViewController: electricalSystemEngineViewController animated:YES completion: NULL];
}


-(void)showDistroLoadModalController {
    [self presentViewController: pwrSrcDistroLoadListViewController animated: YES completion: NULL];
}

-(void)loadManualViewController {
    [self presentViewController: manualNavigationController animated: YES completion: NULL];
}


#pragma mark -
#pragma mark - ModalViewDismissalDelegate Methods

-(void)didRequestMainMenu: (id)sender {
    
    if ([sender isEqual: [ElectricalSystemEngineViewController class]]) {
//        [modeSelectView reverseTranslateDiodeAnimation];
    }
    [self dismissViewControllerAnimated:YES completion: NULL];
}



#pragma mark - Misc & memory cleanup

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    self.electricalSystemEngineViewController = nil;
    self.pwrSrcDistroLoadListViewController = nil;
    self.manualNavigationController = nil;
    self.modeSelectView = nil;
}


- (void)dealloc {
    [electricalSystemEngineViewController release]; 
    [pwrSrcDistroLoadListViewController release];
    [manualNavigationController release];
    [modeSelectView release];
    [super dealloc];
}


@end