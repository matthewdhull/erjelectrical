//
//  ElectricalSystemEngineViewController.m
//  Power Source
//
//  Created by Matthew Hull on 12/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ElectricalSystemEngineViewController.h"
#import "LineContactor.h"
#import "GeneratorSymbol.h"
#import "ButtonPad.h"
#import "ElectricalSystemDiagramView.h"
#import "GeneratorDisplay.h"
#import "NewRootController.h"


@implementation ElectricalSystemEngineViewController

//delegate protocol
@synthesize delegate;

//mainview
@synthesize mainView;

//subViews
@synthesize electricalSystemDiagramView;
@synthesize backToMainMenuButton;
@synthesize buttonPad;
@synthesize generatorDisplay;

@synthesize buttonConfig;
@synthesize elecEssXfrFailButtonTitle;
@synthesize airGroundButtonTitle;

@synthesize incrementTimer;
@synthesize decrementTimer;
@synthesize gen1AmpUpTimer;
@synthesize gen1AmpDownTimer;
@synthesize gen2AmpUpTimer;
@synthesize gen2AmpDownTimer;
@synthesize gen3AmpUpTimer;
@synthesize gen3AmpDownTimer;
@synthesize gen4AmpUpTimer;
@synthesize gen4AmpDownTimer;
@synthesize apuAmpUpTimer;
@synthesize apuAmpDownTimer;

@synthesize currentAmps;
@synthesize targetAmps;
@synthesize interval;
@synthesize generatorArray;
@synthesize generatorDictionary;



//booleans
@synthesize onBatteries;
@synthesize airplaneIsCold;
@synthesize allGensAreOn;
@synthesize essPwrConfig;
@synthesize elecEmerAbnormConfig;
@synthesize elecEssXfrFailConfig;
@synthesize airplaneIsInAir;
@synthesize gpuAvailable;
@synthesize gpuSelected;

//line contactors
@synthesize bc2;
@synthesize sbc2;
@synthesize asc;
@synthesize glc1;
@synthesize glc2;
@synthesize glc3;
@synthesize glc4;
@synthesize alc;
@synthesize bc1;
@synthesize sbc1;
@synthesize bbc1;
@synthesize btc1;
@synthesize btc2;
@synthesize eic;
@synthesize gpc;
@synthesize ebc1;
@synthesize ebc2;

//generatorSymbols
@synthesize generator1;
@synthesize generator2;
@synthesize generator3;
@synthesize generator4;
@synthesize apuGenerator;


-(void)loadView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blackColor];
    self.mainView = view;
    self.view = mainView;
    [view release];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [self coldAirplane: self];
}

 //this method was overridden to call coldAirplane: when the view is removed from it's parent View Controller
-(void)viewDidDisappear:(BOOL)animated {
    animated = NO;
    [self coldAirplane: self];
    [super viewDidDisappear: NO];
}

- (void)viewDidLoad {
    [self loadAllComponents];
    [super viewDidLoad];
}




-(void)loadAllComponents {
    
    //backgroundImage
//    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"gradientBackground.png"]];
//    [self.view addSubview: backgroundImageView];
//    [backgroundImageView release];
    
    //light gray background color
    self.view.backgroundColor = [UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0];
     
    
    //set up electrical system diagram image
    ElectricalSystemDiagramView *diagramView = [[ElectricalSystemDiagramView alloc] initWithFrame: CGRectMake(13.0, 15.0, 300.0, 240.0)];
    self.electricalSystemDiagramView = diagramView;
    [self.view addSubview: electricalSystemDiagramView];
    [diagramView release];
    self.genCount = 0;
    self.currentAmps = 0;
    
    //set up generator display 
    GeneratorDisplay *genView = [[GeneratorDisplay alloc] initWithFrame: CGRectMake(0.0, 220.0, 320.0, 140.0)];
    self.generatorDisplay = genView;
    [self.view addSubview: generatorDisplay];
    [genView release];
    
    
    //setup for all animated line contactors
    
    LineContactorOrientationUp *contactor = [[LineContactorOrientationUp alloc] initWithFrame: CGRectMake(109.0, 67.0, 20.0, 2.0)];
    btc1 = contactor;
    [self.view addSubview: btc1];
    [contactor release];
    
    LineContactorOrientationUp *contactor2 = [[LineContactorOrientationUp alloc] initWithFrame: CGRectMake(197.0, 67.0, 20.0, 2.0)];
    btc2 = contactor2;
    [self.view addSubview: btc2];
    [contactor2 release];
    
    LineContactorOrientationUp *contactor3 = [[LineContactorOrientationUp alloc] initWithFrame: CGRectMake(153.0, 209.0, 20.0, 2.0)];
    eic = contactor3;
    [self.view addSubview: eic];
    [contactor3 release];
    
    LineContactorOrientationLeft *contactor4 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(38.0, 131.0, 2.0, 20.0)];
    sbc1 = contactor4;
    [self.view addSubview: sbc1];
    [contactor4 release];
    
    LineContactorOrientationRight *contactor5 = [[LineContactorOrientationRight alloc] initWithFrame: CGRectMake(285.0, 131.0, 2.0, 20.0)];
    sbc2 = contactor5;
    [self.view addSubview: sbc2];
    [contactor5 release];
    
    
    LineContactorOrientationLeft *contactor6 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(83.0, 88.0, 2.0, 16.0)];
    bc1 = contactor6;
    [self.view addSubview: bc1];
    [contactor6 release];
    
    LineContactorOrientationRight *contactor7 = [[LineContactorOrientationRight alloc] initWithFrame: CGRectMake(222.0,  88.0, 2.0, 16.0)];
    bc2 = contactor7;
    [self.view addSubview: bc2];
    [contactor7 release];
    
    LineContactorOrientationLeft *contactor8 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(92.0, 132.0, 2.0, 14.0)];
    bbc1 = contactor8;
    [self.view addSubview: bbc1];
    [contactor8 release];
    
    LineContactorOrientationLeft *contactor9 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(40.0, 50.0, 2.0, 13.0)];
    glc1 = contactor9;
    [self.view addSubview: glc1 ];
    [contactor9 release];
    
    LineContactorOrientationLeft *contactor10 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(235.0, 50.0, 2.0, 13.0)];
    glc2 = contactor10;
    [self.view addSubview: glc2];
    [contactor10 release];
    
    LineContactorOrientationLeft *contactor11 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(77.0, 50.0, 2.0, 13.0)];
    glc3 = contactor11;
    [self.view addSubview: glc3 ];
    [contactor11 release];
    
    LineContactorOrientationLeft *contactor12 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(274.0, 50.0, 2.0, 13.0)];
    glc4 = contactor12;
    [self.view addSubview: glc4];
    [contactor12 release];
    
    LineContactorOrientationLeft *contactor13 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(156.0, 50.0, 2.0, 13.0)];
    alc = contactor13;
    [self.view addSubview: alc];
    [contactor13 release];
    
    LineContactorOrientationRight *contactor14 = [[LineContactorOrientationRight alloc] initWithFrame: CGRectMake(175.0, 50.0, 2.0, 13.0)];
    asc = contactor14;
    [self.view addSubview: asc];
    [contactor14 release];
    
    LineContactorOrientationRight *contactor15 = [[LineContactorOrientationRight alloc] initWithFrame: CGRectMake(159.0, 86.0, 2.0, 11.0)];
    gpc = contactor15;
    [self.view addSubview: gpc];
    [contactor15 release];
    
    
    LineContactorOrientationRight *contactor16 = [[LineContactorOrientationRight alloc] initWithFrame: CGRectMake(72.0, 160.0, 2.0, 16.0)];
    ebc1 = contactor16;
    [self.view addSubview: ebc1];
    [contactor16 release];
    
    LineContactorOrientationLeft *contactor17 = [[LineContactorOrientationLeft alloc] initWithFrame: CGRectMake(249.0, 160.0, 2.0, 16.0)];
    ebc2 = contactor17;
    [self.view addSubview: ebc2];
    [contactor17 release];  


    //Generator Symbol setup
    GeneratorSymbol *gen1 = [[GeneratorSymbol alloc] initWithFrame: CGRectMake(32.0, 15.0, 30.0, 30.0)];
    self.generator1 = gen1;
    self.generator1.delegate = self;
    [self.view addSubview: generator1];
    [gen1 release];
    
    GeneratorSymbol *gen2 = [[GeneratorSymbol alloc] initWithFrame: CGRectMake(228.0, 15.0, 30.0, 30.0)];
    self.generator2 = gen2;
    self.generator2.delegate = self;
    [self.view addSubview: generator2];
    [gen2 release];
    
    GeneratorSymbol *gen3 = [[GeneratorSymbol alloc] initWithFrame: CGRectMake(69.0, 15.0, 30.0, 30.0)];
    self.generator3 = gen3;
    self.generator3.delegate = self;
    [self.view addSubview: generator3];
    [gen3 release];
    
    GeneratorSymbol *gen4 = [[GeneratorSymbol alloc] initWithFrame: CGRectMake(266.0, 15.0, 30.0, 30.0)];
    self.generator4 = gen4;
    self.generator4.delegate = self;
    [self.view addSubview: generator4];
    [gen4 release];
    
    GeneratorSymbol *apuGen = [[GeneratorSymbol alloc] initWithFrame: CGRectMake(147.0, 15.0, 30.0, 30.0)];
    self.apuGenerator = apuGen;
    self.apuGenerator.delegate = self;
    [self.view addSubview: apuGenerator];
    [apuGen release];

    /*
    //backToMainMenuButton setup
    backToMainMenuButton = [UIButton buttonWithType: UIButtonTypeCustom];
    backToMainMenuButton.frame = CGRectMake(3.0, 0.0, 28.0, 41.0);
    backToMainMenuButton.opaque = YES;
    [backToMainMenuButton setBackgroundImage: [UIImage imageNamed: @"ArrowTab.png"] forState: UIControlStateNormal];
    [backToMainMenuButton addTarget: self action: @selector(backToMainMenu) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: backToMainMenuButton];
     */
    
    
    
    //buttonPad setup: placed @ bottom of screen, displayed upon pressing "Control" button.
    
    ButtonPad *customPad = [[ButtonPad alloc] initWithFrame: CGRectMake(0.0, 337.0, 320.0, 300.0)];
    self.buttonPad = customPad;
    
    //buttonConfig is set to buttonConfig1 so that the viewController knows that the buttonPad loads in the default configuration
    //this configuration can be changed by pressing the buttonChanger button which will load different buttons.
    //the constant tracks the current configuration.
    
    buttonConfig = buttonConfig1;
    [buttonPad.button1 addTarget: self action: @selector(backToMainMenu) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button2 addTarget: self action: @selector(coldAirplane:) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button3 addTarget: self action: @selector(batteriesAuto:) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button4 addTarget: self action: @selector(apuStartWithBatteries:) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button5 addTarget: self action: @selector(allGensOn:) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button6 addTarget: self action: @selector(gen1Fail:) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button7 addTarget: self action: @selector(gen2Fail:) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button8 addTarget: self action: @selector(gen3Fail:) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button9 addTarget: self action: @selector(gen4Fail:) forControlEvents: UIControlEventTouchUpInside];
    [buttonPad.button10 addTarget: self action: @selector(buttonChanger:) forControlEvents: UIControlEventTouchUpInside];
    
    //specific buttons are disabled on startup because the airplane loads in the cold configuration
    
    buttonPad.button2.enabled = NO; //disables cold airplane button - airplane is CURRENTLY in coldAirplane config
    buttonPad.button4.enabled = NO; //disables start APU button
    buttonPad.button5.enabled = NO; //disables allGensOn button
    buttonPad.button6.enabled = NO; //disables gen1 fail button
    buttonPad.button7.enabled = NO; //disables gen2 fail button
    buttonPad.button8.enabled = NO; //disables gen3 fail button
    buttonPad.button9.enabled = NO; //disables gen4 fail button
    
    [self.view addSubview: buttonPad];
    [customPad release];
    buttonPad.isDisplayed = YES;
}

-(void)backToMainMenu {
    [delegate didRequestMainMenu: self];
}



#pragma mark -
#pragma mark - Generator Count and Timer Methods

