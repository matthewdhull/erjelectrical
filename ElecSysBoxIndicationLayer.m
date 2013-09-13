//
//  ElecSysBoxIndicationLayer.m
//  ERJElectrical
//
//  Created by Matthew Hull on 12/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ElecSysBoxIndicationLayer.h"


#define VOLTS_BOX_Y 36.0
#define AMPS_BOX_Y 58.0
#define AMPS_BOX_HEIGHT 21.0

@implementation ComponentIndication
@synthesize visible;
@synthesize status;

-(ComponentIndication *)init {
    if((self = [super init])){
        self.visible = TRUE;
        self.status = kNormal;
    }
    return self;
}

-(void)dealloc {
    [super dealloc];
}
@end




@implementation ElecSysBoxIndicationLayer

@synthesize lightGreenColor;
@synthesize generator1Indication;
@synthesize generator2Indication;
@synthesize generator3Indication;
@synthesize generator4Indication;
@synthesize apuGeneratorIndication;
@synthesize gpuIndication;
@synthesize dcBus1Indication;
@synthesize dcBus2Indication;



- (id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])){
        
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0.0, 0.0, 320.0, 140.0);
        
        UIColor *gColor = [[UIColor alloc] initWithRed: 183.0/255.0 green: 1.0 blue: 183.0/255.0 alpha: 1.0];
        self.lightGreenColor = gColor.CGColor;
        
        ComponentIndication *gen1 = [[ComponentIndication alloc] init];
        self.generator1Indication = gen1;
        [gen1 release];
        
        ComponentIndication *gen3 = [[ComponentIndication alloc] init];
        self.generator3Indication = gen3;
        [gen3 release];

        ComponentIndication *genApu = [[ComponentIndication alloc] init];
        genApu.visible = FALSE;
        self.apuGeneratorIndication = genApu;
        [genApu release];

        ComponentIndication *gen2 = [[ComponentIndication alloc] init];
        self.generator2Indication = gen2;
        [gen2 release];

        ComponentIndication *gen4 = [[ComponentIndication alloc] init];
        self.generator4Indication = gen4;
        [gen4 release];
        
        ComponentIndication *gpu = [[ComponentIndication alloc] init];
        gpu.visible = FALSE;
        self.gpuIndication = gpu;
        [gpu release];
                
        ComponentIndication *dcBus1 = [[ComponentIndication alloc] init];
        self.dcBus1Indication = dcBus1;
        [dcBus1 release];
        
        ComponentIndication *dcBus2 = [[ComponentIndication alloc] init];
        self.dcBus2Indication = dcBus2;
        [dcBus2 release];
        

        [self showGPU: YES];
        
    }
    
    return self;
}
-(void)drawRect:(CGRect)rect {
        
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetAllowsAntialiasing(ctx, FALSE);
    
    //draw temporary background (black)
    CGContextSetRGBFillColor(ctx, 0.0, 0.0, 0.0, 1.0);
    CGContextFillRect(ctx, CGRectMake(23.0, 22.0, 276.0, 95.0));
    
    CGContextSetLineWidth(ctx, 1.0f);
    CGContextSetStrokeColorWithColor(ctx, self.lightGreenColor);
    
    //draw box indication for each.  
    
    //gen 1
    CGContextStrokeRect(ctx, CGRectMake(26.0, VOLTS_BOX_Y, 39.0, 22.0));
    CGContextStrokeRect(ctx, CGRectMake(26.0, AMPS_BOX_Y, 39.0, AMPS_BOX_HEIGHT));
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 44.0, 79.0);
    CGContextAddLineToPoint(ctx, 44.0, 96.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
    //gen 3
    CGContextStrokeRect(ctx, CGRectMake(72.0, VOLTS_BOX_Y, 39.0, 22.0));
    CGContextStrokeRect(ctx, CGRectMake(72.0, AMPS_BOX_Y, 39.0, AMPS_BOX_HEIGHT));
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 90.0, 79.0);
    CGContextAddLineToPoint(ctx, 90.0, 84.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
    //apu
    if(apuGeneratorIndication.visible == TRUE) {
        CGContextStrokeRect(ctx, CGRectMake(118.0, VOLTS_BOX_Y, 39.0, 22.0));
        CGContextStrokeRect(ctx, CGRectMake(118.0, AMPS_BOX_Y, 39.0, AMPS_BOX_HEIGHT));
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, 137.0, 79.0);
        CGContextAddLineToPoint(ctx, 137.0, 84.0);
        CGContextClosePath(ctx);
        CGContextStrokePath(ctx);
    }
    
    else {
        CGContextSetRGBFillColor(ctx, 0.0, 0.0, 0.0, 1.0);
        CGContextFillRect(ctx, CGRectMake(118.0, 36.0, 39.0, 48.0));
    }
    
    //gpu
    if(gpuIndication.visible == TRUE) {
        CGContextStrokeRect(ctx, CGRectMake(166.0, VOLTS_BOX_Y, 39.0, 22.0));
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, 184.0, 58.0);
        CGContextAddLineToPoint(ctx, 184.0, 84.0);
        CGContextClosePath(ctx);
        CGContextStrokePath(ctx);
    }
    
    else {
        CGContextSetRGBFillColor(ctx, 0.0, 0.0, 0.0, 1.0);
        CGContextFillRect(ctx, CGRectMake(166.0, 36.0, 39.0, 48.0));
    }
    
  
    //gen 2
    CGContextStrokeRect(ctx, CGRectMake(212.0, VOLTS_BOX_Y, 39.0, 22.0));
    CGContextStrokeRect(ctx, CGRectMake(212.0, AMPS_BOX_Y, 39.0, AMPS_BOX_HEIGHT));
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 231.0, 79.0);
    CGContextAddLineToPoint(ctx, 231.0, 84.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);


    //gen 4
    CGContextStrokeRect(ctx, CGRectMake(257.0, VOLTS_BOX_Y, 39.0, 22.0));
    CGContextStrokeRect(ctx, CGRectMake(257.0, AMPS_BOX_Y, 39.0, AMPS_BOX_HEIGHT));
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 277.0, 79.0);
    CGContextAddLineToPoint(ctx, 277.0, 96.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);

    
    //batt1
    CGContextStrokeRect(ctx, CGRectMake(94.0, 93.0, 39.0, 22.0));
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 104.0, 87.0);
    CGContextAddLineToPoint(ctx, 104.0, 92.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);

    
    //batt2
    CGContextStrokeRect(ctx, CGRectMake(181.0, 93.0, 39.0, 22.0));
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 199.0, 87.0);
    CGContextAddLineToPoint(ctx, 199.0, 92.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);

    
    //bus connectors
    
    //dc bus 1 - central bus connector
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 110.0, 85.0);
    CGContextAddLineToPoint(ctx, 118.0, 85.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);

    
    //central bus - dc bus 2 connector
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 205.0, 85.0);
    CGContextAddLineToPoint(ctx, 212.0, 85.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);

    
    
    //draw buses
    
    //green color, 3.0 width
    CGContextSetRGBStrokeColor(ctx, 0.0, 1.0, 0.0, 1.0);
    CGContextSetLineWidth(ctx, 3.0);

    //amber color if needed for DC bus 1 OFF
    if(self.dcBus1Indication.status == kAbnormal){
        CGContextSetRGBStrokeColor(ctx, 1.0,  100.0/255.0, 0.0, 1.0);        
    }
    
    
    //DC bus 1
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 26.0, 85.0);
    CGContextAddLineToPoint(ctx, 110.0, 85.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
    
    //back to green
    CGContextSetRGBStrokeColor(ctx, 0.0, 1.0, 0.0, 1.0);    
    
    //amber color if needed for DC bus 2 OFF    
    if(self.dcBus2Indication.status == kAbnormal){
        CGContextSetRGBStrokeColor(ctx, 1.0,  100.0/255.0, 0.0, 1.0);        
    }
    
    //DC bus 2
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 212.0, 85.0);
    CGContextAddLineToPoint(ctx, 296.0, 85.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
    //back to green.
    CGContextSetRGBStrokeColor(ctx, 0.0, 1.0, 0.0, 1.0);
    
    //central bus
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 118.0, 85.0);
    CGContextAddLineToPoint(ctx, 205.0, 85.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);

    //ess bus 1
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 26.0,97.0);
    CGContextAddLineToPoint(ctx, 65.0, 97.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
    //ess bus 2    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 257.0,97.0);
    CGContextAddLineToPoint(ctx, 296.0, 97.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
    
    
    //generator labels.
    
    CGContextSetAllowsAntialiasing(ctx, TRUE);    
    CGFloat genLabelY = 110.0;
    CGFloat essBusLabelY = 30.0;    
    CGFloat genLabelStartingX = 27.0;
    CGFloat labelSpacing = 46.5;
    
    CGRect viewBounds = self.bounds;
    CGContextTranslateCTM(ctx, 0, viewBounds.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextSetRGBFillColor(ctx, 0.0, 1.0, 0.0, 1.0);
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSelectFont(ctx, "Helvetica", 10.0, kCGEncodingMacRoman);
    CGContextSetCharacterSpacing(ctx, 1.7);
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    CGContextShowTextAtPoint(ctx, genLabelStartingX, genLabelY, "GEN 1", 5);
    CGContextShowTextAtPoint(ctx, genLabelStartingX + labelSpacing, genLabelY, "GEN 3", 5);
    CGContextShowTextAtPoint(ctx, genLabelStartingX + (labelSpacing * 4), genLabelY, "GEN 2", 5);
    CGContextShowTextAtPoint(ctx, genLabelStartingX + (labelSpacing * 5), genLabelY, "GEN 4", 5);
    CGContextShowTextAtPoint(ctx, genLabelStartingX, essBusLabelY, "ESS 1", 5);
    CGContextShowTextAtPoint(ctx, genLabelStartingX + (labelSpacing * 5), essBusLabelY, "ESS 2 ", 5);    

    if(apuGeneratorIndication.visible == TRUE) {
        CGContextShowTextAtPoint(ctx, genLabelStartingX + (labelSpacing * 2 + 5), genLabelY, "APU", 3);        
    }
    
    if(gpuIndication.visible == TRUE) {
        CGContextShowTextAtPoint(ctx, genLabelStartingX + (labelSpacing * 3 + 5), genLabelY, "GPU", 3);        
    }



}

-(void)dealloc {
    [super dealloc];
    CGColorRelease(lightGreenColor);
    [generator1Indication release];
    [generator2Indication release];
    [generator3Indication release];
    [generator4Indication release];
    [apuGeneratorIndication release];
    [gpuIndication release];
    [dcBus1Indication release];
    [dcBus2Indication release];
    
}

-(void)showGPU:(BOOL)visible {
     
    self.gpuIndication.visible = visible;
    [self setNeedsDisplay];
}

-(void)showAPU:(BOOL)visible{
    self.apuGeneratorIndication.visible = visible;
    [self setNeedsDisplay];
      
        
}

@end
