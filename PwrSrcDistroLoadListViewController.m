//
//  PwrSrcDistroLoadListViewController.m
//  Power Source
//
//  Created by Matthew Hull on 2/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PwrSrcDistroLoadListViewController.h"
#import "ElectricalSystemDiagramView.h"

@implementation PwrSrcDistroLoadListViewController

@synthesize viewDelegate;
@synthesize electricalSystemDiagramView;
@synthesize backGroundImageView;
@synthesize touchAnyBusView;
@synthesize tableBorderView;
@synthesize distroTableView;
@synthesize distroListArray;
@synthesize subTitleString;

@synthesize backToMainMenuButton;
@synthesize dcbus1Button;
@synthesize dcBus2Button;
@synthesize centralBusButton;
@synthesize essBus1Button;
@synthesize essBus2Button;
@synthesize hotBus1Button;
@synthesize hotBus2Button;
@synthesize backupEssBusButton;
@synthesize backupHotBusButton;
@synthesize shedBus1Button;
@synthesize shedBus2Button;
@synthesize backupBus1Button;
@synthesize backupBus2Button;

- (void)viewDidLoad {
    
    buttonPressesStarted = NO;
    subTitleString = [[NSMutableString alloc] init];
    NSMutableArray *distroArray = [[NSMutableArray alloc] initWithObjects:@"Touch Any Bus", nil];
    self.distroListArray = distroArray;
    [distroArray release];
    
    //set up for backround image
    UIImageView *backGroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"gradientBackground.png"]];
    self.backGroundImageView = backGroundView;
    [self.view addSubview: backGroundImageView];
    [backGroundView release];
    
    
    //set up for diagram image
    ElectricalSystemDiagramView *diagramView = [[ElectricalSystemDiagramView alloc] init];
    diagramView.frame = CGRectMake(13.0, 15.0, 300.0, 240.0);
    [diagramView depowerAllBuses];
    self.electricalSystemDiagramView = diagramView;
    [self.view addSubview: electricalSystemDiagramView];
    [diagramView release];
    
    //back to main menu button
    backToMainMenuButton = [UIButton buttonWithType: UIButtonTypeCustom];
    backToMainMenuButton.frame = CGRectMake(3.0, 0.0, 28.0, 41.0);
    backToMainMenuButton.opaque = YES;
    [backToMainMenuButton setBackgroundImage: [UIImage imageNamed: @"ArrowTab.png"] forState: UIControlStateNormal];
    [backToMainMenuButton addTarget: self action: @selector(backToMainMenu:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: backToMainMenuButton];    

    //table view which allows the different items on the selected bus to be displayed.
    UITableView *table = [[UITableView alloc] initWithFrame: CGRectMake(13.0, 237.0, 293.0, 215.0) style: UITableViewStylePlain];
    table.backgroundColor = [UIColor blackColor];
    table.dataSource = self;
    table.delegate = self;
    table.scrollEnabled = NO;
    table.allowsSelection = NO;
    self.distroTableView = table;
    [self.view addSubview: distroTableView];
    [table release];

    //set up table border
    UIImage *image = [UIImage imageNamed: @"TableBorder.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    imageView.frame = CGRectMake(7.0, 227.0, image.size.width, image.size.height);
    self.tableBorderView = imageView;
    [self.view addSubview: tableBorderView];
    [imageView release];
    
    //touch a bus image
    UIImage *touchABusImage = [UIImage imageNamed: @"TouchAnyBusLabel.png"];
    UIImageView *touchABusView = [[UIImageView alloc] initWithImage: touchABusImage];
    touchABusView.frame = CGRectMake(9.0, 229.0, touchABusImage.size.width, touchABusImage.size.height);
    self.touchAnyBusView = touchABusView;
    [self.view addSubview: touchAnyBusView];
    [touchABusView release];
    
    
    dcbus1Button  = [UIButton buttonWithType: UIButtonTypeCustom];
    dcbus1Button.frame = CGRectMake(26.0, 67.0, 75.0, 16.0);
    [dcbus1Button addTarget: self action: @selector(loadDCBus1List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: dcbus1Button];
    
    dcBus2Button  = [UIButton buttonWithType: UIButtonTypeCustom];
    dcBus2Button.frame = CGRectMake(224.0, 67.0, 74.0, 16.0);
    [dcBus2Button addTarget: self action: @selector(loadDCBus2List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: dcBus2Button];
    
    centralBusButton = [UIButton buttonWithType: UIButtonTypeCustom];
    centralBusButton.frame = CGRectMake(139.0, 67.0, 49.0, 15.0);
    [centralBusButton addTarget: self action: @selector(loadCentralBusList:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: centralBusButton];
    
    essBus1Button = [UIButton buttonWithType: UIButtonTypeCustom];
    essBus1Button.frame = CGRectMake(77.0, 205.0, 57.0, 17.0);
    [essBus1Button addTarget: self action: @selector(loadEssBus1List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: essBus1Button];
    
    essBus2Button = [UIButton buttonWithType: UIButtonTypeCustom];
    essBus2Button.frame = CGRectMake(192.0, 205.0, 54.0, 16.0);
    [essBus2Button addTarget: self action: @selector(loadEssBus2List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: essBus2Button];
    
    hotBus1Button = [UIButton buttonWithType: UIButtonTypeCustom];
    hotBus1Button.frame = CGRectMake(78.0, 110.0, 53.0, 18.0);
    [hotBus1Button addTarget:self action:@selector(loadHotBus1List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: hotBus1Button];
    
    hotBus2Button = [UIButton buttonWithType: UIButtonTypeCustom];
    hotBus2Button.frame = CGRectMake(193.0, 110.0, 53.0, 18.0);
    [hotBus2Button addTarget:self action: @selector(loadHotBus2List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: hotBus2Button];
    
    backupEssBusButton = [UIButton buttonWithType: UIButtonTypeCustom];
    backupEssBusButton.frame = CGRectMake(88.0, 150.0, 47.0, 14.0);
    [backupEssBusButton addTarget:self action: @selector(loadBackupEssBusList:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: backupEssBusButton];
    
    backupHotBusButton = [UIButton buttonWithType: UIButtonTypeCustom];
    backupHotBusButton.frame = CGRectMake(155.0, 151.0, 46.0, 15.0);
    [backupHotBusButton addTarget:self action: @selector(loadBackupHotBusList:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: backupHotBusButton];
    
    shedBus1Button =[UIButton buttonWithType: UIButtonTypeCustom];
    shedBus1Button.frame = CGRectMake(26.0, 206.0, 37.0, 15.0);
    [shedBus1Button addTarget:self action: @selector(loadShedBus1List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: shedBus1Button];
    
    shedBus2Button = [UIButton buttonWithType: UIButtonTypeCustom];
    shedBus2Button.frame = CGRectMake(262.0, 207.0, 36.0, 15.0);
    [shedBus2Button addTarget:self action: @selector(loadShedBus2List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:shedBus2Button ];
    
    backupBus1Button = [UIButton buttonWithType: UIButtonTypeCustom];
    backupBus1Button.frame = CGRectMake(88.0, 181.0, 37.0, 11.0);
    [backupBus1Button addTarget:self action: @selector(loadBackupBus1List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: backupBus1Button];
    
    backupBus2Button = [UIButton buttonWithType: UIButtonTypeCustom];
    backupBus2Button.frame = CGRectMake(126.0, 181.0, 36.0, 11.0);
    [backupBus2Button addTarget:self action: @selector(loadBackupBus2List:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: backupBus2Button];
    
    [super viewDidLoad];
}

-(BOOL)buttonPressesStarted {
    return buttonPressesStarted;
}


-(void)setButtonPressesStarted:(BOOL)flag {
    if (buttonPressesStarted == NO) 
        buttonPressesStarted = YES;
    if(flag == YES) {
        self.distroTableView.scrollEnabled = YES;
        if(touchAnyBusView != nil) {
            [UIView beginAnimations:@"FadeSelectionLabel" context: nil];
            [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
            [UIView setAnimationDuration: 0.5];
            [UIView setAnimationRepeatCount: 1.0];
            self.touchAnyBusView.alpha = 0.0;
            [UIView commitAnimations];
            self.touchAnyBusView = nil; 
        }
    }
}

-(void)refreshTableViewWithFileName:(NSString *)name {
    [self setButtonPressesStarted: YES];
    [distroListArray removeAllObjects];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource: name ofType: @"plist"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile: plistPath];
    [array sortedArrayUsingSelector: @selector (compare:)];
    self.distroListArray = array;
    [array release];
    NSMutableString *subtitleName = [NSMutableString stringWithString: name];
    self.subTitleString = subtitleName;
    [self.distroTableView reloadData];
}


-(IBAction)loadDCBus1List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"DCBus1"];
    [electricalSystemDiagramView selectDCBus1PowerSymbol];

    
}


-(IBAction)loadDCBus2List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"DCBus2"];
    [electricalSystemDiagramView selectDCBus2PowerSymbol];

}



-(IBAction)loadCentralBusList:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"CentralBus"];
    [electricalSystemDiagramView selectCentralBusPowerSymbol];
   
  }

-(IBAction)loadEssBus1List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"EssBus1"];
    [electricalSystemDiagramView selectEssBus1Symbol];
    
}

-(IBAction)loadEssBus2List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"EssBus2"];
    [electricalSystemDiagramView selectEssBus2Symbol];
    
}

-(IBAction)loadHotBus1List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"HotBus1"];
    [electricalSystemDiagramView selectHotBus1Symbol];
    
}

-(IBAction)loadHotBus2List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"HotBus2"];
    [electricalSystemDiagramView selectHotBus2Symbol];
   
}