-(void)decrementBatteryVoltage:(NSTimer *)timer {
    float const targetLowVoltage = -0.0;
    float decrement = 0.1;
    if(generatorDisplay.battVoltage > targetLowVoltage) {
        [generatorDisplay setBattVoltage: (generatorDisplay.battVoltage -= decrement)];
    }
    
    NSString *battVoltageString = [[NSString alloc ] initWithFormat: @"%.1f", generatorDisplay.battVoltage];
    generatorDisplay.battery1Voltage.text = battVoltageString;
    generatorDisplay.battery2Voltage.text = battVoltageString;
   
    
    NSString *lowVoltageString = [[NSString alloc] initWithFormat: @"%.1f", targetLowVoltage];
    if([lowVoltageString isEqualToString: battVoltageString]) {
        //NSLog(@"Batt Voltage reached Target");
        [timer invalidate];
        timer = nil;
        [electricalSystemDiagramView depowerAllBuses];
    }
    
     [lowVoltageString release];
     [battVoltageString release];
    
        
}


-(void)incrementBatteryVoltage:(NSTimer *)timer {
    float const targetChargedVoltage = 24.0;
    float increment = 0.1;
    if(generatorDisplay.battVoltage < targetChargedVoltage) 
        generatorDisplay.battVoltage += increment;
    
    NSString *battVoltageString = [[NSString alloc ] initWithFormat: @"%.1f", generatorDisplay.battVoltage];
    generatorDisplay.battery1Voltage.text = battVoltageString;
    generatorDisplay.battery2Voltage.text = battVoltageString;
    [battVoltageString release];
    if(generatorDisplay.battVoltage == targetChargedVoltage) {
        [timer invalidate];
        timer = nil;
    }
    
}



-(void)setGenCount:(NSUInteger)aCount {
    genCount = aCount;
    
    
    //if the increment or decrement timer is valid, it will be invalidated so that there aren't multiple instances of the timer running or attempting to counterract the other.
    if([decrementTimer isValid]) {
        [self.decrementTimer invalidate];
        self.decrementTimer = nil;
    }

    
    if([incrementTimer isValid]) {
        [self.incrementTimer invalidate];
        self.incrementTimer = nil;
    }
    
    
    
    //sets Voltage & Amps
    
    
    if (self.genCount == 5 ) {
        if(!elecEmerAbnormConfig) 
            [self setGeneratorAmps: 80];
        if(elecEmerAbnormConfig) {
            [self setGeneratorAmps: 50];
        }

    }
    else if (self.genCount == 4) {
        if(!elecEmerAbnormConfig) 
            [self setGeneratorAmps: 100];
        if(elecEmerAbnormConfig)
            [self setGeneratorAmps: 50];
    }
        
    else if (self.genCount == 3) {
        if(!elecEmerAbnormConfig)
            [self setGeneratorAmps: 134];
        if(elecEmerAbnormConfig)
            [self setGeneratorAmps: 100]; // opposite side bus needs Amps set to 50
    }
    else if (self.genCount == 2) {
        if(!elecEmerAbnormConfig)
            [self setGeneratorAmps: 200];
        if(elecEmerAbnormConfig)
            [self setGeneratorAmps: 200]; // although this number is the same, the method is set to avoid future problems.
    }
    
    else if (self.genCount == 1) {
        if(!elecEmerAbnormConfig)
            [self setGeneratorAmps: 400];
        if(elecEmerAbnormConfig)
            [self setGeneratorAmps: 400];
    }
    
    else if (self.genCount == 0) {
        [self setGeneratorAmps: 0];
        if(airplaneIsInAir == YES) {
            essPwrConfig = YES;
        }
        
    }
       
    //determines if shed bus should be powered
    if (self.genCount <= 2 && !gpuSelected && !elecEmerAbnormConfig && !elecEssXfrFailConfig) {
        [electricalSystemDiagramView depowerShedBuses];
        [electricalSystemDiagramView powerElevenBusesA];
    }
    else if (self.genCount >=3 && !gpuSelected && !elecEmerAbnormConfig)
        [electricalSystemDiagramView powerShedBuses];
    
    
       
    //sets voltage on batteries: allows them to charge or discharge as necessary.
    if (self.genCount == 0 && !gpuSelected) {
            if(essPwrConfig && !elecEssXfrFailConfig) {
            interval = 8.0;
        }
        
        if(!essPwrConfig || elecEssXfrFailConfig) {
            interval = 2.0;
        }
            
        
            self.decrementTimer = [NSTimer scheduledTimerWithTimeInterval: interval 
                                                           target: self 
                                                         selector:@selector(decrementBatteryVoltage:) 
                                                         userInfo: nil 
                                                          repeats: YES];
        
    }
    
    if (self.genCount > 0 && !gpuSelected) {
            self.incrementTimer = [NSTimer scheduledTimerWithTimeInterval: 2.0 
                                                          target: self 
                                                        selector:@selector(incrementBatteryVoltage:) 
                                                        userInfo: nil 
                                                         repeats: YES]; 
        
    }
    
    //elecEmerAbnormal is a special case where the airplane can have more than one generator online but yet be in ess power config.
    //the batteries are powering the ESS buses only.
    //in this case, the battery voltage decrements 0.1 every 8 seconds, however, DC & shed buses may still be energized.
    //3.30.10 added a check for status of apuGenerator. Batteries will only decrement @ the ess rate if the apu isn't running.
    
    if(airplaneIsInAir && elecEmerAbnormConfig && essPwrConfig && (apuGenerator.isPowered == NO)) {
        //NSLog(@"SetGenCount: Electrical Emergency Abnormal conditions met");
        
    
        //added timer invalidation 3.30.10.  increment timer must be invalidated because it's conditions are also met.  
        //However, we cannot add (!elecEmerAbnormConfig) to the above if statement because we must allow the batteries to charge if the APU is started
        //in elecEmerAbnormConfig.
        
        if([incrementTimer isValid]) {
            [self.incrementTimer invalidate];
            self.incrementTimer = nil;
        }
        
        self.decrementTimer = [NSTimer scheduledTimerWithTimeInterval: 8.0 
                                                               target: self 
                                                             selector:@selector(decrementBatteryVoltage:) 
                                                             userInfo: nil 
                                                              repeats: YES];
        
    }
}



-(NSUInteger)genCount{
    return genCount;
}


-(void)setAllAmpIndicationsToZero {
    generatorDisplay.gen1A = 0;
    generatorDisplay.gen2A = 0;
    generatorDisplay.gen3A = 0;
    generatorDisplay.gen4A = 0;
    generatorDisplay.genApuA = 0;
}


//this method is called inside of the setGenCount method to set amps apropriately.  It is predicated off of the number of generators running.
//additionally, there are special cases such as elecEssXfrFail & elecEmerAbnorm that will require different values.
//reference the setGenerator(1-4, & APU)AmpsToTarget for more details.

-(void)setGeneratorAmps: (int)amps {
        self.targetAmps = amps;
    
    //just as in the set genCount method, any timer that is valid will be invalidated at the begining of this function to prevent multiple and/or conflicting timers.
    if([gen1AmpUpTimer isValid]) {
        [self.gen1AmpUpTimer invalidate];
        self.gen1AmpUpTimer = nil;
    }
    
    if([gen1AmpDownTimer isValid]) {
        [self.gen1AmpDownTimer invalidate];
        self.gen1AmpDownTimer = nil;
    }
    
    if([gen2AmpUpTimer isValid]) {
        [self.gen2AmpUpTimer invalidate];
        self.gen2AmpUpTimer = nil;
    }
    
    if([gen2AmpDownTimer isValid]) {
        [self.gen2AmpDownTimer invalidate];
        self.gen2AmpDownTimer = nil;
    }
    
    if([gen3AmpUpTimer isValid]) {
        [self.gen3AmpUpTimer invalidate];
        self.gen3AmpUpTimer = nil;
    }
    
    if([gen3AmpDownTimer isValid]) {
        [self.gen3AmpDownTimer invalidate];
        self.gen3AmpUpTimer = nil;
    }
    
    if([gen4AmpUpTimer isValid]) {
        [self.gen4AmpUpTimer invalidate];
        self.gen4AmpUpTimer = nil;
    }
    
    if([gen4AmpDownTimer isValid]) {
        [self.gen4AmpDownTimer invalidate];
        self.gen4AmpDownTimer = nil;
    }
    
    if([apuAmpUpTimer isValid]) {
        [self.apuAmpUpTimer invalidate];
        self.apuAmpDownTimer = nil;
    }
    
    if([apuAmpDownTimer isValid]) {
        [self.apuAmpDownTimer invalidate];
        self.apuAmpDownTimer = nil;
    }
    
    
    if(generator1.isPowered == YES) {

        self.gen1AmpUpTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setGenerator1AmpsIndicationToTarget:) 
                                       userInfo: nil 
                                        repeats: YES]; 
        
        
        }
    
    else if(generator1.isPowered == NO) {
        self.gen1AmpDownTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setGenerator1AmpsIndicationToZero:) 
                                       userInfo: nil 
                                        repeats: YES];
    }
    
    if(generator2.isPowered == YES) {

        self.gen2AmpUpTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setGenerator2AmpsIndicationToTarget:) 
                                       userInfo: nil 
                                        repeats: YES]; 

    }
    else if(generator2.isPowered == NO) {
        self.gen2AmpDownTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setGenerator2AmpsIndicationToZero:) 
                                       userInfo: nil 
                                        repeats: YES];
    }

    if(generator3.isPowered == YES) {

        self.gen3AmpUpTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setGenerator3AmpsIndicationToTarget:) 
                                       userInfo: nil 
                                        repeats: YES]; 

    }
    else if(generator3.isPowered == NO) {
        self.gen3AmpDownTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setGenerator3AmpsIndicationToZero:) 
                                       userInfo: nil 
                                        repeats: YES];
    }

    if(generator4.isPowered == YES) {

        self.gen4AmpUpTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setGenerator4AmpsIndicationToTarget:) 
                                       userInfo: nil 
                                        repeats: YES]; 

    }
    else if(generator4.isPowered == NO) {
        self.gen4AmpDownTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setGenerator4AmpsIndicationToZero:) 
                                       userInfo: nil 
                                        repeats: YES]; 
    }

    if(apuGenerator.isPowered == YES) {
        self.apuAmpUpTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setApuAmpsIndicationToTarget:) 
                                       userInfo: nil 
                                        repeats: YES]; 

    }
    else if(apuGenerator.isPowered == NO) {
              self.apuAmpDownTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 
                                         target: self 
                                       selector:@selector(setApuAmpsIndicationToZero:) 
                                       userInfo: nil 
                                        repeats: YES]; 
    }
}


-(void)setGenerator1AmpsIndicationToTarget:(NSTimer *)timer {
    
    int increment = 10;
    int target;
    if(elecEmerAbnormConfig) {
        if(generator3.isPowered == YES) 
            target = 50;  //if gen 3 is powered (same side DC) the amp load is 50
        if(generator3.isPowered == NO)
            target = targetAmps;  //if gen 3 isn't powered, gen1 amps must bear the entire load. (should be passed a value 100)
    }
    
    if(!elecEmerAbnormConfig) 
        target = targetAmps;
    
    if (generatorDisplay.gen1A < target) {
        generatorDisplay.gen1A += increment;
        [generatorDisplay.generator1Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen1A]] ;
    }
    
    if (generatorDisplay.gen1A > target) {
        generatorDisplay.gen1A -= increment;
        [generatorDisplay.generator1Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen1A]];
    }
    
    if(generatorDisplay.gen1A == target) {
        [timer invalidate];
        timer = nil;
    }
}
    

-(void)setGenerator1AmpsIndicationToZero:(NSTimer *)timer {
    
    int zero = 0;
    int decrement = 10;
    if (generatorDisplay.gen1A > zero) {
        generatorDisplay.gen1A -= decrement;
        [generatorDisplay.generator1Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen1A]];
    }
    
    if(generatorDisplay.gen1A == zero) {
        [timer invalidate];
        timer = nil;
    }
    
}


-(void)setGenerator2AmpsIndicationToTarget:(NSTimer *)timer {

    int increment = 10;
    int target;
    if(elecEmerAbnormConfig) {
        if(generator4.isPowered == YES) 
            target = 50;  //if gen 4 is powered (same side DC) the amp load is 50
        if(generator4.isPowered == NO)
            target = targetAmps;  //if gen 4 isn't powered, gen1 amps must bear the entire load. (should be passed a value 100)
    }
    
    if(!elecEmerAbnormConfig) 
        target = targetAmps;
    
    if (generatorDisplay.gen2A < target) {
        generatorDisplay.gen2A += increment;
        [generatorDisplay.generator2Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen2A]] ;
    }
    
    if (generatorDisplay.gen2A > target) {
        generatorDisplay.gen2A -= increment;
        [generatorDisplay.generator2Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen2A]];
    }
    
    if(generatorDisplay.gen2A == target) {
        [timer invalidate];
        timer = nil;
    }
    
       
}




