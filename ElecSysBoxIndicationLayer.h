//
//  ElecSysBoxIndicationLayer.h
//  ERJElectrical
//
//  Created by Matthew Hull on 12/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


typedef enum Status {
    kNormal, kAbnormal,
} Status;

@interface ComponentIndication : NSObject {
    BOOL visible;
    enum Status status;
}

-(ComponentIndication *)init;

@property(nonatomic, assign) BOOL visible;
@property(nonatomic, assign) enum Status status;

@end


@interface ElecSysBoxIndicationLayer : UIView {
    
    
    CGColorRef lightGreenColor;
    ComponentIndication *generator1Indication;
    ComponentIndication *generator2Indication;
    ComponentIndication *generator3Indication;
    ComponentIndication *generator4Indication;
    ComponentIndication *apuGeneratorIndication;
    ComponentIndication *gpuIndication;
    ComponentIndication *dcBus1Indication;
    ComponentIndication *dcBus2Indication;
    
//      future implementation
//    ComponentIndication *battery1Indication;
//    ComponentIndication *battery2Indication;
//    ComponentIndication *centralDCBusIndication;
    

    
    
}

@property (nonatomic, assign) CGColorRef lightGreenColor;
@property (nonatomic, retain) ComponentIndication *generator1Indication;
@property (nonatomic, retain) ComponentIndication *generator2Indication;
@property (nonatomic, retain) ComponentIndication *generator3Indication;
@property (nonatomic, retain) ComponentIndication *generator4Indication;
@property (nonatomic, retain) ComponentIndication *apuGeneratorIndication;
@property (nonatomic, retain) ComponentIndication *gpuIndication;
@property (nonatomic, retain) ComponentIndication *dcBus1Indication;
@property (nonatomic, retain) ComponentIndication *dcBus2Indication;



-(void)showGPU:(BOOL)visible;

-(void)showAPU:(BOOL)visible;

@end