-(IBAction)loadBackupEssBusList:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"BackupEssentialBus"];
    [electricalSystemDiagramView selectBackupEssBusSymbol];
   
}

-(IBAction)loadBackupHotBusList:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"BackupHotBus"];
    [electricalSystemDiagramView selectBackupHotBusSymbol];
   
}

-(IBAction)loadShedBus1List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"ShedBus1"];
    [electricalSystemDiagramView selectShedBus1Symbol];
    
}

-(IBAction)loadShedBus2List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"ShedBus2"];
    [electricalSystemDiagramView selectShedBus2Symbol];
   
}

-(IBAction)loadBackupBus1List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"BackupBus1"];
    [electricalSystemDiagramView selectBackupBus1Symbol];
    
}

-(IBAction)loadBackupBus2List:(id)sender {
    [self setButtonPressesStarted: YES];
    [self refreshTableViewWithFileName: @"BackupBus2"];
    [electricalSystemDiagramView selectBackupBus2Symbol];
  
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
	

}

- (void)viewDidUnload {
    self.backGroundImageView = nil;
    self.electricalSystemDiagramView = nil;
    self.tableBorderView = nil;
    self.touchAnyBusView = nil;
    self.distroTableView = nil;
    self.distroListArray = nil;
    self.subTitleString = nil;
    
    self.backToMainMenuButton = nil;
    self.dcbus1Button = nil;
    self.dcBus2Button = nil;
    self.centralBusButton = nil;
    self.essBus1Button = nil;
    self.essBus2Button = nil;
    self.hotBus1Button = nil;
    self.hotBus2Button = nil;
    self.backupEssBusButton = nil;
    self.backupHotBusButton = nil;
    self.shedBus1Button = nil;
    self.shedBus2Button = nil;
    self.backupBus1Button = nil;
    self.backupBus2Button = nil;
}