-(void)setGenerator2AmpsIndicationToZero:(NSTimer *)timer {
    
    int zero = 0;
    int decrement = 10;
    if (generatorDisplay.gen2A > zero) {
        generatorDisplay.gen2A -= decrement;
        [generatorDisplay.generator2Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen2A]];
    }
    
    if(generatorDisplay.gen2A == zero) {
        [timer invalidate];
        timer = nil;
    }
    
}

-(void)setGenerator3AmpsIndicationToTarget:(NSTimer *)timer {
    

    int increment = 10;
    int target;
    if(elecEmerAbnormConfig) {
        if(generator1.isPowered == YES) 
            target = 50;  //if gen 1 is powered (same side DC) the amp load is 50
        if(generator1.isPowered == NO)
            target = targetAmps;  //if gen 1 isn't powered, gen1 amps must bear the entire load. (should be passed a value 100)
    }
    
    if(!elecEmerAbnormConfig)
        target = targetAmps;
    
    if (generatorDisplay.gen3A < target) {
        generatorDisplay.gen3A += increment;
        [generatorDisplay.generator3Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen3A]] ;
    }
    
    if (generatorDisplay.gen3A > target) {
        generatorDisplay.gen3A -= increment;
        [generatorDisplay.generator3Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen3A]];
    }
    
    if(generatorDisplay.gen3A == target) {
        [timer invalidate];
        timer = nil;
    }
    
}


-(void)setGenerator3AmpsIndicationToZero:(NSTimer *)timer {
    
    int zero = 0;
    int decrement = 10;
    if (generatorDisplay.gen3A > zero) {
        generatorDisplay.gen3A -= decrement;
        [generatorDisplay.generator3Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen3A]];
    }
    
    if(generatorDisplay.gen3A == zero) {
        [timer invalidate];
        timer = nil;
    }
    
}

-(void)setGenerator4AmpsIndicationToTarget:(NSTimer *)timer {
   
    int increment = 10;
    int target;
    if(elecEmerAbnormConfig) {
        if(generator2.isPowered == YES) 
            target = 50;  //if gen 2 is powered (same side DC) the amp load is 50
        if(generator2.isPowered == NO)
            target = targetAmps;  //if gen 2 isn't powered, gen1 amps must bear the entire load. (should be passed a value 100)
    }
    
    if(!elecEmerAbnormConfig) 
        target = targetAmps;
    
    if (generatorDisplay.gen4A < target) {
        generatorDisplay.gen4A += increment;
         [generatorDisplay.generator4Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen4A]];
    }
    
    if (generatorDisplay.gen4A > target) {
        generatorDisplay.gen4A -= increment;
         [generatorDisplay.generator4Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen4A]];
    }
    
    if(generatorDisplay.gen4A == target) {
        [timer invalidate];
        timer = nil;
    }
}


-(void)setGenerator4AmpsIndicationToZero:(NSTimer *)timer {
    
    int zero = 0;
    int decrement = 10;
    if (generatorDisplay.gen4A > zero) {
        generatorDisplay.gen4A -= decrement;
        [generatorDisplay.generator4Amps setText: [NSString stringWithFormat: @"%i", generatorDisplay.gen4A]];
    }
    
    if(generatorDisplay.gen4A == zero) {
        [timer invalidate];
        timer = nil;
    }
    
}


-(void)setApuAmpsIndicationToTarget:(NSTimer *)timer {
    int increment = 10;
    int target;
    if (!elecEmerAbnormConfig)
        target = targetAmps;
    if (elecEmerAbnormConfig)
        target = 400;
    if (generatorDisplay.genApuA < target) {
        generatorDisplay.genApuA += increment;
        [generatorDisplay.apuAmps setText: [NSString stringWithFormat: @"%i", generatorDisplay.genApuA]];
    }
    
    if (generatorDisplay.genApuA > target) {
        generatorDisplay.genApuA -= increment;
        [generatorDisplay.apuAmps setText: [NSString stringWithFormat: @"%i", generatorDisplay.genApuA]];
    }
    
    if(generatorDisplay.genApuA == target) {
        [timer invalidate];
        timer = nil;
        [self enableAPUButton];

    }
    
}



-(void)setApuAmpsIndicationToZero:(NSTimer *)timer {
    
    int zero = 0;
    int decrement = 10;
    if (generatorDisplay.genApuA > zero) {
        generatorDisplay.genApuA -= decrement;
        [generatorDisplay.apuAmps setText: [NSString stringWithFormat: @"%i", generatorDisplay.genApuA]];
    }
    
    if(generatorDisplay.genApuA == zero) {
        [generatorDisplay.apuAmps setText: @""];
        [generatorDisplay hideApuIndication];
        [timer invalidate];
        timer = nil;
        [self enableAPUButton];

    }
    
}





#pragma mark -
#pragma mark - Electrical System Control Methods

//          //  
// TODO:    
//          //

////////////////////////////////////////////////////////
/*Key:
 C = complete
 OPEN = no work toward completion of issue started
 IP = work has begun on the issue
 */


// C // disable APU button until apu is COMPLETELY Started or stopped.
// C // Main menu button should contain an arrow pointing up&left instead of just horizontal Left. 
// C // decide what to do with blank button on secondary button pad display - 3/15/2010, chargeBatteries.
// C // ELEC Ess XFR A-B-A button pressed sequence causes APU voltage to briefly appear) 3/15/2010.  Removed apuVoltage object from enumerator array.  This was causing the voltage to momentarily be set to zero.
// C // all gens fail EPC button should be disabled with batteries off. 3/15/2010. buttonChanger method. Checks (self.genCount == 0).
// C // battery drain should allow for all buses to be depowered (hot bus 1, 2, backup hot) 3/14/2010.  Changed decrementBatteryVoltage to [string isEqualToString] instead of compairing two floats.
// C // Selecting GPU after starting APU causes batteries to continue charging, the batteries should STOP charging.
// C // GPU selected, essPowrConfig == YES, ...batteries are still decrementing @ essPwr rate (8.0).
// C //Decide if each "scenario" needs an info pull-Down to explain, this will probably take up too much memory.  Explanations are provided in the user manual
// C // air/ground logic needs an alternate display to clarify what mode is set.  The button title changing by itself is ambiguous.  //explained in user manual
// C // GPU selected, Amps should == 0. No... they shouldn't, they should display available amps. Decided against this. Hopefully I'm not wrong.
// C // move top buttons to buttonPad? - GPU, air/ground logic buttons moved to button pad. Still need separate button to display the buttonPad. decided against this.  
// C // consider designing learning scenarios to guide users through a review of the system through procedure. - found in user manual
// C //Decide if this view needs a wrapper load Screen that appears on start-up and hides when user wants to begin interaction with diagram. // -voidloadAllComponents
// C //move majority of view did load to separate method. -(void)loadInteractiveDiagram: ? (lazy loading adherence?) moved to loadAllComponents.
// C // elecEmerAbnormal = when both same side gens on a DC bus are de-energized, the bus should be depowered (btc's are open) - added to elecEmerAbnorm method & elecsysDigramView.m
// C // elecEmerAbnormal = not setting essential power timer appropriately. -/11/2010. special case checks for this.
// C //Decide if Elec Ess Xfr Fail needs more scenario choices since it is multi-dimensional (multiple configs possible) - A & B scenario avail 2/09/2010
// C // bringing a generator online should enable the All Gens Fail button
// C // three configs possible for a generator Symbol: normal, depowered, abnormal.  Enumerated data type.
// C // elec emerg abnormal: If in abnormal mode, sheds should still be powered. 
// C // devise gen voltage load depending on gens avail. 2/4/2010
// C // disable the appropriate buttons while the amp Timers are running. - Doesn't appear to be an issue 2/5/2010.
// C // custom cell drawing set to Opaque
// C // Added gaussian blur to all green generator symbols
// C // timer should be slower for decrementing battery voltage in ess power
// C // Background image now backed as a subclass of UIView.  Proceed with DCBus symbol implementaiton
// C // gpu indication should be hidden when in air.
// C // when all generators are depowered and on GND, the btcs do NOT configure themselves appropriately.  Ground Logic needed? -Not yet, new "||" statements check for this.
// C // implement "start engines" button - Logic implementation should be delayed until a subsequent release version
// C // buttonChanger should check for GPU selection for button title. -1/12/2010
// C // Gen 2 Reset enabled spuriously, isolate this scenario - 1/12/2010
// C // startAPU appearing when apu is already started, isolate this scenario. -1/12/2010
// C //GPU functionality, switch placement? - 1/12/2010.  
// C // add boolean for air/gnd logic (fix stopAPU: method) - 1/12/2010
// C //Some buttons require a reset, such as Gen 1 Fail -> Gen 1 Reset, etc. -  DONE .implemented 12/29/2009:
// C //Finish implementation of runAbnormalLogic: method - DONE 12/31/2009
// C //Decide which methods need to call runAbnormalLogic: - DONE 12/31/2009
// C //Does bc1 close during APu start if other gens r running? -YES, appears to close in all scenarios.
// C //Set new booleans for (all gens off scenario - BOOl essentialPowerConfig) - gen fail buttons shuold change to gen reset. 
// C //Ebcs need to open when gen resets out of essential pwr. Check booleans first?

///////////////////////////////////////////////////////
//Deprecated 3/9/2010. This method was used to display and hide button Pad.
/*
-(IBAction)showOptions:(id)sender {
    if (buttonPad.isDisplayed == NO) {
        [buttonPad slideUp];
        }
    
    else if (buttonPad.isDisplayed == YES) {
        [buttonPad slideDown];
    }
}
 */



//NOTE: all buttons must have their targets removed, vice an accrual of multiple targets per control. (UIButton(s)).

