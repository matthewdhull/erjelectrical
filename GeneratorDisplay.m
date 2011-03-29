//
//  GeneratorDisplay.m
//  Power Source
//
//  Created by Matthew Hull on 1/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GeneratorDisplay.h"
#import "ElecSysBoxIndicationLayer.h"


@implementation GeneratorDisplay
@synthesize generatorImageView;

@synthesize generatorIndicationLayer;
//@synthesize apuVoltageCover;
//@synthesize gpuVoltageCover;
@synthesize battVoltage;
@synthesize generator1Voltage, generator3Voltage, apuVoltage, gpuVoltage, generator2Voltage, generator4Voltage, battery1Voltage, battery2Voltage; 
@synthesize generator1Amps, generator3Amps, apuAmps, generator2Amps, generator4Amps;
@synthesize gen1V, gen3V, genApuV, genGpuV, gen2V, gen4V;
@synthesize gen1A, gen3A, genApuA, gen2A, gen4A;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];

        ElecSysBoxIndicationLayer *indicationLayer = [[ElecSysBoxIndicationLayer alloc] init];
        self.generatorIndicationLayer = indicationLayer;
        [[self layer] addSublayer: generatorIndicationLayer];
        [indicationLayer release];
        
        UIImageView *generatorImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"GeneratorDisplayBorder.png"]];
        generatorImage.frame = CGRectMake(0.0, 0.0, 320.0, 140.0);
        self.generatorImageView = generatorImage;
        [self addSubview: generatorImageView];
        [generatorImage release];

        
        
/*        
        UIImageView *cover = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"AmpVoltageCover.png"]];
        cover.frame = CGRectMake( 164.0, 22.0, 43.0, 62.0);
        cover.alpha = 0.0;
        self.gpuVoltageCover = cover;
        [self addSubview: gpuVoltageCover];
        [cover release];
        
        UIImageView *cover2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"AmpVoltageCover.png"]];
        cover2.frame = CGRectMake(114.0, 22.0, 43.0, 62.0);
        self.apuVoltageCover = cover2;
        [self addSubview: apuVoltageCover];
        [cover2 release];
        
*/        
        
        
        //default battery voltage is 24.0
        [self setBattVoltage: 24.0];
        [self setGen1V: 0.0];
        [self setGen3V: 0.0];
        [self setGenApuV: 0.0];
        [self setGenGpuV: 0.0];
        [self setGen2V: 0.0];
        [self setGen4V: 0.0];
        
        gen1A = 0;
        gen3A = 0;
        genApuA = 0;
        gen2A = 0;
        gen4A = 0;
        
        
        
        
                
    }
    return self;
}