- (void)dealloc {
    
    [backGroundImageView release];
    [electricalSystemDiagramView release];
    [tableBorderView release];
    [touchAnyBusView release];
    [distroListArray release];
    [distroTableView release];
    [subTitleString release];
    [backToMainMenuButton release];
    [dcbus1Button release];
    [dcBus2Button release];
    [centralBusButton release];
    [essBus1Button release];
    [essBus2Button release];
    [hotBus1Button release];
    [hotBus2Button release];
    [backupEssBusButton release];
    [backupHotBusButton release];
    [shedBus1Button release];
    [shedBus2Button release];
    [backupBus1Button release];
    [backupBus2Button release];
    
    [super dealloc];
}


//this method was assigned to the arrow button.
-(void)backToMainMenu:(id)sender {
    [viewDelegate didRequestMainMenu: self];
}



#pragma mark -
#pragma mark - TableView Delegate & DataSource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowNumber;
    rowNumber = [self.distroListArray count];
    
    
    return rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
    if (cell == nil ) {
        cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: cellIdentifier] autorelease];
        cell.opaque = NO;
    }
    
    NSInteger row = [indexPath row];
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize: 12];
    cell.textLabel.text = [self.distroListArray objectAtIndex: row];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize: 12];
    cell.detailTextLabel.text = subTitleString;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
        
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat rowHeight;
    rowHeight = 40.0;
    return rowHeight;
}

@end