-(IBAction)buttonChanger:(id)sender {
    if (buttonConfig == buttonConfig1) {
        
        [buttonPad.button3 setTitle: @"All Gens Fail EPC" forState: UIControlStateNormal];
        
        if(elecEssXfrFailButtonTitle == title1) {
            [buttonPad.button4 setTitle: @"Elec Ess Xfr Fail A" forState: UIControlStateNormal];
            [buttonPad.button4 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button4 addTarget: self action: @selector(elecEssXfrFailOption1:) forControlEvents: UIControlEventTouchUpInside];
        }
        
        if(elecEssXfrFailButtonTitle == title2) {
            [buttonPad.button4 setTitle: @"Elec Ess Xfr Fail B" forState: UIControlStateNormal];
            [buttonPad.button4 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button4 addTarget: self action: @selector(elecEssXfrFailOption2:) forControlEvents: UIControlEventTouchUpInside];
        }
                
        [buttonPad.button5 setTitle: @"Elec Emer Abnorm" forState: UIControlStateNormal];
        if (gpuAvailable == NO) {
            [buttonPad.button6 setTitle: @"Start GPU" forState: UIControlStateNormal];
        }
        else if (gpuAvailable == YES) {
            [buttonPad.button6 setTitle: @"Stop  GPU" forState: UIControlStateNormal];
        }
        if (gpuSelected == NO) {
            [buttonPad.button7 setTitle: @"Select GPU" forState: UIControlStateNormal];
        }
        else if (gpuSelected == YES) {
            [buttonPad.button7 setTitle: @"Deselect GPU" forState: UIControlStateNormal];
        }
        
        if(airplaneIsInAir) {
            [buttonPad.button8 setTitle: @"Air Logic" forState: UIControlStateNormal];
        }
        else if(!airplaneIsInAir) {
            [buttonPad.button8 setTitle: @"Ground Logic" forState: UIControlStateNormal];
        }
        [buttonPad.button9 setTitle: @"Charge Batteries" forState: UIControlStateNormal];
        [buttonPad.button10 setTitle: @"← Back" forState: UIControlStateNormal];

        [buttonPad.button3 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button5 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button6 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button7 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button8 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        
        [buttonPad.button3 addTarget: self action: @selector(lossOfAllGens:) forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button5 addTarget: self action: @selector(elecEmerAbnorm:) forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button6 addTarget: self action: @selector(startGPU:) forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button7 addTarget: self action: @selector(gpuSelection:) forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button8 addTarget: self action: @selector(setAirGroundLogic:) forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button9 addTarget: self action: @selector(chargeBatteries) forControlEvents: UIControlEventTouchUpInside];
        
        
       
        if (onBatteries == YES) {
            if(self.genCount == 4) {
                //air/ground logic button
                buttonPad.button8.enabled = YES;
            }
            else if (self.genCount < 4 && !elecEssXfrFailConfig && (airGroundButtonTitle == title1)) {
                //air/grond logic button
                buttonPad.button8.enabled = NO;
            }
        }
            
        //if apu generator is depowered, this button is disabled.
        
        if (apuGenerator.isPowered == YES) {                
            [buttonPad.button2 setTitle: @"A.P.U. Gen Fail" forState: UIControlStateNormal];
            [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button2 addTarget: self action: @selector(apuGenFail:) forControlEvents: UIControlEventTouchUpInside];
        }
        
        else if (apuGenerator.generatorStatus == depowered) {
            [buttonPad.button2 setTitle: @"A.P.U. Gen Fail" forState: UIControlStateNormal];
            [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button2 addTarget: self action: @selector(apuGenFail:) forControlEvents: UIControlEventTouchUpInside];
            buttonPad.button2.enabled = NO; 
        }
        
        else if (apuGenerator.generatorStatus == abnormal) {
            [buttonPad.button2 setTitle: @"A.P.U Gen Reset" forState: UIControlStateNormal];
            [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button2 addTarget: self action: @selector(resetApuGen:) forControlEvents: UIControlEventTouchUpInside];
            
        }
        
    //if no generators are powered, these buttons are disabled.
        if ((generator1.isPowered == NO) && 
             (generator2.isPowered == NO) && 
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) && 
            (apuGenerator.isPowered == NO)) {
            buttonPad.button3.enabled = NO; //all gens fail button 
            buttonPad.button4.enabled = NO; //elec ess xfr fail
            buttonPad.button5.enabled = NO; //elec emer abnorm
        }
         
         
         
        
        //if all gens are on, these buttons are enabled
        if (allGensAreOn == YES) {
            buttonPad.button3.enabled = YES; //all gens fail EPC button
            buttonPad.button4.enabled = YES; //elec ess xfr fail
            buttonPad.button5.enabled = YES; //elec emer abnorm
        }
        
        if(essPwrConfig == YES) {
            buttonPad.button3.enabled = NO;  // all gens fail EPC button
            buttonPad.button4.enabled = NO;  // elec ess xfr fail
            buttonPad.button5.enabled = NO;  // elec emer abnorm
        }
        
        if(elecEssXfrFailConfig == YES) {
            buttonPad.button3.enabled = NO;  //all gens EPC fail
            buttonPad.button4.enabled = YES; //elec ess xfr fail
            buttonPad.button5.enabled = NO;  //elec emer abnormal
        }
        
        if(elecEmerAbnormConfig == YES) {
            buttonPad.button6.enabled = NO;
        }
        

        
        //switching buttonConfigs requires re-enablement of start/stopGPU button
        buttonPad.button6.enabled = YES;
        
        if(airplaneIsInAir == YES) {
            buttonPad.button6.enabled = NO; //start stop gpu button
            buttonPad.button7.enabled = NO; //gpu selection
        }
        
        if(airplaneIsInAir == NO) {
            buttonPad.button4.enabled = NO; //elec ess xfr fail button
            buttonPad.button5.enabled = NO;  // elec emer abnormal button
        }
        
        
        //if @ least one generator is online, the All Gens fail button should be enabled.
        if(self.genCount == 1) {
            buttonPad.button3.enabled = YES; //all gens fail epc button
        }
        
        
        //added 3/15/2010  enabling of batteries auto caused this button to be enabled.
        if(self.genCount == 0) {
            buttonPad.button3.enabled = NO; //all gens fail epc button.
        }
        
        //if the gpu is unavail, these buttons are disabled
        
        if (gpuAvailable == NO) {
            buttonPad.button7.enabled = NO; 
        }
        else if(gpuAvailable == YES) {
           
            if(onBatteries) {
                buttonPad.button7.enabled = YES;
            }
            buttonPad.button8.enabled = NO;
        }
         
        buttonPad.button9.enabled = YES; //charge batteries button
             
        //notifies the view controller that the button config is on the second display of buttons
        buttonConfig = buttonConfig2;
        
    }
    
    else {
        
        [buttonPad.button2 setTitle: @"Cold Airplane" forState: UIControlStateNormal];
        [buttonPad.button3 setTitle: @"Batteries Auto" forState: UIControlStateNormal];
        if (apuGenerator.isPowered == NO) {
            [buttonPad.button4 setTitle: @"Start A.P.U." forState: UIControlStateNormal];
        }
        else if(apuGenerator.isPowered == YES) {
            [buttonPad.button4 setTitle: @"Stop A.P.U." forState: UIControlStateNormal];
        }
        [buttonPad.button5 setTitle: @"All Gens On" forState: UIControlStateNormal];
        
        [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button3 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button4 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button5 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        
        [buttonPad.button2 addTarget: self action: @selector(coldAirplane:) forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button3 addTarget: self action: @selector(batteriesAuto:) forControlEvents: UIControlEventTouchUpInside];
        if (apuGenerator.isPowered == NO) {
            [buttonPad.button4 addTarget: self action: @selector(apuStartWithBatteries:) forControlEvents: UIControlEventTouchUpInside];
        }
        else if (apuGenerator.isPowered == YES) {
            [buttonPad.button4 addTarget: self action: @selector(stopApu:) forControlEvents: UIControlEventTouchUpInside];
        }
        [buttonPad.button5 addTarget: self action: @selector(allGensOn:) forControlEvents: UIControlEventTouchUpInside];
        
        
        //added 3/15/2010 to compensate for Charge Batteries method.
        [buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        buttonPad.button9.enabled = NO;
        
        //following statements determine various aircraft states.
        
        if (airplaneIsCold == YES) {
            
            //resets gens 1-4
            [self resetGenButtons];
            
            buttonPad.button2.enabled = NO;  //cold airplane button
            buttonPad.button3.enabled = YES;  //batteries auto button
            buttonPad.button4.enabled = NO; //start/stop apu button
            buttonPad.button5.enabled = NO; // all gens on button
            buttonPad.button6.enabled = NO;  //generator 1 fail/reset button
            buttonPad.button7.enabled = NO; // generator 2 fail/reset button
            //NSLog(@"AirplaneIsCold");
        }
        
        if(gpuSelected && !onBatteries) {
            buttonPad.button2.enabled = YES;
        }
        
        
        if(onBatteries == YES) {
            buttonPad.button2.enabled = YES; //cold airplane button
            buttonPad.button3.enabled = NO;  //batteries auto button
            buttonPad.button4.enabled = YES;  //start/stop apu button
            buttonPad.button5.enabled = YES;  //all gens on button
            //NSLog(@"OnBatteries");
            
        }
        
        if(allGensAreOn == YES) {
            buttonPad.button6.enabled = YES;
            buttonPad.button7.enabled = YES;
            buttonPad.button8.enabled = YES;
            buttonPad.button9.enabled = YES;
        }
        
        
        //this process checks if all gens have failed.  If yes, the button titles/selectors change to allow "Reset"
        if(essPwrConfig == YES) {
            [buttonPad.button6 setTitle: @"Gen 1 Reset" forState: UIControlStateNormal];
            [buttonPad.button7 setTitle: @"Gen 2 Reset"forState: UIControlStateNormal];
            [buttonPad.button8 setTitle: @"Gen 3 Reset" forState: UIControlStateNormal];
            [buttonPad.button9 setTitle: @"Gen 4 Reset" forState: UIControlStateNormal];
            
            [buttonPad.button6 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button7 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button8 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            
            [buttonPad.button6 addTarget: self action: @selector(resetGen1:) forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button7 addTarget: self action: @selector(resetGen2:) forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button8 addTarget: self action: @selector(resetGen3:) forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button9 addTarget: self action: @selector(resetGen4:) forControlEvents: UIControlEventTouchUpInside];
            
            buttonPad.button6.enabled = YES;
            buttonPad.button7.enabled = YES;
            buttonPad.button8.enabled = YES;
            buttonPad.button9.enabled = YES;
            
        }
        
        //if airplane isn't in ess power config: check and see whether or not the generator is powered.
        else if ((onBatteries == YES) && (airplaneIsCold == NO)) /*previously, a query was made if any generator was powered here as well */{   
            if (generator1.isPowered == YES) {
                [buttonPad.button6 setTitle: @"Gen 1 Fail" forState: UIControlStateNormal];
                [buttonPad.button6 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button6 addTarget: self action: @selector(gen1Fail:) forControlEvents: UIControlEventTouchUpInside];
            }
            else if (generator1.generatorStatus == abnormal) {
                [buttonPad.button6 setTitle: @"Gen 1 Reset" forState: UIControlStateNormal];
                [buttonPad.button6 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button6 addTarget: self action: @selector(resetGen1:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button6.enabled = YES;
            }
            
            else if (generator1.generatorStatus == depowered) {
                [buttonPad.button6 setTitle: @"Gen 1 Fail" forState: UIControlStateNormal];
                [buttonPad.button6 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button6 addTarget: self action: @selector(gen1Fail:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button6.enabled = NO;
            }
                
                
            
            if(generator2.isPowered == YES) {                
                [buttonPad.button7 setTitle: @"Gen 2 Fail" forState: UIControlStateNormal];
                [buttonPad.button7 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button7 addTarget: self action: @selector(gen2Fail:) forControlEvents: UIControlEventTouchUpInside];
            }
            else if (generator2.generatorStatus == abnormal) {
                [buttonPad.button7 setTitle: @"Gen 2 Reset" forState: UIControlStateNormal];
                [buttonPad.button7 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button7 addTarget: self action: @selector(resetGen2:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button7.enabled = YES;
                
                }
            else if (generator2.generatorStatus == depowered) {
                [buttonPad.button7 setTitle: @"Gen 2 Fail" forState: UIControlStateNormal];
                [buttonPad.button7 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button7 addTarget: self action: @selector(gen1Fail:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button7.enabled = NO;
            }
            
            
            if(generator3.isPowered == YES) {
                [buttonPad.button8 setTitle: @"Gen 3 Fail" forState: UIControlStateNormal];
                [buttonPad.button8 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button8 addTarget: self action: @selector(gen3Fail:) forControlEvents: UIControlEventTouchUpInside];
            }
            else if (generator3.generatorStatus == abnormal) {
                [buttonPad.button8 setTitle: @"Gen 3 Reset" forState: UIControlStateNormal];
                [buttonPad.button8 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button8 addTarget: self action: @selector(resetGen3:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button8.enabled = YES;
                
            }
            
            else if (generator3.generatorStatus == depowered) {
                [buttonPad.button8 setTitle: @"Gen 3 Fail" forState: UIControlStateNormal];
                [buttonPad.button8 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button8 addTarget: self action: @selector(gen1Fail:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button8.enabled = NO;
            }
            
            
            if(generator4.isPowered == YES) {
                [buttonPad.button9 setTitle: @"Gen 4 Fail" forState: UIControlStateNormal];
                [buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button9 addTarget: self action: @selector(gen4Fail:) forControlEvents: UIControlEventTouchUpInside];
            }
            else if (generator4.generatorStatus == abnormal) {
                [buttonPad.button9 setTitle: @"Gen 4 Reset" forState: UIControlStateNormal];
                [buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button9 addTarget: self action: @selector(resetGen4:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button9.enabled = YES;
            }
            
            else if (generator4.generatorStatus == depowered) {
                [buttonPad.button9 setTitle: @"Gen 4 Fail" forState: UIControlStateNormal];
                [buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button9 addTarget: self action: @selector(gen1Fail:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button9.enabled = NO;
            }
        }
        
        
        if(elecEmerAbnormConfig == YES) {
            buttonPad.button6.enabled = NO;
            buttonPad.button7.enabled = NO;
            buttonPad.button8.enabled = NO;
            buttonPad.button9.enabled = NO;
        }
         
        
        
        [buttonPad.button10 setTitle: @"More →" forState: UIControlStateNormal];
        
        //notify the view controller that the buttonConfiguration is the original one loaded.
         buttonConfig = buttonConfig1;

    }
        
    
}

/* control method footprint:
 The following methods  configure the diagram to reflect specific scenarios which occur during operation of the elctrical system.
 each action should follow the specified footprint shown below to ensure uniform performance and correct logic due to the sheer amount of boolean ivars.
 
 1.  each action opens & closes line contactors as appropriate
 2.  each action powers/depowers and/or abnorms the generator symbols as appropriate
 3.  booleans are set
 4.  genCount is Set
 4.  run abnormal logic
 5.  configure button enabling/disabling 
 
 */


-(IBAction)coldAirplane:(id)sender {
    //NSLog(@"cold airplane called");
    //this method has no logic method so contactors are opened explicitly. This method is a reset for all parameters in the electrical system
    //
    [btc1 open]; [btc2 open]; [eic open]; [sbc1 open]; [sbc2 open]; 
    [bc1 open]; [bc2 open]; [bbc1 open]; [glc1 open]; [glc2 open]; 
    [glc3 open]; [glc4 open]; [alc open]; [asc open]; [gpc open]; 
    [ebc1 close]; [ebc2 close]; 
    
    [generator1 depower];[generator2 depower];[generator3 depower];[generator4 depower]; [apuGenerator depower];
    
    //3/15/2010
    //if batteries are completely discharged, this allows the batteriesAuto method to charge them.

    float zeroVolts = -0.0;
    NSString *zeroVoltString = [[NSString alloc] initWithFormat: @"%.1f", zeroVolts];
    NSString *battVoltageString = [[NSString alloc] initWithFormat: @"%.1f", generatorDisplay.battVoltage];
    if([battVoltageString isEqualToString: zeroVoltString]){
        [self chargeBatteries];
    }
    
    [battVoltageString release];
    [zeroVoltString release];
    //end of code added 3/15/2010
    
    
    [electricalSystemDiagramView powerColdAirplaneBuses];
    generatorDisplay.genGpuV = 0.0;
    
    self.currentAmps = 0.0;
    [self setAllAmpIndicationsToZero];
   
    
    if([incrementTimer isValid] ) {
        [incrementTimer invalidate];
        self.incrementTimer = nil;
    }
    if([decrementTimer isValid]) {
        [decrementTimer invalidate];
        self.decrementTimer = nil;
    }
    
    if([gen1AmpUpTimer isValid]) {
        [gen1AmpUpTimer invalidate];
        self.gen1AmpUpTimer = nil;
    }
        
    if([gen1AmpDownTimer isValid]) {
        [gen1AmpDownTimer invalidate];
        self.gen1AmpDownTimer = nil;
    }
                                 
    if([gen2AmpUpTimer isValid]) {
        [gen1AmpUpTimer invalidate];
        self.gen2AmpUpTimer = nil;
    }
    
    if([gen2AmpDownTimer isValid]) {
        [gen2AmpDownTimer invalidate];
        self.gen2AmpDownTimer = nil;
    }
    
    if([gen3AmpUpTimer isValid]) {
        [gen3AmpUpTimer invalidate];
        self.gen3AmpUpTimer = nil;
    }
    
    if([gen3AmpDownTimer isValid]) {
        [gen3AmpDownTimer invalidate];
        self.gen3AmpDownTimer = nil;
    }
    
    if([gen4AmpUpTimer isValid]) {
        [gen4AmpUpTimer invalidate];
        self.gen4AmpUpTimer = nil;
    }
    
    if([gen4AmpDownTimer isValid]) {
        [gen4AmpDownTimer invalidate];
        self.gen4AmpDownTimer = nil;
    }
    
    if([apuAmpUpTimer isValid]) {
        [apuAmpUpTimer invalidate];
        self.apuAmpUpTimer = nil;      
    }
    
    if([apuAmpDownTimer isValid]) {
        [apuAmpDownTimer invalidate];
        self.apuAmpDownTimer = nil;
    }
    
      
    [generatorDisplay unloadIndications];
    [generatorDisplay showGPUIndication];
    [electricalSystemDiagramView hideGPUPowerIndication];
    [generatorDisplay hideApuIndication];
    
    
    
    
    //set booleans to the original state (cold configuration)
    airplaneIsCold = YES;
    gpuSelected = NO;
    gpuAvailable = NO;
    airplaneIsInAir = NO;
    airGroundButtonTitle = title1;  //allows air ground logic button to be set to "ground logic"
    onBatteries = NO;
    allGensAreOn = NO;
    essPwrConfig = NO;
    elecEmerAbnormConfig = NO;
    elecEssXfrFailConfig = NO;
    elecEssXfrFailButtonTitle = title1;  //allows elec ess xfr fail button title to be set to "elec ess xfr fail A" & associated selector.
    
    /*enables the user to turn the batteries back to auto.  Remember that this method will need to check and see what config
    is active*/ 
    if (buttonConfig == buttonConfig1) {
        
        //Change APU method to START
        [buttonPad.button4 setTitle: @"Start A.P.U." forState: UIControlStateNormal];
        [buttonPad.button4 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button4 addTarget: self action: @selector(apuStartWithBatteries:) forControlEvents: UIControlEventTouchUpInside];
        
        //resets gens 1 - 4
        [self resetGenButtons];
        
        //Disables applicable buttons
        buttonPad.button2.enabled = NO;   //cold airplane
        buttonPad.button3.enabled = YES;  //batteries auto
        buttonPad.button4.enabled = NO;   //start apu
        buttonPad.button5.enabled = NO;   //all gens on
        buttonPad.button6.enabled = NO;   //gen 1
        buttonPad.button7.enabled = NO;   //gen 2
        buttonPad.button8.enabled = NO;   //gen 3
        buttonPad.button9.enabled = NO;   //gen 4
    }
    
    if (buttonConfig == buttonConfig2) {
        [buttonPad.button2 setTitle: @"A.P.U. Gen Fail" forState: UIControlStateNormal];
        [buttonPad.button6 setTitle: @"Start GPU" forState: UIControlStateNormal];
        [buttonPad.button7 setTitle: @"Deselect GPU" forState: UIControlStateNormal];
        
        buttonPad.button2.enabled = NO; // APU Gen Fail
        buttonPad.button3.enabled = NO; // All Gens Fail EPC
        buttonPad.button7.enabled = NO; //gpu selection button.
        buttonPad.button8.enabled = NO; // Ground Logic button.
        
    }
}


-(IBAction)startGPU:(id)sender {
    if(gpuAvailable == NO) {
        gpuAvailable = YES;
        generatorDisplay.genGpuV = 28.0;
        [electricalSystemDiagramView displayGPUPowerIndication];
        generatorDisplay.gpuVoltage.text = [NSString stringWithFormat: @"%.1f", generatorDisplay.genGpuV];
        if (buttonConfig == buttonConfig2)  {
            [buttonPad.button6 setTitle: @"Stop  GPU" forState: UIControlStateNormal];
            
            //if batteries are auto, selection is permitted.
            if(onBatteries) {
            buttonPad.button7.enabled = YES; //gpu selection
            }
            
            
            buttonPad.button8.enabled = NO; //air/ground logic selection.
            }
        }
    else if (gpuAvailable == YES) {
        [gpc open];
        gpuAvailable = NO;
        
        generatorDisplay.genGpuV = 0.0;
        [electricalSystemDiagramView hideGPUPowerIndication];
        generatorDisplay.gpuVoltage.text = [NSString stringWithFormat: @"%.1f", generatorDisplay.genGpuV];


        if (buttonConfig == buttonConfig2) {
            [buttonPad.button6 setTitle: @"Start GPU" forState: UIControlStateNormal];
            [buttonPad.button7 setTitle: @"Select GPU" forState: UIControlStateNormal];
            buttonPad.button7.enabled = NO; //gpu selection
            if(allGensAreOn) 
                buttonPad.button8.enabled = YES; //air ground logic selection.
            
        }
               
    }
}



-(IBAction)gpuSelection:(id)sender {
    if(gpuSelected == NO) {
        [gpc close];
        gpuSelected = YES;
       
        
        if(gpuSelected == YES) {
            //NSLog(@"GPU Selected = YES");
            if([decrementTimer isValid]) {
                [decrementTimer invalidate];
                self.decrementTimer = nil;
                //NSLog(@"GPU Selected, decrement timer invalidated: Gen Count = %i", genCount);
                }
            if([incrementTimer isValid]) {
                [incrementTimer invalidate];
                self.incrementTimer = nil;
                //NSLog(@"GPU Selected, increment timer invalidated: Gen Count = %i", genCount);
            }
            [btc1 close]; [btc2 close];
            [sbc1 close]; [sbc2 close];
            [ebc1 close]; [ebc2 close];
            [bc1 open]; [bc2 open];
            [glc1 open]; [glc2 open];
            [glc3 open]; [glc4 open];
            [alc open]; [bbc1 open];
            [eic open];
            
            [electricalSystemDiagramView powerGroundOpsBuses];
            
        }
        
        if (buttonConfig == buttonConfig2) {
            [buttonPad.button7 setTitle: @"Deselect GPU" forState: UIControlStateNormal];
            }
    
        }
    

     else if(gpuSelected == YES) {
         [gpc open];
          gpuSelected = NO;
         
         
         if(onBatteries == YES) {
             [bc1 close]; 
             [bc2 close];
             [bbc1 close];
             
             //if any generator is powered, the shed buses would still be powered. This must be checked after gpu selection
             if (generator1.isPowered == YES) {
                 [glc1 close];
                 
             }
             else {
                 [glc1 open];
                 
             }
             
             if (generator2.isPowered == YES) {
                 [glc2 close];
                 
             }
             else {
                 [glc2 open];
                 
             }
             
             if (generator3.isPowered == YES) {
                 [glc3 close];
                 
             }
             else {
                 [glc3 open];
                 
             }
             
             if (generator4.isPowered == YES) {
                 [glc4 close];
                 
             }
             else {
                 [glc4 open];
                 
             }
             if (apuGenerator.isPowered == YES) {
                 [alc close];
                 
             }
             else {
                 [alc open];

             }
             
             
         }
         
         if(allGensAreOn == YES) {
             [self runEDLogic: self];
             [electricalSystemDiagramView powerAllBuses];
         }
         
         if(onBatteries && !allGensAreOn){
             [electricalSystemDiagramView powerElevenBusesA];
             if (genCount <= 2)
                 [electricalSystemDiagramView depowerShedBuses];
         }
         
       
         
         if(onBatteries == NO) {
             [self coldAirplane: self];
             [generatorDisplay unloadIndications];
             //NSLog(@"GPU Deselected. on Batteries = NO, Gen Count = %i", genCount);
         }
         
         if(self.genCount == 0 && onBatteries)  {
             self.genCount = 0;
             //NSLog(@"GPU Deselected. Gen Count = %i", genCount);
         }
         else if (self.genCount > 0 && onBatteries) {
             int c = [self genCount];
             self.genCount = c;
             //NSLog(@"GPU Deselected. Gen Count = %i", genCount);
         }
                
         
         
        if (buttonConfig == buttonConfig2) 
            [buttonPad.button7 setTitle: @"Select GPU" forState: UIControlStateNormal];
     }
}


-(IBAction)setAirGroundLogic:(id)sender {
    if(airplaneIsInAir == NO) {
        airplaneIsInAir = YES;
        [gpc open];
        gpuAvailable = NO;
        gpuSelected = NO;
        [generatorDisplay hideGpuIndication];
        [self runEDLogic: self];
        if(buttonConfig = buttonConfig2) {
            [buttonPad.button6 setTitle: @"Start GPU" forState: UIControlStateNormal];
            [buttonPad.button7 setTitle: @"Select GPU" forState: UIControlStateNormal];
            [buttonPad.button8 setTitle: @"Air Logic" forState: UIControlStateNormal];
            buttonPad.button4.enabled = YES;  //elec ess xfr fail button
            buttonPad.button5.enabled = YES;  //elec emer abnormal button
            buttonPad.button6.enabled = NO; // start/stop gpu button
            buttonPad.button7.enabled = NO; //gpu selection
        }
        airGroundButtonTitle = title2;
    }
    else if (airplaneIsInAir == YES) {
        airplaneIsInAir = NO;
        elecEssXfrFailConfig = NO;
        [generatorDisplay showGPUIndication];
        generatorDisplay.gpuVoltage.text = @"0.0";
        if(buttonConfig == buttonConfig2) {
            
            //allows apu button to be active
            if (apuGenerator.generatorStatus == abnormal) {
                [buttonPad.button2 setTitle: @"A.P.U Gen Reset" forState: UIControlStateNormal];
                [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
                [buttonPad.button2 addTarget: self action: @selector(resetApuGen:) forControlEvents: UIControlEventTouchUpInside];
                buttonPad.button2.enabled = YES;

            }
                
            [buttonPad.button8 setTitle: @"Ground Logic" forState: UIControlStateNormal];
            buttonPad.button4.enabled = NO;  //elec ess xfr fail button
            buttonPad.button5.enabled = NO;  //elec emer abnormal button
            buttonPad.button6.enabled = YES;  //start gpu button
            buttonPad.button7.enabled = NO;   //select gpu button

        }
    }
    airGroundButtonTitle = title1;
}





-(IBAction)batteriesAuto:(id)sender {
    
    if(gpuSelected == NO) {
        [bc1 close]; 
        [bc2 close];
        [bbc1 close];
        [sbc1 open];
        [sbc2 open];
        [electricalSystemDiagramView powerElevenBusesA];
        self.genCount = 0;
        //NSLog(@"BatteriesAuto, gpu Deselected, Gen Count = %i", genCount);

    }
    
    if(gpuSelected == YES) {
        [sbc1 close];
        [sbc2 close];
        [bbc1 open];
        [electricalSystemDiagramView powerGroundOpsBuses];
    }
    
    [alc open];
    [btc1 close]; [btc2 close]; [eic open];
    [asc open];
    [ebc1 close]; [ebc2 close];
    [generatorDisplay loadIndications];
    
       
        
    onBatteries = YES;
    airplaneIsCold = NO;
    
      
    
    if (buttonConfig == buttonConfig1) {
    buttonPad.button2.enabled = YES; // cold airplane buttonj
    buttonPad.button3.enabled = NO; //batteries auto buton
    buttonPad.button4.enabled = YES; // start APU button
    buttonPad.button5.enabled = YES; // allGensOn button
    }
}

-(void)chargeBatteries {
    [generatorDisplay setBattVoltage: 24.0f];
    
    //Removed the set string method ... batteries will be charged and the volts display will not appear when cold airplane is selected.
    //The reason the string doesn't need setting is due to the [decrement timer] which continously accesses the ivar for the voltage value.
    /*
    NSString *battVoltageString = [[NSString alloc ] initWithFormat: @"%.1f", generatorDisplay.battVoltage];
    generatorDisplay.battery1Voltage.text = battVoltageString;
    generatorDisplay.battery2Voltage.text = battVoltageString;
    [battVoltageString release];
     */
    
    //5.8.10 only SET the volts to zero (which causes setting of the decrement timers in the setter) if !airplaneIsCold
    //3.30.10.  implemented if statement so that volts weren't being set to zero.
    
    if (!airplaneIsCold) {
        if (self.genCount == 0) {
            self.genCount = 0;
        }
        
    }
    
    
}



//these methods are packaged to avoid creating multiple timer objects. created 1/1/2010.
//for use with -(IBAction)apuStarWithBatteries:(id)sender method.
-(void)apuTimedMethods {
    [asc open];
    [alc close];
    if(elecEmerAbnormConfig == NO) {
        [bc1 close];
        [ebc1 close];
        [ebc2 close];
        [eic open];
    }
}

-(void)apuTimedMethodsWithGPU {
    [asc open];
}

-(void)apuTimedGenCountIncrement{
    self.genCount +=1;
    [generatorDisplay.apuVoltage setText: @"28.0"];
    
    if(buttonConfig == buttonConfig2) {
        
        [buttonPad.button2 setTitle: @"A.P.U Gen Fail" forState: UIControlStateNormal];
        [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button2 addTarget: self action:@selector(apuGenFail:) forControlEvents: UIControlEventTouchUpInside];
        
        buttonPad.button3.enabled = YES;
        buttonPad.button4.enabled = YES;
        buttonPad.button5.enabled = YES;
    }
     
    
    //NSLog(@"Apu Start: Gen Count = %i", genCount);
}

-(IBAction)apuStartWithBatteries:(id)sender {
    
    [alc open]; [asc close]; [bc1 open];
    [generatorDisplay showApuIndication];
    [generatorDisplay.apuVoltage setText: @"0.0"];
    [generatorDisplay.apuAmps setText: @"0"];
    
    if(gpuSelected == YES) {
        [NSTimer scheduledTimerWithTimeInterval: 1.7 target: apuGenerator selector:@selector(power) userInfo: nil repeats: NO];
        [NSTimer scheduledTimerWithTimeInterval: 2.0 target: self selector:@selector(apuTimedMethodsWithGPU) userInfo: nil repeats: NO];
    }
        
    else if(gpuSelected == NO) {
        //the apu start method utilizes timer objects to show the isolation of bc1, the closing & opening of the asc and then uses
        //a delay to call -(void)runEDLogic: method so that the system is configured appropriately.
        [NSTimer scheduledTimerWithTimeInterval: 1.5 target: self selector:@selector(apuTimedMethods) userInfo: nil repeats: NO];
        [NSTimer scheduledTimerWithTimeInterval: 1.7 target: apuGenerator selector:@selector(power) userInfo: nil repeats: NO];
        [NSTimer scheduledTimerWithTimeInterval: 2.0 target: self selector:@selector(runEDLogic:) userInfo: nil repeats: NO];
        
    }
    

    essPwrConfig = NO;
    [NSTimer scheduledTimerWithTimeInterval: 2.0 target: self selector:@selector(apuTimedGenCountIncrement) userInfo: nil repeats: NO];

    
    //if the apu is started, the batteries should not be avail for control.  This is a practical measure to prevent unecessary 
    // line contactor configurations.  the buttonConfig should be checked before this property is set.
    if (buttonConfig == buttonConfig1) {
        buttonPad.button2.enabled = YES;
        buttonPad.button3.enabled = NO;  
        buttonPad.button4.enabled = NO;
        [buttonPad.button4 setTitle: @"Stop A.P.U." forState: UIControlStateNormal];
        [buttonPad.button4 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button4 addTarget: self action: @selector(stopApu:) forControlEvents: UIControlEventTouchUpInside];
    }
    
}

-(void)enableAPUButton {
    if(buttonConfig == buttonConfig1)
        buttonPad.button4.enabled = YES;
}


-(IBAction)stopApu:(id)sender {
    
    [alc open];
    [apuGenerator depower];
    self.genCount -=1;
    [generatorDisplay.apuVoltage setText: @"0.0"];
    //NSLog(@"Gen Count: %i", self.genCount);

    //3.19.2010.  added the condition so that the BTC's configure themselves appropriately on the ground.
    if(self.genCount < 4) {
        [btc1 close];[btc2 close];
    }
    
    if (airplaneIsInAir == YES) {
    [self runEDLogic: self];
    }

        
    if (buttonConfig == buttonConfig1) {
        buttonPad.button4.enabled = NO;
        [buttonPad.button4 setTitle: @"Start A.P.U." forState: UIControlStateNormal];
        [buttonPad.button4 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button4 addTarget: self action: @selector(apuStartWithBatteries:) forControlEvents: UIControlEventTouchUpInside];
    }
    

}

-(IBAction)allGensOn:(id)sender {
    
    if (gpuSelected == YES) {
        [btc1 close]; [btc2 close]; [eic open]; [sbc1 close]; [sbc2 close];
        [bbc1 open]; [glc1 open]; [glc2 open]; [glc3 open]; [glc4 open];
        [alc open]; [ebc1 close]; [ebc2 close]; [bc1 open]; [bc2 open];
        [electricalSystemDiagramView powerGroundOpsBuses];

    }
    
    else if (gpuSelected == NO) {
    [btc1 open]; [btc2 close]; [eic open]; [sbc1 close]; [sbc2 close];
    [bc1 close]; [bc2 close]; [bbc1 close]; [glc1 close]; [glc2 close];
    [glc3 close]; [glc4 close]; [alc close];
    [ebc1 close]; [ebc2 close];
    [electricalSystemDiagramView powerAllBuses];
    }
    
    
    [generator1 power]; [generator2 power]; [generator3 power]; [generator4 power]; [apuGenerator power];
    [generatorDisplay showApuIndication];
    self.genCount = 5;
    
    NSArray *voltageIndicationArray = [NSArray arrayWithObjects: generatorDisplay.generator1Voltage, generatorDisplay.generator3Voltage, generatorDisplay.apuVoltage,
                                       generatorDisplay.generator2Voltage, generatorDisplay.generator4Voltage, nil];
    NSEnumerator *voltageEnumerator = [voltageIndicationArray objectEnumerator];
    id anObject;
    
    while(anObject = [voltageEnumerator nextObject]) {
        [anObject setText: @"28.0"];
    }
    
    
    
    //NSLog(@"All Gens On. GenCount = %i", genCount);
    essPwrConfig = NO;
    elecEmerAbnormConfig = NO;
    allGensAreOn = YES;
    
    if(airplaneIsInAir == YES) {
        [self runEDLogic: self];
    }
    
    

    if(buttonConfig == buttonConfig1) {
        buttonPad.button2.enabled = YES; //cold airplane button
        buttonPad.button6.enabled = YES; // gen1 fail button
        buttonPad.button7.enabled = YES; // gen2 fail button
        buttonPad.button8.enabled = YES; // gen3 fail button
        buttonPad.button9.enabled = YES; // gen4 fail button
        [buttonPad.button4 removeTarget:self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button4 addTarget: self action:@selector(stopApu:) forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button4 setTitle: @"Stop A.P.U." forState: UIControlStateNormal];
        
        //reset gens 1 - 4 
        [self resetGenButtons];
    }
    
      
}


-(IBAction)lossOfAllGens:(id)sender {
    
    [glc1 open];[glc2 open];[glc3 open];[glc4 open];[alc open];
    
    [generator1 abnormal]; [generator2 abnormal]; [generator3 abnormal]; [generator4 abnormal]; [apuGenerator abnormal];
    essPwrConfig = YES;
    allGensAreOn = NO;
    self.genCount = 0;
    
    NSArray *voltageIndicationArray = [NSArray arrayWithObjects: generatorDisplay.generator1Voltage, generatorDisplay.generator3Voltage, generatorDisplay.apuVoltage,
                                       generatorDisplay.generator2Voltage, generatorDisplay.generator4Voltage, nil];
    NSEnumerator *voltageEnumerator = [voltageIndicationArray objectEnumerator];
    id anObject;
    
    while(anObject = [voltageEnumerator nextObject]) {
        [anObject setText: @"0.0"];
    }
    
    //NSLog(@"Loss of All Gens. Gen Count: %i", self.genCount);
    
        
    //conditional method changed from if (airplaneIsInAir == YES) to be more inclusive of other scenarios
    if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }    
    
    [electricalSystemDiagramView powerEssBuses];
    
    if(buttonConfig == buttonConfig1) {
        buttonPad.button2.enabled = YES;
    }
    
    if(buttonConfig == buttonConfig2) {
        
        if(apuGenerator.generatorStatus == abnormal) {                
            [buttonPad.button2 setTitle: @"A.P.U Gen Reset" forState: UIControlStateNormal];
            [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
            [buttonPad.button2 addTarget: self action: @selector(resetApuGen:) forControlEvents: UIControlEventTouchUpInside];
        }
        
        buttonPad.button3.enabled = NO;
        buttonPad.button4.enabled = NO;
        buttonPad.button5.enabled = NO;
    }
    
}




-(IBAction)gen1Fail:(id)sender {
    
    [glc1 open];    
    [generator1 abnormal];
    self.genCount -=1;
    [generatorDisplay.generator1Voltage setText: @"0.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
    if(airplaneIsInAir || onBatteries && !gpuSelected) {
    [self runEDLogic: self];
    }
       
    if(buttonConfig == buttonConfig1) {
        buttonPad.button2.enabled = YES;
        [buttonPad.button6 setTitle: @"Gen 1 Reset" forState: UIControlStateNormal];
        [buttonPad.button6 removeTarget:self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button6 addTarget: self action: @selector(resetGen1:) forControlEvents: UIControlEventTouchUpInside];
    }
}

-(IBAction)resetGen1:(id)sender {
    if (gpuSelected == NO) {
    [glc1 close]; [eic open]; [ebc1 close]; [ebc2 close]; [bc1 close];
    }
    
    [generator1 power];
    essPwrConfig = NO;
    elecEmerAbnormConfig = NO;
    elecEssXfrFailConfig = NO;
    self.genCount +=1;
    
    [generatorDisplay.generator1Voltage setText: @"28.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
    if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }
    
    if(buttonConfig == buttonConfig1) {
        [buttonPad.button6 setTitle: @"Gen 1 Fail" forState: UIControlStateNormal];
        [buttonPad.button6 removeTarget:self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button6 addTarget: self action: @selector(gen1Fail:) forControlEvents: UIControlEventTouchUpInside];
    }
    

    
}

-(IBAction)gen2Fail:(id)sender {
    [glc2 open];
    [generator2 abnormal];
    self.genCount -=1;
    [generatorDisplay.generator2Voltage setText: @"0.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
    if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }
    
    if(buttonConfig == buttonConfig1) {
        
        [buttonPad.button7 setTitle: @"Gen 2 Reset" forState: UIControlStateNormal];
        [buttonPad.button7 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button7 addTarget: self action: @selector(resetGen2:) forControlEvents: UIControlEventTouchUpInside];
    }
    
}

-(IBAction)resetGen2:(id)sender {
    
    if (gpuSelected == NO) {
    [glc2 close]; [eic open]; [ebc1 close]; [ebc2 close]; [bc1 close];
    }
    
    [generator2 power];
    essPwrConfig = NO;
    elecEmerAbnormConfig = NO;
    elecEssXfrFailConfig = NO;
    self.genCount +=1;
    [generatorDisplay.generator2Voltage setText: @"28.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
       
     if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }
    
    if(buttonConfig == buttonConfig1) {
        [buttonPad.button7 setTitle: @"Gen 2 Fail" forState: UIControlStateNormal];
        [buttonPad.button7 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button7 addTarget: self action: @selector(gen2Fail:) forControlEvents: UIControlEventTouchUpInside];
    }
}


-(IBAction)gen3Fail:(id)sender {
    [glc3 open];
    [generator3 abnormal];
    self.genCount -=1;
    [generatorDisplay.generator3Voltage setText: @"0.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
     if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }

    if(buttonConfig == buttonConfig1) {
        [buttonPad.button8 setTitle: @"Gen 3 Reset" forState: UIControlStateNormal];
        [buttonPad.button8 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button8 addTarget: self action: @selector(resetGen3:) forControlEvents: UIControlEventTouchUpInside];
    }
    
}

-(IBAction)resetGen3:(id)sender {
    if (gpuSelected == NO) {
    [glc3 close]; [eic open]; [ebc1 close]; [ebc2 close]; [bc1 close];
    }
    
    [generator3 power];
    
    essPwrConfig = NO;
    elecEmerAbnormConfig = NO;
    elecEssXfrFailConfig = NO;
    self.genCount +=1;
    [generatorDisplay.generator3Voltage setText: @"28.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    

    
    if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }    
    
    if(buttonConfig == buttonConfig1) {
        [buttonPad.button8 setTitle: @"Gen 3 Fail" forState: UIControlStateNormal];
        [buttonPad.button8 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button8 addTarget: self action: @selector(gen3Fail:) forControlEvents: UIControlEventTouchUpInside];
    }
}


-(IBAction)gen4Fail:(id)sender {
    [glc4 open];
    [generator4 abnormal];
    self.genCount -=1;
    [generatorDisplay.generator4Voltage setText: @"0.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
    if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }    
    
    if(buttonConfig == buttonConfig1) {
        [buttonPad.button9 setTitle: @"Gen 4 Reset" forState: UIControlStateNormal];
        [buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button9 addTarget: self action: @selector(resetGen4:) forControlEvents: UIControlEventTouchUpInside];
    }
}

-(IBAction)resetGen4:(id)sender{
    if (gpuSelected == NO) {
    [glc4 close]; [eic open]; [ebc1 close]; [ebc2 close]; [bc1 close];
    }
    
    [generator4 power];
    
    essPwrConfig = NO;
    elecEmerAbnormConfig = NO;
    elecEssXfrFailConfig = NO;
    self.genCount +=1;
    [generatorDisplay.generator4Voltage setText: @"28.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
    if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }    
    
    if(buttonConfig == buttonConfig1) {
        [buttonPad.button9 setTitle: @"Gen 4 Fail" forState: UIControlStateNormal];
        [buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button9 addTarget: self action: @selector(gen4Fail:) forControlEvents: UIControlEventTouchUpInside];
    }
}

-(IBAction)apuGenFail:(id)sender{
    [alc open]; 
    [apuGenerator abnormal]; 
    self.genCount -=1;
    [generatorDisplay.apuVoltage setText: @"0.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
    if(airplaneIsInAir) {
         [self runEDLogic: self];
    }
    
    if(buttonConfig == buttonConfig2) {
        [buttonPad.button2 setTitle: @"A.P.U Gen Reset" forState: UIControlStateNormal];
        [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button2 addTarget: self action:@selector(resetApuGen:) forControlEvents: UIControlEventTouchUpInside];
    }
    
}


-(IBAction)resetApuGen:(id)sender{
    if (gpuSelected == NO) {
    [alc close]; [eic open]; [ebc1 close]; [ebc2 close]; [bc1 close];
    }
    [generatorDisplay showApuIndication];
    [apuGenerator power];
    essPwrConfig = NO;
    elecEmerAbnormConfig = NO;
    elecEssXfrFailConfig = NO;
    self.genCount +=1;
    [generatorDisplay.apuVoltage setText: @"28.0"];
    //NSLog(@"Gen Count: %i", self.genCount);
    
     if(airplaneIsInAir || onBatteries && !gpuSelected) {
        [self runEDLogic: self];
    }    
    
    if(buttonConfig == buttonConfig2) {
        [buttonPad.button2 setTitle: @"A.P.U Gen Fail" forState: UIControlStateNormal];
        [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button2 addTarget: self action:@selector(apuGenFail:) forControlEvents: UIControlEventTouchUpInside];
        buttonPad.button3.enabled = YES;
        buttonPad.button4.enabled = YES;
        buttonPad.button5.enabled = YES;
    }
    
}


-(IBAction)elecEssXfrFailOption1:(id)sender {
    [btc1 close]; [btc2 open]; [eic close];
    [bc1 open]; [bc2 close]; [ebc1 open]; [ebc2 open];
    [alc open]; [glc1 open]; [glc2 open]; [glc3 open]; [glc4 open];
    [bbc1 close]; [sbc1 open]; [sbc2 open];
    
    [generator1 abnormal]; [generator2 abnormal]; [generator3 abnormal]; [generator4 abnormal]; [apuGenerator abnormal];
    
    //3.19.2010 invalidates any active timers to avoid conflicts.
    if([incrementTimer isValid] ) {
        [incrementTimer invalidate];
        self.incrementTimer = nil;
    }
    if([decrementTimer isValid]) {
        [decrementTimer invalidate];
        self.decrementTimer = nil;
    }
    
    essPwrConfig = NO;
    elecEssXfrFailConfig = YES;
    self.genCount = 0;
    //NSLog(@"Gen Count: %i", self.genCount);
    
    [electricalSystemDiagramView powerElecEssXfrFailBusesOption1];
    
    //enumerator object to set all voltages to 0. 
    //this method is also used in the lossOfAllGens: method.
    NSArray *voltageIndicationArray = [NSArray arrayWithObjects: generatorDisplay.generator1Voltage, generatorDisplay.generator3Voltage,
                                       generatorDisplay.generator2Voltage, generatorDisplay.generator4Voltage, nil];
    NSEnumerator *voltageEnumerator = [voltageIndicationArray objectEnumerator];
    id anObject;
    
    while(anObject = [voltageEnumerator nextObject]) {
        [anObject setText: @"0.0"];
    }
        
        
    if(buttonConfig == buttonConfig2) {
        [buttonPad.button4 setTitle: @"Elec Ess Xfr Fail B" forState: UIControlStateNormal];
        [buttonPad.button4 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button4 addTarget: self action: @selector(elecEssXfrFailOption2:) forControlEvents: UIControlEventTouchUpInside];
        
        //changes title of apu button to reset (needed to accurately reflect the action required to reset APU if airplane goes back on ground)
        [buttonPad.button2 setTitle: @"A.P.U Gen Reset" forState: UIControlStateNormal];
        [buttonPad.button2 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button2 addTarget: self action: @selector(resetApuGen:) forControlEvents: UIControlEventTouchUpInside];
        

        buttonPad.button3.enabled = NO;
        buttonPad.button5.enabled = NO;
    }
    
    //notifies the view controller that the title is now "elec ess xfr fail B"
    elecEssXfrFailButtonTitle = title2;

}


-(IBAction)elecEssXfrFailOption2:(id)sender {
    [btc1 open]; [btc2 close]; [eic close];
    [bc1 open]; [bc2 close]; [ebc1 open]; [ebc2 open];
    [alc open]; [glc1 open]; [glc2 open]; [glc3 open]; [glc4 open];
    [bbc1 close]; [sbc1 open]; [sbc2 open];
    
    [generator1 abnormal]; [generator2 abnormal]; [generator3 abnormal]; [generator4 abnormal]; [apuGenerator abnormal];

    //3.19.2010 invalidates any active timers to avoid conflicts.
    if([incrementTimer isValid] ) {
        [incrementTimer invalidate];
        self.incrementTimer = nil;
    }
    if([decrementTimer isValid]) {
        [decrementTimer invalidate];
        self.decrementTimer = nil;
    }
    
    essPwrConfig = NO;
    elecEssXfrFailConfig = YES;
   self.genCount = 0;
    //NSLog(@"Gen Count: %i", self.genCount);
    
    [electricalSystemDiagramView powerElecEssXfrFailBusesOption2];
    
    if(buttonConfig == buttonConfig2) {
        [buttonPad.button4 setTitle: @"Elec Ess Xfr Fail A" forState: UIControlStateNormal];
        [buttonPad.button4 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
        [buttonPad.button4 addTarget: self action: @selector(elecEssXfrFailOption1:) forControlEvents: UIControlEventTouchUpInside];

        buttonPad.button3.enabled = NO;
        buttonPad.button5.enabled = NO;
    }
    
    //notifies the view controller that the title is now "elec ess xfr fail A"
    elecEssXfrFailButtonTitle = title1;

    
}





-(IBAction)elecEmerAbnorm:(id)sender {
    [ebc1 open]; [ebc2 open]; [eic close]; [bc2 close];
    [btc1 open]; [btc2 open]; [bc1 open]; [ebc1 open]; [ebc2 open];
    [electricalSystemDiagramView powerElecAbnormBuses];
    
    //if both gens on one side are de-energized, the associated dc & shed bus should be de-energized.
    if(!generator1.isPowered && !generator3.isPowered) {
        [sbc1 open];
        [electricalSystemDiagramView depowerSameSideBus1];
    }

    if(!generator2.isPowered && !generator4.isPowered) {
        [sbc2 open];
        [electricalSystemDiagramView depowerSameSideBus2];
    }
    
    //3.30.2010 invalidates any active timers to avoid conflicts.
    if([incrementTimer isValid] ) {
        [incrementTimer invalidate];
        self.incrementTimer = nil;
    }
    if([decrementTimer isValid]) {
        [decrementTimer invalidate];
        self.decrementTimer = nil;
    }
    
    essPwrConfig = YES;
    elecEmerAbnormConfig = YES;
   int currentCount = genCount;
    [self setGenCount: currentCount];
    
      
   }


#pragma mark -
#pragma mark - Logic Methods

    

-(void)runGpuLogic:(id)sender {
    
    if (generator1.isPowered == YES) {
        [glc1 close];
    }
    else {
        [glc1 open];
    }
    
    if (generator2.isPowered == YES) {
        [glc2 close];
    }
    else {
        [glc2 open];
    }
    
    if (generator3.isPowered == YES) {
        [glc3 close];
    }
    else {
        [glc3 open];
    }
    
    if (generator4.isPowered == YES) {
        [glc4 close];
    }
    else {
        [glc4 open];
    }
    if (apuGenerator.isPowered == YES) {
        [alc close];
    }
    else {
        [alc open];
    }
    
    
}



-(void)runEDLogic:(id)sender {
    
    //skeleton if statement used for copying
    /*
     if ((generator1.isPowered ==) &&
     (generator2.isPowered == ) &&
     (generator3.isPowered == ) &&
     (generator4.isPowered == ) &&
     (apuGenerator.isPowered == )) {
     }
     */
    
    if(elecEmerAbnormConfig == NO) {
    //loss of all gens
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 open]; [btc2 open];
        [sbc1 open]; [sbc2 open];
        [ebc1 open]; [ebc2 open];
        [eic close]; [bc1 open];
        if((!elecEmerAbnormConfig || !elecEssXfrFailConfig) && airplaneIsInAir)
            [electricalSystemDiagramView powerEssBuses];
        //NSLog(@"Loss of All Gens Logic satisfied");
    }
    
    
    //gens 1, 2, 3, 4, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 open]; [btc2 close]; 
        [sbc1 close]; [sbc2 close];
        //NSLog(@"All Gens On Logic satisfied");
    }
    
    //gens 1, 2, 3, 4
    if ((generator1.isPowered == YES ) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == YES ) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 open]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    //gens 1, 2, 3
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    
    //gens 1, 3, 4
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    
    //gen 1, 2, 4
    
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    //gens 1, 3
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    
    //gens 1, 2
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    
    //gen 1
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    //gen 1, 3, 4, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 open]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    //gen 1, 2, 4, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 open];
        [sbc1 close]; [sbc2 close];
    }
    
    
    //gen 1, 2, 3, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 open]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    
    
    //gen 1, 2, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    //1, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    
    //gen 1, 4, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    //gen 1, 3, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    
    //gen 1, 2, apu
    if ((generator1.isPowered == YES) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    //gen 2, 3, 4, apu
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 open];
        [sbc1 close]; [sbc2 close];
    }
    
    //gen 2, 3, 4
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
        
    }
    
    
    //gen 2, 4, 
    
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered ==YES ) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    //gen 2, 3, 
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    //gen 2,
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 close];
    }
    
    //gen 2, 4, apu
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    //gen 2, 3, apu
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    //gen 2, apu
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == YES) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    
    //gen 3, 4, apu
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 close]; [sbc2 close];
    }
    
    
    //gen 3, 4
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    //gen 3
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }
    
    //gen 3, apu
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == YES) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];   
    }
    
    //gen 4, apu
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];   
    }
    
    //gen 4
    
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == YES) &&
        (apuGenerator.isPowered == NO)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];   
    }
    
    //apu
    
    if ((generator1.isPowered == NO) &&
        (generator2.isPowered == NO) &&
        (generator3.isPowered == NO) &&
        (generator4.isPowered == NO) &&
        (apuGenerator.isPowered == YES)) {
        [btc1 close]; [btc2 close];
        [sbc1 open]; [sbc2 open];
    }

}
    
    if(elecEmerAbnormConfig == YES) {
        
        [btc1 open]; [btc2 open];
        [ebc1 open]; [ebc2 open];
    }
        /*
        //loss of all gens
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];
            [ebc1 open]; [ebc2 open];
            [eic close]; [bc1 open];
            if((!elecEssXfrFailConfig) && airplaneIsInAir)
                [electricalSystemDiagramView powerEssBuses];
            NSLog(@"Loss of All Gens Logic satisfied");
        }
        
        
        //gens 1, 2, 3, 4, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
            NSLog(@"All Gens On Logic satisfied");
        }
        
        //gens 1, 2, 3, 4
        if ((generator1.isPowered == YES ) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == YES ) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //gens 1, 2, 3
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 close]; [sbc2 close];
        }
        
        
        //gens 1, 3, 4
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 close]; [sbc2 close];
        }
        
        
        //gen 1, 2, 4
        
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //gens 1, 3
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];
        }
        
        
        //gens 1, 2
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];
        }
        
        
        //gen 1
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];
        }
        
        //gen 1, 3, 4, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //gen 1, 2, 4, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        
        //gen 1, 2, 3, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        
        
        //gen 1, 2, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //1, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 open]; [sbc2 open];
        }
        
        
        //gen 1, 4, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //gen 1, 3, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        
        //gen 1, 2, apu
        if ((generator1.isPowered == YES) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //gen 2, 3, 4, apu
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //gen 2, 3, 4
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 close]; [sbc2 close];
            
        }
        
        
        //gen 2, 4, 
        
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered ==YES ) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];
        }
        
        //gen 2, 3, 
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];
        }
        
        //gen 2,
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 close];
        }
        
        //gen 2, 4, apu
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //gen 2, 3, apu
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        //gen 2, apu
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == YES) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 open]; [sbc2 open];
        }
        
        
        //gen 3, 4, apu
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 close]; [sbc2 close];
        }
        
        
        //gen 3, 4
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];
        }
        
        //gen 3
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];
        }
        
        //gen 3, apu
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == YES) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 open]; [sbc2 open];   
        }
        
        //gen 4, apu
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 open]; [sbc2 open];   
        }
        
        //gen 4
        
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == YES) &&
            (apuGenerator.isPowered == NO)) {
            [sbc1 open]; [sbc2 open];   
        }
        
        //apu
        
        if ((generator1.isPowered == NO) &&
            (generator2.isPowered == NO) &&
            (generator3.isPowered == NO) &&
            (generator4.isPowered == NO) &&
            (apuGenerator.isPowered == YES)) {
            [sbc1 open]; [sbc2 open];
        }
        
    } */
    
}


//configures bus ties and shed buses


/* electrical logic for btcs
 
 possible generator combinations.
 
 1, 2, 3, 4, apu, 
 2 networks: btc1 open, btc2 closed
 
 1, 2, 3, 4, 
 2 networks: btc1 open, btc2 closed
 
 1, 2, 3, 
 1 network: btc1 closed, btc2 closed
 
 1, 2,
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 1,
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 1, 2, 4, apu,
 2 networks: btc1 closed, btc2 open,
 
 1, 2, 3, apu,
 2 networks: btc1 open, btc2 closed
 
 1, 2, apu,
 1 network: btc1 closed, btc2 closed
 
 1, apu,
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 1, 4, apu,
 1 network: btc1 closed, btc2 closed
 
 1, 3, apu,
 1 network: btc1 closed, btc2 closed
 
 1, 2, apu,
 1 network: btc1 closed, btc2 closed
 
 2, 3, 4, apu,
 2 networks: btc1 closed, btc2 open
 
 2, 3, 4, 
 1 network: btc1 closed, btc2 closed
 
 2, 3, 
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 2,
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 2, 4, apu,
 1 network: btc1 closed, btc2 closed
 
 2, 3, apu,
 1 network: btc1 closed, btc2 closed
 
 2, 3, apu, 
 1 network: btc1 closed, btc2 closed
 
 2, apu,
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 3, 4, apu, 
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 3, 4, 
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 3,
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 3, apu,
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 4, apu, 
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 4,
 1 network: btc1 closed, btc2 closed, sbc1 & 2 open
 
 
 ***********
 condition:
 4-5 generators on: two isolated left & right networks with all buses energized
 
 3 generators on: both electrical networks interconnected via the btcs with all buses
 energized
 
 1 or 2 generators on: both electrical networks interconnected via the btcs with shed
 buses de-energized
 
 ***********
 */


#pragma mark -
#pragma mark - Button Management
-(void)resetGenButtons {

//Change generator buttons
[buttonPad.button6 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];
[buttonPad.button7 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];            
[buttonPad.button8 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside];            
[buttonPad.button9 removeTarget: self action: NULL forControlEvents: UIControlEventTouchUpInside]; 

[buttonPad.button6 addTarget: self action: @selector(gen1Fail:) forControlEvents: UIControlEventTouchUpInside];
[buttonPad.button7 addTarget: self action: @selector(gen2Fail:) forControlEvents: UIControlEventTouchUpInside];
[buttonPad.button8 addTarget: self action: @selector(gen3Fail:) forControlEvents: UIControlEventTouchUpInside];
[buttonPad.button9 addTarget: self action: @selector(gen4Fail:) forControlEvents: UIControlEventTouchUpInside];

[buttonPad.button6 setTitle: @"Gen 1 Fail" forState: UIControlStateNormal];
[buttonPad.button7 setTitle: @"Gen 2 Fail" forState: UIControlStateNormal];
[buttonPad.button8 setTitle: @"Gen 3 Fail" forState: UIControlStateNormal];
[buttonPad.button9 setTitle: @"Gen 4 Fail" forState: UIControlStateNormal];
}

#pragma mark -
#pragma mark - GeneratorSymbolDelegate methods
-(void)generatorIsNormal:(id)sender {
    
    UIColor *green = [[UIColor alloc] initWithRed: 0.0 green: 1.0 blue: 0.0 alpha: 1.0];
   
    if([sender isEqual: generator1]){
        self.generatorDisplay.generator1Voltage.textColor = green;
        self.generatorDisplay.generator1Amps.textColor = green;
    }
    else if([sender isEqual: generator2]){
        self.generatorDisplay.generator2Voltage.textColor = green;
        self.generatorDisplay.generator2Amps.textColor = green;
        
    }
    else if([sender isEqual: generator3]){
        self.generatorDisplay.generator3Voltage.textColor = green;
        self.generatorDisplay.generator3Amps.textColor = green;
        
    }        
    else if([sender isEqual: generator4]){
        self.generatorDisplay.generator4Voltage.textColor = green;
        self.generatorDisplay.generator4Amps.textColor = green;

    }        
    else if([sender isEqual: apuGenerator]){
        self.generatorDisplay.apuVoltage.textColor = green;
        self.generatorDisplay.apuAmps.textColor = green;
        
    }
    
    [green release];
    [self.generatorDisplay setNeedsDisplay];                    

}
-(void)generatorIsAbnormal:(id)sender {
    
    UIColor *amber = [[UIColor alloc] initWithRed: 1.0 green: 100.0/255.0 blue: 0.0 alpha: 1.0];
    if([sender isEqual: generator1]){
        self.generatorDisplay.generator1Voltage.textColor = amber;
        self.generatorDisplay.generator1Amps.textColor = amber; 
    }
    else if([sender isEqual: generator2]){
        self.generatorDisplay.generator2Voltage.textColor = amber;
        self.generatorDisplay.generator2Amps.textColor = amber;
        
    }
    else if([sender isEqual: generator3]){
        self.generatorDisplay.generator3Voltage.textColor = amber;
        self.generatorDisplay.generator3Amps.textColor = amber;
        
    }        
    else if([sender isEqual: generator4]){
        self.generatorDisplay.generator4Voltage.textColor = amber;
        self.generatorDisplay.generator4Amps.textColor = amber;
        
    }        
    else if([sender isEqual: apuGenerator]){
        self.generatorDisplay.apuVoltage.textColor = amber;
        self.generatorDisplay.apuAmps.textColor = amber;
        
    }
    
    [amber release];
    
    [self.generatorDisplay setNeedsDisplay];
    
}

#pragma mark -
#pragma mark - Misc. and Memory Cleanup




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
}
 
 


