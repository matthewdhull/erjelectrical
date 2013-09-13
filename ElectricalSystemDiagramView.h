//
//  ElectricalSystemDiagramView.h
//  Power Source
//
//  Created by Matthew Hull on 1/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ElectricalSystemDiagramView : UIView {
    
    bool isDrawn;
    
    bool dcBus1Powered;
    bool dcBus2Powered;
    bool centralDcBusPowered;
    bool hotBus1Powered;
    bool hotBus2Powered;
    bool backupHotBusPowered;
    bool backupEssBusPowered;
    bool backupBus1Powered;
    bool backupBus2Powered;
    bool shedBus1Powered;
    bool shedBus2Powered;
    bool essBus1Powered;
    bool essBus2Powered;
    bool gpuPowered;
    
    
    NSMutableString *selectedBus;
    NSMutableString *desiredBus;
    CGColorRef gray;
    CGColorRef green;
    

}


@property bool isDrawn;

@property bool dcBus1Powered;
@property bool dcBus2Powered;
@property bool centralDcBusPowered;
@property bool hotBus1Powered;
@property bool hotBus2Powered;
@property bool backupHotBusPowered;
@property bool backupEssBusPowered;
@property bool backupBus1Powered;
@property bool backupBus2Powered;
@property bool shedBus1Powered;
@property bool shedBus2Powered;
@property bool essBus1Powered;
@property bool essBus2Powered;
@property bool gpuPowered;



@property (nonatomic, retain) NSMutableString *selectedBus;
@property (nonatomic, retain) NSMutableString *desiredBus;
@property CGColorRef gray;
@property CGColorRef green;


//designated initializer
- (id)initWithFrame:(CGRect)frame allDeenerized:(BOOL)energized;

//power all 13 buses
-(void)powerAllBuses;

-(void)depowerAllBuses;

// power 11 buses A config (batteries auto, apu start w/battery , less than 3 generators)
-(void)powerElevenBusesA;

// power 11 buses B config (electrical emergency abnormal)
-(void)powerElecAbnormBuses;

//power 10 buses (gpu selected, apu start w/gpu)
-(void)powerGroundOpsBuses;

//power 8 buses (electrical ess xfr fail with DC1 powered)
-(void)powerElecEssXfrFailBusesOption1;

//power 8 buses (electrica ess xfr fail with DC2 powered)
-(void)powerElecEssXfrFailBusesOption2;


//power 7 ess buses (essential power configuration)
-(void)powerEssBuses;

-(void)depowerShedBuses;

-(void)powerShedBuses;

//power 3 buses (cold airplane)
-(void)powerColdAirplaneBuses;

//the following 2 methods are used to de-energize Same Side DC & Shed buses.
-(void)depowerSameSideBus1;

-(void)depowerSameSideBus2;

#pragma mark -
#pragma mark - Methods for Displaying individual bus green outlines

-(void)didSelectAnotherBus;

-(void)displayGPUPowerIndication;

-(void)hideGPUPowerIndication;

-(void)selectDCBus1PowerSymbol;

-(void)selectDCBus2PowerSymbol;

-(void)selectCentralBusPowerSymbol;

-(void)selectHotBus1Symbol;

-(void)selectHotBus2Symbol;

-(void)selectBackupEssBusSymbol;

-(void)selectBackupHotBusSymbol;

-(void)selectBackupBus1Symbol;

-(void)selectBackupBus2Symbol;

-(void)selectShedBus1Symbol;

-(void)selectShedBus2Symbol;

-(void)selectEssBus1Symbol;

-(void)selectEssBus2Symbol;




@end
