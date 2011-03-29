//
//  ElectricalSystemEngineViewController.h
//  Power Source
//
//  Created by Matthew Hull on 12/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewDismissalDelegate.h"
#import "GeneratorSymbol.h"

//This View Controller uses the following delegate protocol to handle dismissal from a parent View controller when presented modally.



@class LineContactorOrientationUp;
@class LineContactorOrientationRight;
@class LineContactorOrientationLeft;
@class GeneratorSymbol;
@class ButtonPad;
@class ElectricalSystemDiagramView;
@class GeneratorDisplay;

enum controlConfiguration {buttonConfig1, buttonConfig2};
enum buttonTitle {title1, title2};

@interface ElectricalSystemEngineViewController : UIViewController <GeneratorSymbolDelegate> {
    id <ModalViewDismissalDelegate> delegate;

    UIView *mainView;
    ElectricalSystemDiagramView *electricalSystemDiagramView;
    GeneratorDisplay *generatorDisplay;
    
    enum controlConfiguration buttonConfig;
    enum buttonTitle elecEssXfrFailButtonTitle;
    enum buttonTitle airGroundButtonTitle;
    ButtonPad *buttonPad;
    UIButton *backToMainMenuButton;

    NSInteger currentAmps;
    NSInteger targetAmps;
    NSUInteger genCount;
    NSTimer *decrementTimer;
    NSTimer *incrementTimer;
    
    NSTimer *gen1AmpUpTimer;
    NSTimer *gen1AmpDownTimer;
    NSTimer *gen2AmpUpTimer;
    NSTimer *gen2AmpDownTimer;
    NSTimer *gen3AmpUpTimer;
    NSTimer *gen3AmpDownTimer;
    NSTimer *gen4AmpUpTimer;
    NSTimer *gen4AmpDownTimer;
    NSTimer *apuAmpUpTimer;
    NSTimer *apuAmpDownTimer;
    
    NSTimeInterval interval;
    
    //this array is used with an enumerator object to determine which generator is powered.  
    NSArray *generatorArray;
    NSDictionary *generatorDictionary;
    
    //the following booleans are part of the logic for the electrical system
    //each is used for knowing the proper contactors to open and close
    BOOL airplaneIsCold;
    BOOL onBatteries;
    BOOL allGensAreOn;
    BOOL essPwrConfig;
    BOOL elecEmerAbnormConfig;
    BOOL elecEssXfrFailConfig;
    BOOL airplaneIsInAir;
    BOOL gpuAvailable;
    BOOL gpuSelected;
    
    
    //Line Contactors
    LineContactorOrientationRight *bc2;
    LineContactorOrientationRight *sbc2;
    LineContactorOrientationRight *asc;
    LineContactorOrientationRight *gpc;
    LineContactorOrientationRight *ebc1;
    
    LineContactorOrientationLeft *glc1;
    LineContactorOrientationLeft *glc2;
    LineContactorOrientationLeft *glc3;
    LineContactorOrientationLeft *glc4;
    LineContactorOrientationLeft *alc;
    LineContactorOrientationLeft *bc1;
    LineContactorOrientationLeft *sbc1;
    LineContactorOrientationLeft *bbc1;
    LineContactorOrientationLeft *ebc2;
    
    LineContactorOrientationUp *btc1;
    LineContactorOrientationUp *btc2;
    LineContactorOrientationUp *eic;
    
    GeneratorSymbol *generator1;
    GeneratorSymbol *generator2;
    GeneratorSymbol *generator3;
    GeneratorSymbol *generator4;
    GeneratorSymbol *apuGenerator;
 
}

//This delegate object is used to establish a delegate property to this view Controller and allows the delegate to handle the dismissal of this View controlle
//when used modally.
@property (assign) id<ModalViewDismissalDelegate> delegate;

@property (nonatomic, retain) UIView *mainView;
@property (nonatomic, retain) UIView *electricalSystemDiagramView;
@property (nonatomic, retain) UIButton *backToMainMenuButton;
@property (nonatomic, retain) ButtonPad *buttonPad;
@property (nonatomic, retain) GeneratorDisplay *generatorDisplay;

@property enum controlConfiguration buttonConfig;
@property enum buttonTitle elecEssXfrFailButtonTitle;
@property enum buttonTitle airGroundButtonTitle;

@property (nonatomic, retain) NSTimer *decrementTimer;
@property (nonatomic, retain) NSTimer *gen1AmpUpTimer;
@property (nonatomic, retain) NSTimer *gen1AmpDownTimer;
@property (nonatomic, retain) NSTimer *gen2AmpUpTimer;
@property (nonatomic, retain) NSTimer *gen2AmpDownTimer;
@property (nonatomic, retain) NSTimer *gen3AmpUpTimer;
@property (nonatomic, retain) NSTimer *gen3AmpDownTimer;
@property (nonatomic, retain) NSTimer *gen4AmpUpTimer;
@property (nonatomic, retain) NSTimer *gen4AmpDownTimer;
@property (nonatomic, retain) NSTimer *apuAmpUpTimer;
@property (nonatomic, retain) NSTimer *apuAmpDownTimer;

@property (nonatomic, retain) NSTimer *incrementTimer;

@property NSInteger currentAmps;
@property NSInteger targetAmps;
@property NSTimeInterval interval;

@property (nonatomic, retain) NSArray *generatorArray;
@property (nonatomic, retain) NSDictionary *generatorDictionary;

