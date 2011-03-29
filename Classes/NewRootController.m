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
@synthesize interactiveButtonHighlighted;
@synthesize tableViewButtonHighlighted;

- (void)viewDidLoad {
    
    ElectricalSystemEngineViewController *interactController = [[ElectricalSystemEngineViewController alloc] init];
    interactController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
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
    
    
    //backgroundView
    ModeSelectView *modeView = [[ModeSelectView alloc] init];
    modeView.frame = CGRectMake(0.0, 0.0, 320.0, 460.0);
    self.modeSelectView = modeView;
    [self.view addSubview: modeSelectView];
    [modeView release];
    
    //interactiveButtonHighlighted image
    UIImageView *ibHighlighted = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"InteractiveButtonHighlighted.png"]];
    ibHighlighted.frame = CGRectMake(49.0, 343.0, ibHighlighted.image.size.width,  ibHighlighted.image.size.height);
    self.interactiveButtonHighlighted = ibHighlighted;
    [self.view addSubview: interactiveButtonHighlighted];
    [ibHighlighted release];
    
    //tableViewButtonHighlighted image
    UIImageView *tbHighlighted = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"TableViewHighlighted.png"]];
    tbHighlighted.frame = CGRectMake(176.0, 343.0, tbHighlighted.image.size.width,  tbHighlighted.image.size.height);
    self.tableViewButtonHighlighted = tbHighlighted;
    [self.view addSubview: tableViewButtonHighlighted];
    [tbHighlighted release];

    
    //adding appropriate selectors to the buttons
    [modeSelectView.loadInteractiveViewButton addTarget: self action: @selector(loadInteractiveView:) forControlEvents: UIControlEventTouchUpInside];
    [modeSelectView.loadTableViewButton addTarget: self action: @selector(loadDistroLoadListView:) forControlEvents: UIControlEventTouchUpInside];
    [modeSelectView.loadManualButton addTarget: self action:@selector(loadManualViewController) forControlEvents: UIControlEventTouchUpInside];

    [super viewDidLoad];

}


//this method is a wrapper with a simple method signature that is compatible with the [UIButton addTarget: etc.]
-(void)loadInteractiveView:(id)sender {
    [self animateButtonImage: interactiveButtonHighlighted withSelector: @selector(showInteractiveModalController)];

}


-(void)showInteractiveModalController {
    [self presentModalViewController: electricalSystemEngineViewController animated: YES];
    [interactiveButtonHighlighted removeFromSuperview];
    /*self.interactiveButtonHighlighted = nil;
    [interactiveButtonHighlighted release]; */
}



//this method is a wrapper with a simple method signature that is compatible with the [UIButton addTarget: etc.]
-(void)loadDistroLoadListView:(id)sender {
    [self animateButtonImage:tableViewButtonHighlighted withSelector: @selector(showDistroLoadModalController)];

}

-(void)showDistroLoadModalController {
    [self presentModalViewController: pwrSrcDistroLoadListViewController animated: YES];
    [tableViewButtonHighlighted removeFromSuperview];
    /*self.tableViewButtonHighlighted = nil;
    [tableViewButtonHighlighted release]; */
}

-(void)loadManualViewController {
    [self presentModalViewController: manualNavigationController animated: YES];
}



//this animation animates the ImageView on top of the UIbuttons in this view Controller.  It makes the button scale and fade out when it is pressed.
//Additionally, this method allows the setting of the animationDidStopSelector:(SEL).  
-(void)animateButtonImage:(UIImageView *)imageView withSelector: (SEL)aSelector {
    
    [UIView beginAnimations: @"button image highlighted" context: nil];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDidStopSelector: (SEL)aSelector];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount: 1];
    [UIView setAnimationDuration: 0.15];
    imageView.transform = CGAffineTransformMakeScale(3.0, 3.0);
    imageView.alpha = 0.0;
    [UIView commitAnimations];
    
}



#pragma mark - 
#pragma mark - ModalViewDismissalDelegate Methods

-(void)didRequestMainMenu: (id)sender {
    [self dismissModalViewControllerAnimated: YES];
    
    //if the interactive or tableView mode was being used, it resets it's button image (due to the CGAffineTransformMakeScale method)

    if ([sender isKindOfClass:[ElectricalSystemEngineViewController class]]) {      
        
        UIImageView *ibHighlighted = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"InteractiveButtonHighlighted.png"]];
        ibHighlighted.frame = CGRectMake(49.0, 343.0, ibHighlighted.image.size.width,  ibHighlighted.image.size.height);
        self.interactiveButtonHighlighted = ibHighlighted;
        [self.view addSubview: interactiveButtonHighlighted];
        [ibHighlighted release];
    }
    
    if ([sender isKindOfClass:[PwrSrcDistroLoadListViewController class]]) {
        
        UIImageView *tbHighlighted = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"TableViewHighlighted.png"]];
        tbHighlighted.frame = CGRectMake(176.0, 343.0, tbHighlighted.image.size.width,  tbHighlighted.image.size.height);
        self.tableViewButtonHighlighted = tbHighlighted;
        [self.view addSubview: tableViewButtonHighlighted];
        [tbHighlighted release];
        

    }
    
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
    self.interactiveButtonHighlighted = nil;
    self.tableViewButtonHighlighted = nil;

}


- (void)dealloc {
    [electricalSystemEngineViewController release]; 
    [pwrSrcDistroLoadListViewController release];
    [manualNavigationController release];
    [modeSelectView release];
    [interactiveButtonHighlighted release];
    [tableViewButtonHighlighted release];
    [super dealloc];
}


@end