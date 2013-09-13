//
//  PwrSrcDistroLoadListViewController.h
//  Power Source
//
//  Created by Matthew Hull on 2/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewDismissalDelegate.h"

@class ElectricalSystemDiagramView;

@interface PwrSrcDistroLoadListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    id <ModalViewDismissalDelegate> viewDelegate;
    ElectricalSystemDiagramView *electricalSystemDiagramView;
    UIImageView *tableBorderView;
    UIImageView *touchAnyBusView;
    UITableView *distroTableView;
    NSMutableArray *distroListArray;
    NSMutableString *subTitleString;
    
    UIButton *backToMainMenuButton;
    UIButton *dcbus1Button;
    UIButton *dcBus2Button;
    UIButton *centralBusButton;
    UIButton *essBus1Button;
    UIButton *essBus2Button;
    UIButton *hotBus1Button;
    UIButton *hotBus2Button;
    UIButton *backupEssBusButton;
    UIButton *backupHotBusButton;
    UIButton *shedBus1Button;
    UIButton *shedBus2Button;
    UIButton *backupBus1Button;
    UIButton *backupBus2Button;
    
    BOOL buttonPressesStarted;
  }


@property (assign) id <ModalViewDismissalDelegate> viewDelegate;
@property (nonatomic, retain) ElectricalSystemDiagramView *electricalSystemDiagramView;
@property (nonatomic, retain) UIImageView *tableBorderView;
@property (nonatomic, retain) UIImageView *touchAnyBusView;
@property (nonatomic, retain) UITableView *distroTableView;
@property (nonatomic, retain) NSMutableArray *distroListArray;
@property (nonatomic, retain) NSMutableString *subTitleString;

@property (nonatomic, retain) UIButton *backToMainMenuButton;
@property (nonatomic, retain) UIButton *dcbus1Button;
@property (nonatomic, retain) UIButton *dcBus2Button;
@property (nonatomic, retain) UIButton *centralBusButton;
@property (nonatomic, retain) UIButton *essBus1Button;
@property (nonatomic, retain) UIButton *essBus2Button;
@property (nonatomic, retain) UIButton *hotBus1Button;
@property (nonatomic, retain) UIButton *hotBus2Button;
@property (nonatomic, retain) UIButton *backupEssBusButton;
@property (nonatomic, retain) UIButton *backupHotBusButton;
@property (nonatomic, retain) UIButton *shedBus1Button;
@property (nonatomic, retain) UIButton *shedBus2Button;
@property (nonatomic, retain) UIButton *backupBus1Button;
@property (nonatomic, retain) UIButton *backupBus2Button;


@property BOOL buttonPressesStarted;

-(void)refreshTableViewWithFileName:(NSString *)name;

-(IBAction)loadDCBus1List:(id)sender;

-(IBAction)loadDCBus2List:(id)sender;

-(IBAction)loadCentralBusList:(id)sender;

-(IBAction)loadEssBus1List:(id)sender;

-(IBAction)loadEssBus2List:(id)sender;

-(IBAction)loadHotBus1List:(id)sender;

-(IBAction)loadHotBus2List:(id)sender;

-(IBAction)loadBackupEssBusList:(id)sender;

-(IBAction)loadBackupHotBusList:(id)sender;

-(IBAction)loadShedBus1List:(id)sender;

-(IBAction)loadShedBus2List:(id)sender;

-(IBAction)loadBackupBus1List:(id)sender;

-(IBAction)loadBackupBus2List:(id)sender;

-(void)backToMainMenu:(id)sender;

@end