@property BOOL airplaneIsCold;
@property BOOL onBatteries;
@property BOOL allGensAreOn;
@property BOOL essPwrConfig;
@property BOOL elecEmerAbnormConfig;
@property BOOL elecEssXfrFailConfig;
@property BOOL airplaneIsInAir;
@property BOOL gpuAvailable;
@property BOOL gpuSelected;

@property (nonatomic, retain) LineContactorOrientationRight *bc2;
@property (nonatomic, retain) LineContactorOrientationRight *sbc2;
@property (nonatomic, retain) LineContactorOrientationRight *asc;
@property (nonatomic, retain) LineContactorOrientationRight *gpc;
@property (nonatomic, retain) LineContactorOrientationRight *ebc1;

@property (nonatomic, retain) LineContactorOrientationLeft *glc1;
@property (nonatomic, retain) LineContactorOrientationLeft *glc2;
@property (nonatomic, retain) LineContactorOrientationLeft *glc3;
@property (nonatomic, retain) LineContactorOrientationLeft *glc4;
@property (nonatomic, retain) LineContactorOrientationLeft *alc;
@property (nonatomic, retain) LineContactorOrientationLeft *bc1;
@property (nonatomic, retain) LineContactorOrientationLeft *sbc1;
@property (nonatomic, retain) LineContactorOrientationLeft *bbc1;
@property (nonatomic, retain) LineContactorOrientationLeft *ebc2;

@property (nonatomic, retain) LineContactorOrientationUp *btc1;
@property (nonatomic, retain) LineContactorOrientationUp *btc2;
@property (nonatomic, retain) LineContactorOrientationUp *eic;

@property (nonatomic, retain) GeneratorSymbol *generator1;
@property (nonatomic, retain) GeneratorSymbol *generator2;
@property (nonatomic, retain) GeneratorSymbol *generator3;
@property (nonatomic, retain) GeneratorSymbol *generator4;
@property (nonatomic, retain) GeneratorSymbol *apuGenerator;

-(void)loadAllComponents;

#pragma mark -
#pragma mark - Gen Count, Voltage, Amp, and Timer Methods

-(void)setGenCount:(NSUInteger)aCount;

-(NSUInteger)genCount;

-(void)setAllAmpIndicationsToZero;

-(void)decrementBatteryVoltage:(NSTimer *)timer;

-(void)incrementBatteryVoltage:(NSTimer *)timer;

-(void)setGeneratorAmps: (int)amps;

-(void)setGenerator1AmpsIndicationToTarget:(NSTimer *)timer;

-(void)setGenerator1AmpsIndicationToZero:(NSTimer *)timer;

-(void)setGenerator2AmpsIndicationToTarget:(NSTimer *)timer;

-(void)setGenerator2AmpsIndicationToZero:(NSTimer *)timer;

-(void)setGenerator3AmpsIndicationToTarget:(NSTimer *)timer;

-(void)setGenerator3AmpsIndicationToZero:(NSTimer *)timer;

-(void)setGenerator4AmpsIndicationToTarget:(NSTimer *)timer;

-(void)setGenerator4AmpsIndicationToZero:(NSTimer *)timer;

-(void)setApuAmpsIndicationToTarget:(NSTimer *)timer;

-(void)setApuAmpsIndicationToZero:(NSTimer *)timer;




#pragma mark -
#pragma mark - Electrical Diagram Control Methods

//Deprecated 3/9/2010. This method was used to display and hide button Pad.
//-(IBAction)showOptions:(id)sender;

-(IBAction)buttonChanger:(id)sender;

-(IBAction)coldAirplane:(id)sender;

-(IBAction)startGPU:(id)sender;

-(IBAction)gpuSelection:(id)sender;

-(IBAction)setAirGroundLogic:(id)sender;

-(IBAction)batteriesAuto:(id)sender;

-(void)chargeBatteries;

-(void)apuTimedMethods;

-(void)apuTimedMethodsWithGPU;

-(void)apuTimedGenCountIncrement;

-(IBAction)apuStartWithBatteries:(id)sender;

-(IBAction)stopApu:(id)sender;

-(void)enableAPUButton;

-(IBAction)allGensOn:(id)sender;

-(IBAction)lossOfAllGens:(id)sender;

-(IBAction)gen1Fail:(id)sender;

-(IBAction)resetGen1:(id)sender;

-(IBAction)gen2Fail:(id)sender;

-(IBAction)resetGen2:(id)sender;

-(IBAction)gen3Fail:(id)sender;

-(IBAction)resetGen3:(id)sender;

-(IBAction)gen4Fail:(id)sender;

-(IBAction)resetGen4:(id)sender;

-(IBAction)apuGenFail:(id)sender;

-(IBAction)resetApuGen:(id)sender;

-(IBAction)elecEssXfrFailOption1:(id)sender;

-(IBAction)elecEssXfrFailOption2:(id)sender;

-(IBAction)elecEmerAbnorm:(id)sender;

#pragma mark -
#pragma mark - Electrical Logic Methods

-(void)runEDLogic:(id)sender;

-(void)runGpuLogic:(id)sender;


#pragma mark -
#pragma mark - Button Management
//this method was soley implemented to reduce the amount of repeated code.  This method is intended only for reseting gens 1-4.

-(void)resetGenButtons;

#pragma mark -
#pragma mark - Delegate/ View Navigation Methods

//This method is used to notify the delegate object to dismiss this view controller when used as a Modal View Controller.  
//This is used in conjuction with the ModalDismissal Delegate protocol as declared in ModalDismissalDelegate.h

-(void)backToMainMenu;



@end


