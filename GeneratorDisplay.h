//
//  GeneratorDisplay.h
//  Power Source
//
//  Created by Matthew Hull on 1/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ElecSysBoxIndicationLayer;


@interface GeneratorDisplay : UIView {
    
    UIImageView *generatorImageView;
    ElecSysBoxIndicationLayer *generatorIndicationLayer;
//    UIImageView *apuVoltageCover;
//    UIImageView *gpuVoltageCover;
    
    
    float battVoltage;
    float gen1V;
    float gen3V;
    float genApuV;
    float genGpuV;
    float gen2V;
    float gen4V;
    
    int gen1A;
    int gen3A;
    int genApuA;
    int gen2A;
    int gen4A;
    
    UILabel *generator1Voltage;
    UILabel *generator3Voltage;
    UILabel *apuVoltage;
    UILabel *gpuVoltage;
    UILabel *generator2Voltage;
    UILabel *generator4Voltage;
    UILabel *battery1Voltage;
    UILabel *battery2Voltage;
    
    UILabel *generator1Amps;
    UILabel *generator3Amps;
    UILabel *apuAmps;
    UILabel *generator2Amps;
    UILabel *generator4Amps;
    

}

@property float battVoltage;
@property float gen1V;
@property float gen3V;
@property float genApuV;
@property float genGpuV;
@property float gen2V;
@property float gen4V;

@property int gen1A;
@property int gen3A;
@property int genApuA;
@property int gen2A;
@property int gen4A;

@property (nonatomic, retain) UIImageView *generatorImageView;
@property (nonatomic, retain) ElecSysBoxIndicationLayer *generatorIndicationLayer;
//@property (nonatomic, retain) UIImageView *apuVoltageCover;
//@property (nonatomic, retain) UIImageView *gpuVoltageCover;
@property (nonatomic, retain) UILabel *generator1Voltage;
@property (nonatomic, retain) UILabel *generator3Voltage;
@property (nonatomic, retain) UILabel *apuVoltage;
@property (nonatomic, retain) UILabel *gpuVoltage;
@property (nonatomic, retain) UILabel *generator2Voltage;
@property (nonatomic, retain) UILabel *generator4Voltage;
@property (nonatomic, retain) UILabel *battery1Voltage;
@property (nonatomic, retain) UILabel *battery2Voltage;
@property (nonatomic, retain) UILabel *generator1Amps;
@property (nonatomic, retain) UILabel *generator3Amps;
@property (nonatomic, retain) UILabel *apuAmps;
@property (nonatomic, retain) UILabel *generator2Amps;
@property (nonatomic, retain) UILabel *generator4Amps;


//only 2 methods should call this in the viewController:
//1. Batteries Auto
//2. GPU Selection
-(void)loadIndications;

//only 2 methods should call this in the viewController:
//1.  cold airplane
//2.  GPU Selection when not On Batteries.
-(void)unloadIndications;

-(void)hideApuIndication;

-(void)showApuIndication;

//animation that causes GPU indication to be hidden.  (sets gpuCover alpha to 1.0)
-(void)hideGpuIndication;

//animation that causes GPU indication to be shown.  (sets gpuCover alpha to 0.0);
-(void)showGPUIndication;

-(void)setVoltagePowerForAllGens;

-(void)setAmpPowerToFull;


@end