-(void)loadIndications {
    
    //generator voltage indications
    
    if (generator1Voltage == nil) {
    UILabel *voltage1 = [[UILabel alloc] initWithFrame: CGRectMake(28.0, 38.0, 35.0, 18.0)];
    [voltage1 setBackgroundColor: [UIColor clearColor]];
    voltage1.textAlignment = UITextAlignmentCenter;
    voltage1.textColor = [UIColor greenColor];
    self.generator1Voltage = voltage1;
    [self addSubview: generator1Voltage];
    [voltage1 release];
    }
    
    if (generator3Voltage == nil) {
    UILabel *voltage3 = [[UILabel alloc] initWithFrame: CGRectMake(74.0, 38.0, 35.0, 18.0)];
    [voltage3 setBackgroundColor: [UIColor clearColor]];
    voltage3.textAlignment = UITextAlignmentCenter;
    voltage3.textColor = [UIColor greenColor];
    self.generator3Voltage = voltage3;
    [self addSubview: generator3Voltage];
    [voltage3 release];
    }
    
    if (apuVoltage == nil) {
    UILabel *voltageApu = [[UILabel alloc] initWithFrame: CGRectMake(120.0, 38.0, 35.0, 18.0)];
    [voltageApu setBackgroundColor: [UIColor clearColor]];
    voltageApu.textAlignment = UITextAlignmentCenter;
    voltageApu.textColor = [UIColor greenColor];
    self.apuVoltage = voltageApu;
    [self addSubview: apuVoltage];
    [voltageApu release];
    }
    
    if (gpuVoltage == nil) {
    UILabel *voltageGpu = [[UILabel alloc] initWithFrame: CGRectMake(168.0, 38.0, 35.0, 18.0)];
    [voltageGpu setBackgroundColor: [UIColor clearColor]];
    voltageGpu.textAlignment = UITextAlignmentCenter;
    voltageGpu.textColor = [UIColor greenColor];
    self.gpuVoltage = voltageGpu;
    [self addSubview: gpuVoltage];
    [voltageGpu release];
    }
    
    
    if(generator2Voltage == nil) {
    UILabel *voltage2 = [[UILabel alloc] initWithFrame: CGRectMake(214.0, 38.0, 35.0, 18.0)];
    [voltage2 setBackgroundColor: [UIColor clearColor]];
    voltage2.textAlignment = UITextAlignmentCenter;
    voltage2.textColor = [UIColor greenColor];
    self.generator2Voltage = voltage2;
    [self addSubview: generator2Voltage];
    [voltage2 release];
    }
    
    
    if(generator4Voltage == nil ) {
    UILabel *voltage4 = [[UILabel alloc] initWithFrame: CGRectMake(259.0, 38.0, 35.0, 18.0)];
    [voltage4 setBackgroundColor: [UIColor clearColor]];
    voltage4.textAlignment = UITextAlignmentCenter;
    voltage4.textColor = [UIColor greenColor];
    self.generator4Voltage = voltage4;
    [self addSubview: generator4Voltage];
    [voltage4 release];
    }
    
    //battery voltage indications
    
    if(battery1Voltage == nil ) {
    UILabel *bat1Voltage = [[UILabel alloc] initWithFrame: CGRectMake(96.0, 95.0, 35.0, 18.0)];
    [bat1Voltage setBackgroundColor: [UIColor clearColor]];
    bat1Voltage.textAlignment = UITextAlignmentCenter;
    bat1Voltage.textColor = [UIColor greenColor];
    self.battery1Voltage = bat1Voltage;
    [self addSubview: battery1Voltage];
    [bat1Voltage release];
    }
    
    
    if(battery2Voltage == nil ) {
    UILabel *bat2Voltage = [[UILabel alloc] initWithFrame: CGRectMake(183.0, 95.0, 35.0, 18.0)];
    [bat2Voltage setBackgroundColor: [UIColor clearColor]];
    bat2Voltage.textAlignment = UITextAlignmentCenter;
    bat2Voltage.textColor = [UIColor greenColor];
    self.battery2Voltage = bat2Voltage;
    [self addSubview: battery2Voltage];
    [bat2Voltage release];
    }
    
    // generator amp indications
    
    
    if(generator1Amps == nil ) {
    UILabel *amps1 = [[UILabel alloc] initWithFrame: CGRectMake(28.0, 59.0, 34.0, 18.0)];
    [amps1 setBackgroundColor: [UIColor clearColor]];
    amps1.textAlignment = UITextAlignmentRight;
    amps1.textColor = [UIColor greenColor];
    self.generator1Amps = amps1;
    [self addSubview: generator1Amps];
    [amps1 release];
    }
    
    if(generator3Amps == nil ) {
    UILabel *amps3 = [[UILabel alloc] initWithFrame: CGRectMake(74.0, 59.0, 34.0, 18.0)];
    [amps3 setBackgroundColor: [UIColor clearColor]];
    amps3.textAlignment = UITextAlignmentRight;
    amps3.textColor = [UIColor greenColor];
    self.generator3Amps = amps3;
    [self addSubview: generator3Amps];
    [amps3 release];
    }
    
    if(apuAmps == nil ) {
    UILabel *ampsApu = [[UILabel alloc] initWithFrame: CGRectMake(120.0, 59.0, 34.0, 18.0)];
    [ampsApu setBackgroundColor: [UIColor clearColor]];
    ampsApu.textAlignment = UITextAlignmentRight;
    ampsApu.textColor = [UIColor greenColor];
    self.apuAmps = ampsApu;
    [self addSubview: apuAmps];
    [ampsApu release];
    }
    
    
    if(generator2Amps == nil ) {
    UILabel *amps2 = [[UILabel alloc] initWithFrame: CGRectMake(214.0, 59.0, 34.0, 18.0)];
    [amps2 setBackgroundColor: [UIColor clearColor]];
    amps2.textAlignment = UITextAlignmentRight;
    amps2.textColor = [UIColor greenColor];
    self.generator2Amps = amps2;
    [self addSubview: generator2Amps];
    [amps2 release];
    }
  
    if(generator4Amps == nil ) {
    UILabel *amps4 = [[UILabel alloc] initWithFrame: CGRectMake(259.0, 59.0, 34.0, 18.0)];
    [amps4 setBackgroundColor: [UIColor clearColor]];
    amps4.textAlignment = UITextAlignmentRight;
    amps4.textColor = [UIColor greenColor];
    self.generator4Amps = amps4;
    [self addSubview: generator4Amps];
    [amps4 release];
    }
    
    NSString *battVoltageString = [NSString stringWithFormat: @"%.1f", battVoltage];
    [battery1Voltage setText: battVoltageString];
    [battery2Voltage setText: battVoltageString];
    [gpuVoltage setText: [NSString stringWithFormat: @"%.1f", genGpuV]];
    
    //enumerator method to set all voltage labels to "0.0"
    NSArray *voltageIndicationArray = [NSArray arrayWithObjects: generator1Voltage, generator3Voltage, 
                                       generator2Voltage, generator4Voltage, nil];
    
    NSEnumerator *voltageEnumerator = [voltageIndicationArray objectEnumerator];
    id voltageLabel;
    
    while (voltageLabel = [voltageEnumerator nextObject]) {
        [voltageLabel setText: @"0.0"];
    }
    
    //enumerator method to set all amp labels to "000"
    NSArray *ampIndicationArray = [NSArray arrayWithObjects: generator1Amps, generator3Amps, generator2Amps, generator4Amps, nil];
    NSEnumerator *ampsEnumerator = [ampIndicationArray objectEnumerator];
    id ampLabel;
    
    while(ampLabel = [ampsEnumerator nextObject]) {
        [ampLabel setText: @"0"];
    }
    

}    