- (void)didReceiveMemoryWarning {
	
    [super didReceiveMemoryWarning];
}


- (void)viewDidUnload {
    self.mainView = nil;
    self.electricalSystemDiagramView = nil;
    self.backToMainMenuButton = nil;
    self.buttonPad = nil;
    self.generatorDisplay = nil;
    
    self.bc2 = nil;
    self.sbc2 = nil;
    self.asc = nil;
    self.glc1 = nil;
    self.glc2 = nil;
    self.glc3 = nil;
    self.glc4 = nil;
    self.alc = nil;
    self.bc1 = nil;
    self.sbc1 = nil;
    self.bbc1 = nil;
    self.btc1 = nil;
    self.btc2 = nil;
    self.eic = nil;
    self.gpc = nil;
    self.ebc1 = nil;
    self.ebc2 = nil;
    
    self.generator1 = nil;
    self.generator2 = nil;
    self.generator3 = nil;
    self.generator4 = nil;
    self.apuGenerator = nil;
       
    [super viewDidUnload];
	
}


- (void)dealloc {
    
    [mainView release];
    [electricalSystemDiagramView release];
    [backToMainMenuButton release];
    [buttonPad release];
    [generatorDisplay release];
    [generatorArray release];
    [generatorDictionary release];
    
    [incrementTimer release];
    [decrementTimer release];
    [incrementTimer release];
    [decrementTimer release];
    [gen1AmpUpTimer release];
    [gen1AmpDownTimer release];
    [gen2AmpUpTimer release];
    [gen2AmpDownTimer release];
    [gen3AmpUpTimer release];
    [gen3AmpDownTimer release];
    [gen4AmpUpTimer release];
    [gen4AmpDownTimer release];
    [apuAmpUpTimer release];
    [apuAmpDownTimer release];
    
    [bc2 release];
    [sbc2 release];
    [asc release];
    [glc1 release];
    [glc2 release];
    [glc3 release];
    [glc4 release];
    [alc release];
    [bc1 release];
    [sbc1 release];
    [bbc1 release];
    [btc1 release];
    [btc2 release];
    [eic release];
    [gpc release];
    [ebc1 release];
    [ebc2 release];
    
    [generator1 release];
    [generator2 release];
    [generator3 release];
    [generator4 release];
    [apuGenerator release];
    
    [super dealloc];
}

@end