-(void)unloadIndications {
    //possibly set indications to nothing or release them
    //determine if sending a release message is necessary.
    NSArray *indicationArray = [NSArray arrayWithObjects: generator1Voltage, generator3Voltage, apuVoltage, gpuVoltage,
                                                        generator2Voltage, generator4Voltage, battery1Voltage, battery2Voltage,
                                                        generator1Amps, generator3Amps, apuAmps, generator2Amps, generator4Amps, nil];
        
    NSEnumerator *enumerator = [indicationArray objectEnumerator];
    id anObject;
    
    while (anObject = [enumerator nextObject]) {
        [anObject setText: @""];
    }
}



-(void)hideApuIndication {
    [self.generatorIndicationLayer showAPU: FALSE];
    apuVoltage.text = @"";
}


-(void)showApuIndication {
    [self.generatorIndicationLayer showAPU: TRUE];
}

-(void)hideGpuIndication{
    [self.generatorIndicationLayer showGPU: FALSE];
    gpuVoltage.text = @"";
    
}


-(void)showGPUIndication {
    [self.generatorIndicationLayer showGPU: TRUE];
}


-(void)setVoltagePowerForAllGens{
    
    
    gen1V = 28.0;
    gen3V = 28.0;
    genApuV = 28.0;
    gen2V = 28.0;
    gen4V = 28.0;
    
}

-(void)setAmpPowerToFull{
    gen1A = 80;
    gen3A = 80;
    genApuA = 80;
    gen2A = 80;
    gen4A = 80;
    
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}




- (void)dealloc {
    
    [generator1Voltage release];
    [generator3Voltage release];
    [apuVoltage release];
    [gpuVoltage release];
    [generator2Voltage release];
    [generator4Voltage release];
   
    [battery1Voltage release];
    [battery2Voltage release];
    
    [generator1Amps release];
    [generator3Amps release];
    [apuAmps release];
    [generator2Amps release];
    [generator4Amps release];
    
//    [apuVoltageCover release];
//    [gpuVoltageCover release];
    [generatorImageView release];
    [super dealloc];
}


@end
