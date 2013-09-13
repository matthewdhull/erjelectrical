//
//  ElectricalSystemDiagramView.m
//  Power Source
//
//  Created by Matthew Hull on 1/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ElectricalSystemDiagramView.h"
#import "RectConstants.h"


@implementation ElectricalSystemDiagramView

@synthesize gray;
@synthesize green;

@synthesize isDrawn;
@synthesize dcBus1Powered;
@synthesize dcBus2Powered;
@synthesize centralDcBusPowered;
@synthesize hotBus1Powered;
@synthesize hotBus2Powered;
@synthesize backupHotBusPowered;
@synthesize backupEssBusPowered;
@synthesize backupBus1Powered;
@synthesize backupBus2Powered;
@synthesize shedBus1Powered;
@synthesize shedBus2Powered;
@synthesize essBus1Powered;
@synthesize essBus2Powered;
@synthesize gpuPowered;


@synthesize selectedBus;
@synthesize desiredBus;

typedef enum Orientation {
  left, right, up, down  
} Orientation;

typedef enum DrawType {
    stroke, fill, fillStroke
} DrawType;


- (id)initWithFrame:(CGRect)frame allDeenerized:(BOOL)energized{
    if((self = [super initWithFrame:frame])){
        
        self.backgroundColor = [UIColor clearColor];
        UIColor *grayShade = [UIColor colorWithRed:131.0/255.0 green:131.0/255.0 blue:131.0/255.0 alpha:1.0];
        gray  = grayShade.CGColor;
        CGColorRetain(gray);
        
        UIColor *greenShade = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
        green = greenShade.CGColor;
        CGColorRetain(green);
        if (energized == NO) {
            self.hotBus1Powered = YES;
            self.hotBus2Powered = YES;
            self.backupHotBusPowered = YES;

        }
        //this string is used for tracking the selected bus
        selectedBus = [[NSMutableString alloc] init];
        
        //this string is used for tracking the desired bus
        desiredBus = [[NSMutableString alloc] init];
        
    }
    return self;
}




-(void)drawRoundedRect:(CGRect)rrect cornerRadius:(CGFloat)radius color:(CGColorRef)color  drawType:(DrawType)dType context:(CGContextRef)ctx {

    CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
    CGContextMoveToPoint(ctx, minx, midy);
    CGContextAddArcToPoint(ctx, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(ctx, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(ctx, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(ctx, minx, maxy, minx, midy, radius);
    CGContextClosePath(ctx);
    
    if(dType == fill) {
        CGContextFillPath(ctx);
    }
    else if(dType == stroke){
        CGContextStrokePath(ctx);
    }
    else if(dType == fillStroke){
        CGContextSetLineWidth(ctx, 1.5);
        CGContextSetRGBStrokeColor(ctx, 0.0, 1.0, 0.0, 1.0);
        CGContextDrawPath(ctx, kCGPathFillStroke);
    }
    
}

/*
-(void)drawTriangleAtPoint:(CGPoint)orig orientation:(Orientation)orientation color:(CGColorRef)color context:(CGContextRef)ctx {
    CGContextSetFillColorWithColor(ctx, color);
    
    CGPoint point2;
    CGPoint point3;
    
    if(orientation == left) {
        point2 = CGPointMake(orig.x + 2.0, orig.y + 2.5);
        point3 = CGPointMake(orig.x, orig.y + 5.0);
    }
    else if(orientation == right) {
        point2 = CGPointMake(orig.x - 2.0, orig.y + 2.5);
        point3 = CGPointMake(orig.x, orig.y + 5.0);
    }
    else if(orientation == up){
        point2 = CGPointMake(orig.x + 2.5, orig.y - 2.5);
        point3 = CGPointMake(orig.x + 5.0, orig.y);
    }
    else if(orientation == down){
        point2 = CGPointMake(orig.x + 2.5, orig.y + 2.5);
        point3 = CGPointMake(orig.x + 5.0, orig.y);
    }
    
    
    CGPoint points[] = {
        CGPointMake(orig.x, orig.y),
        CGPointMake(point2.x, point2.y),
        CGPointMake(point3.x, point3.y),
        CGPointMake(orig.x, orig.y)
    };
    CGContextBeginPath(ctx);
    CGContextAddLines(ctx, points, sizeof(points)/sizeof(points[0]));
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}


-(void)drawGeneratorContactor:(CGPoint)orig color:(CGColorRef)color context:(CGContextRef)ctx{
    CGContextSetFillColorWithColor(ctx, color);
    
    CGPoint points[] = {
        CGPointMake(orig.x, orig.y),
        CGPointMake(orig.x + 2.0, orig.y),
        CGPointMake(orig.x + 2.0, orig.y + 8.0),
        CGPointMake(orig.x, orig.y + 8.0),
        CGPointMake(orig.x - 2.0, orig.y + 5.5),
        CGPointMake(orig.x, orig.y + 3.0),
        CGPointMake(orig.x, orig.y)
    };
    CGContextBeginPath(ctx);
    CGContextAddLines(ctx, points, sizeof(points)/sizeof(points[0]));
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
}

-(void)drawDCBusGeneratorContactor:(CGPoint)orig color:(CGColorRef)color context:(CGContextRef)ctx{
    CGContextSetFillColorWithColor(ctx, color);
    
    CGPoint points[] = {
        CGPointMake(orig.x, orig.y),
        CGPointMake(orig.x + 2.0, orig.y),
        CGPointMake(orig.x + 2.0, orig.y + 8.0),
        CGPointMake(orig.x, orig.y + 8.0),
        CGPointMake(orig.x, orig.y + 5.0),
        CGPointMake(orig.x - 2.0, orig.y + 2.5),
        CGPointMake(orig.x, orig.y)
    };
    CGContextBeginPath(ctx);
    CGContextAddLines(ctx, points, sizeof(points)/sizeof(points[0]));
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);

}
 
 
 
 -(void)drawBattery:(CGPoint)orig color:(CGColorRef)color context:(CGContextRef)ctx {
 CGContextSetStrokeColorWithColor(ctx, color);
 CGContextSetAllowsAntialiasing(ctx, FALSE);
 CGContextSetLineWidth(ctx, 1.0);
 
 CGContextMoveToPoint(ctx, orig.x, orig.y);
 CGContextAddLineToPoint(ctx, orig.x + 14.0, orig.y);
 
 CGContextMoveToPoint(ctx, orig.x + 2.0, orig.y+2.0);
 CGContextAddLineToPoint(ctx, orig.x + 12.0, orig.y + 2.0);
 
 CGContextMoveToPoint(ctx, orig.x + 1.0, orig.y + 4.0);
 CGContextAddLineToPoint(ctx, orig.x + 13.0, orig.y + 4.0);
 
 CGContextMoveToPoint(ctx, orig.x + 2.0, orig.y + 6.0);
 CGContextAddLineToPoint(ctx, orig.x + 12.0, orig.y + 6.0);
 
 //vertical line
 CGContextMoveToPoint(ctx, orig.x + 7.0, orig.y + 7.0);
 CGContextAddLineToPoint(ctx, orig.x + 7.0, orig.y + 11.0);
 
 CGContextMoveToPoint(ctx, orig.x + 1.0, orig.y + 11.0);
 CGContextAddLineToPoint(ctx, orig.x + 13.0, orig.y + 11.0);
 
 CGContextMoveToPoint(ctx, orig.x + 2.0, orig.y + 13.0);
 CGContextAddLineToPoint(ctx, orig.x + 12.0, orig.y + 13.0);
 
 CGContextMoveToPoint(ctx, orig.x + 4.0, orig.y + 15.0);
 CGContextAddLineToPoint(ctx, orig.x + 10.0, orig.y + 15.0);
 
 CGContextMoveToPoint(ctx, orig.x + 5.0, orig.y + 17.0);
 CGContextAddLineToPoint(ctx, orig.x + 9.0, orig.y + 17.0);
 
 CGContextStrokePath(ctx);
 CGContextSetAllowsAntialiasing(ctx, TRUE);
 }
 
 
*/


-(void)drawGpuWithPower:(BOOL)powered inContext:(CGContextRef)ctx{

    CGColorRef color;
    if (powered == true) {
        color = green;
    }
    
    else {
        color = gray;
    }
    
    //we momentarily remove the shadow to draw the gpu lines and restore it prior to drawing the rest of the diagram
    CGContextRestoreGState(ctx);
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, color);
    CGFloat rad = 2.0;
    [self drawRoundedRect:CGRectMake(122.0, 90.0, 10.0, 3.0) cornerRadius:rad color: color drawType:stroke context:ctx];
    [self drawRoundedRect:CGRectMake(122.0, 85.0, 10.0, 3.0) cornerRadius:rad color: color drawType:stroke context:ctx];
    [self drawRoundedRect:CGRectMake(125.0, 80.0, 7.0, 3.0) cornerRadius: rad color: color drawType:stroke context:ctx];
    
    //shadow restore.
    CGSize shadowOffset = CGSizeMake (5,  5);
    CGContextSaveGState(ctx);
    CGContextSetShadow (ctx, shadowOffset, 4);
    
    CGContextSetLineWidth(ctx, 4.0);
    CGContextMoveToPoint(ctx, 132.0, 79.0);
    CGContextAddLineToPoint(ctx, 132.0, 96.0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, gray);
    CGContextSetLineWidth(context, 2.0);
    
//shadow
    CGSize shadowOffset = CGSizeMake (5,  5);
    CGContextSaveGState(context);
    CGContextSetShadow (context, shadowOffset, 4);
    
    CGContextBeginTransparencyLayer(context, NULL);
    
/*
//generator contactors conn
    [self drawGeneratorContactor:CGPointMake(33.0, 30.0) color:gray context:context];
    [self drawGeneratorContactor:CGPointMake(70.0, 30.0) color:gray context:context];
    [self drawGeneratorContactor:CGPointMake(148.0, 30.0) color:gray context:context];
    [self drawGeneratorContactor:CGPointMake(229.0, 30.0) color:gray context:context];
    [self drawGeneratorContactor:CGPointMake(267.0, 30.0) color:gray context:context];
    
//apu start contactor
    
    //top portion
    CGPoint ascPoints[] = {
        CGPointMake(150.0, 32.0),
        CGPointMake(159.0, 32.0),
        CGPointMake(161.0, 35.5),
        CGPointMake(159.0, 38.0),
        CGPointMake(157.0, 38.0),
        CGPointMake(157.0, 34.0),
        CGPointMake(150.0, 34.0),
        CGPointMake(150.0, 32.0)
    };
    CGContextBeginPath(context);
    CGContextAddLines(context, ascPoints, sizeof(ascPoints)/sizeof(ascPoints[0]));
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    //bottom portion
    CGPoint ascP = CGPointMake(157.0, 45.0);
    CGPoint ascCentralBusPoints[] = {
        CGPointMake(ascP.x, ascP.y),
        CGPointMake(ascP.x + 2.0, ascP.y),
        CGPointMake(ascP.x + 4.0, ascP.y + 2.5),
        CGPointMake(ascP.x + 2.0, ascP.y + 5.0),
        CGPointMake(ascP.x + 2.0, ascP.y + 8.0),
        CGPointMake(ascP.x, ascP.y + 8.0),
        CGPointMake(ascP.x, ascP.y)
    };
    CGContextBeginPath(context);
    CGContextAddLines(context, ascCentralBusPoints, sizeof(ascCentralBusPoints)/sizeof(ascCentralBusPoints[0]));
    CGContextClosePath(context);
    CGContextFillPath(context);


    
#pragma mark - lower portions of generator contactors (connections to DC buses)
    [self drawDCBusGeneratorContactor:CGPointMake(33.0, 45.0) color:gray context:context];
    [self drawDCBusGeneratorContactor:CGPointMake(70.0, 45.0) color:gray context:context];
    [self drawDCBusGeneratorContactor:CGPointMake(148.0, 45.0) color:gray context:context];
    [self drawDCBusGeneratorContactor:CGPointMake(229.0, 45.0) color:gray context:context];
    [self drawDCBusGeneratorContactor:CGPointMake(267.0, 45.0) color:gray context:context];
    
#pragma mark - lines between each dc bus.
    CGContextSetAllowsAntialiasing(context, FALSE);
    CGContextSetStrokeColorWithColor(context, gray);

    CGFloat dcLineY = 59.0;
    CGContextMoveToPoint(context, 87.0, dcLineY);
    CGContextAddLineToPoint(context, 99.0, dcLineY);
    
    CGContextMoveToPoint(context, 113.0,dcLineY);
    CGContextAddLineToPoint(context,127.0,dcLineY);
    
    CGContextMoveToPoint(context, 173.0, dcLineY);
    CGContextAddLineToPoint(context, 188.0, dcLineY);
    
    CGContextMoveToPoint(context, 201.0, dcLineY);
    CGContextAddLineToPoint(context, 212.0, dcLineY);
    CGContextClosePath(context);
    CGContextStrokePath(context);

#pragma mark - lines from dc buses to shed buses
    CGContextMoveToPoint(context, 32.0, 67.0);
    CGContextAddLineToPoint(context, 32.0, 118.0);
    
    CGContextMoveToPoint(context, 32.0, 133.0);
    CGContextAddLineToPoint(context, 32.0, 192.0);

    CGContextMoveToPoint(context, 268.0, 67.0);
    CGContextAddLineToPoint(context, 268.0, 118.0);
    
    CGContextMoveToPoint(context, 268.0, 133.0);
    CGContextAddLineToPoint(context, 268.0, 192.0);
        
#pragma mark - lines from dc buses to essential buses
    CGContextMoveToPoint(context, 53.0, 57.0);
    CGContextAddLineToPoint(context, 53.0, 73.0);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    CGContextSetAllowsAntialiasing(context, TRUE);
    CGContextMoveToPoint(context, 53.0, 73.0);
    CGContextAddCurveToPoint(context, 56.0, 73.0, 56.0, 77.0, 53.0, 77.0);
    CGContextAddCurveToPoint(context, 49.0, 76.4, 49.0, 81.0, 53.0, 81.0);

    CGContextMoveToPoint(context, 53.0, 81.0);
    CGContextAddLineToPoint(context, 53.0, 146.0);
    
    CGContextMoveToPoint(context, 53.0, 160.0);
    CGContextAddLineToPoint(context, 53, 175.0);
    
    CGContextMoveToPoint(context, 53.0, 174.0);
    CGContextAddLineToPoint(context, 72.0, 174.0);
    
    CGContextMoveToPoint(context, 245.0, 67.0);
    CGContextAddLineToPoint(context, 245.0, 73.0);
    CGContextMoveToPoint(context, 245.0, 73.0);
    CGContextAddCurveToPoint(context, 248.0, 73.0, 248.0, 77.0, 245.0, 77.0);
    CGContextMoveToPoint(context, 245.0, 77.0);
    CGContextAddCurveToPoint(context, 242.0, 77.0, 242.0, 81.0, 245.0, 81.0);
    CGContextMoveToPoint(context, 245.0, 81.0);
    CGContextAddLineToPoint(context, 245.0, 147.0);
    CGContextMoveToPoint(context, 245.0, 161.0);
    CGContextAddLineToPoint(context, 245.0, 175.0);
    CGContextMoveToPoint(context, 245.0, 174.0);
    CGContextAddLineToPoint(context, 228.0, 174.0);
    
#pragma mark - lines from hot buses to essential buses
    CGContextMoveToPoint(context, 71.0, 113.0);
    CGContextAddLineToPoint(context, 71.0, 147.0);
    CGContextMoveToPoint(context, 71.0, 158.0);
    CGContextAddLineToPoint(context, 71.0, 191.0);
    
    CGContextMoveToPoint(context, 227.0, 113.0);
    CGContextAddLineToPoint(context, 227.0, 147.0);
    CGContextMoveToPoint(context, 227.0, 158.0);
    CGContextAddLineToPoint(context, 227.0, 191.0);
    
#pragma mark - lines between ess bus 1 - 2
    CGContextMoveToPoint(context, 120.0, 199.0);
    CGContextAddLineToPoint(context, 125.0, 199.0);
    CGContextMoveToPoint(context, 125.0, 199.0);
    CGContextAddCurveToPoint(context, 125.0, 203.0, 130.0, 203.0, 130.0, 199.0);
    CGContextMoveToPoint(context, 130.0, 199.0);
    CGContextAddCurveToPoint(context, 130.0, 196.0, 135.0, 196.0, 135.0, 200.0);
    
    CGContextMoveToPoint(context, 136.0, 199.0);
    CGContextAddLineToPoint(context, 142.0, 199.0);
    
    CGContextMoveToPoint(context, 158.0, 199.0);
    CGContextAddLineToPoint(context, 180.0, 199.0);


#pragma mark - lines between dc bus 1 - hot bus 1

    CGContextMoveToPoint(context, 76.0, 67.0);
    CGContextAddLineToPoint(context, 76.0, 75.0);
    CGContextMoveToPoint(context, 76.0, 86.0);
    CGContextAddLineToPoint(context, 76.0, 96.0);

#pragma mark - lines between hot bus 1 - backup essential bus
    CGContextMoveToPoint(context, 85.0, 113.0);
    CGContextAddLineToPoint(context, 85.0, 120.0);
    CGContextMoveToPoint(context, 85.0, 128.0);
    CGContextAddLineToPoint(context, 85.0, 136.0);

#pragma mark - Lines between backup essential bus
    CGContextMoveToPoint(context, 83.0, 149.0);
    CGContextAddLineToPoint(context, 83.0, 156.0);
    CGContextMoveToPoint(context, 83.0, 161.0);
    CGContextAddLineToPoint(context, 83.0, 167.0);
    
    CGContextMoveToPoint(context, 118.0, 149.0);
    CGContextAddLineToPoint(context, 118.0, 156.0);
    CGContextMoveToPoint(context, 118.0, 161.0);
    CGContextAddLineToPoint(context, 118.0, 167.0);

#pragma mark - lines between backup essential bus and backup hot bus    
    CGContextMoveToPoint(context,121.0, 143.0);
    CGContextAddLineToPoint(context, 142.0, 143.0);

//lines from central bus to hot bus 2
    CGContextMoveToPoint(context, 165.0, 66.0);
    CGContextAddLineToPoint(context, 165.0, 71.0);
    CGContextMoveToPoint(context, 164.0, 70.0);
    CGContextAddLineToPoint(context, 206.0, 70.0);
    CGContextMoveToPoint(context, 205.0, 69.0);
    CGContextAddLineToPoint(context, 205.0, 76.0);
    
    CGContextMoveToPoint(context, 205.0, 86.0);
    CGContextAddLineToPoint(context, 205.0, 96.0);

//lines from central bus to gpu
    CGContextMoveToPoint(context, 142.0, 66.0);
    CGContextAddLineToPoint(context, 142.0, 74.0);
    CGContextMoveToPoint(context, 142.0, 79.0);
    CGContextAddLineToPoint(context, 142.0, 87.0);
    CGContextMoveToPoint(context, 143.0, 86.0);
    CGContextAddLineToPoint(context, 134.0, 86.0);
    
//lines to batteries from hot buses
    
    CGContextMoveToPoint(context, 117.0, 103.0);
    CGContextAddLineToPoint(context, 132.0, 103.0);
    CGContextMoveToPoint(context, 131.0, 102.0);
    CGContextAddLineToPoint(context, 131.0, 108.0);
    
    CGContextMoveToPoint(context, 181.0, 102.0);
    CGContextAddLineToPoint(context, 166.0, 102.0);
    
    CGContextMoveToPoint(context, 167.0, 101.0);
    CGContextAddLineToPoint(context, 167.0, 108.0);
    
    CGContextMoveToPoint(context, 177.0, 149.0);
    CGContextAddLineToPoint(context, 177.0, 155.0);
    CGContextStrokePath(context);

    
    [self drawBattery:CGPointMake(124.0, 108.0) color: gray context:context];
    [self drawBattery:CGPointMake(160.0, 108.0) color: gray context:context];
    [self drawBattery:CGPointMake(170.0, 155.0) color: gray context:context];
    
    //remaining contactors
    
    //btc 1
    [self drawTriangleAtPoint:CGPointMake(94.0, 58.0) orientation:up color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(113.0, 58.0) orientation:up color:gray context:context];
    
    //btc 2
    [self drawTriangleAtPoint:CGPointMake(183.0, 58.0) orientation:up color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(201.0, 58.0) orientation:up color:gray context:context];
    
    //bc 1
    [self drawTriangleAtPoint:CGPointMake(75.0, 70.0) orientation:right color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(75.0, 86.0) orientation:right color:gray context:context];
    
    //bc 2
    [self drawTriangleAtPoint:CGPointMake(206.0, 71.0) orientation:left color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(206.0, 86.0) orientation:left color:gray context:context];
    
    //gpc
    [self drawTriangleAtPoint:CGPointMake(143.0, 69.0) orientation:left color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(143.0, 79.0) orientation:left color:gray context:context];
    
    //bbc
    [self drawTriangleAtPoint:CGPointMake(84.0, 115.0) orientation:right color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(84.0, 128.0) orientation:right color:gray context:context];
    
    //ebc 1
    [self drawTriangleAtPoint:CGPointMake(70.0, 142.0) orientation:right color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(70.0, 158.0) orientation:right color:gray context:context];
    
    //line opposite of ebc1
    CGContextStrokeEllipseInRect(context, CGRectMake(54.0, 143.0, 4.0, 4.0));
    CGContextStrokeEllipseInRect(context, CGRectMake(54.0, 159.0, 4.0, 4.0));
    
    
    //ebc 2
    [self drawTriangleAtPoint:CGPointMake(228.0, 142.0) orientation:left color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(228.0, 158.0) orientation:left color:gray context:context];
    
    //line opposite of ebc2
    CGContextStrokeEllipseInRect(context, CGRectMake(240.0, 144.0, 4.0, 4.0));
    CGContextStrokeEllipseInRect(context, CGRectMake(240.0, 159.0, 4.0, 4.0));
    
    
    //sbc 1
    [self drawTriangleAtPoint:CGPointMake(31.0, 113.0) orientation:right color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(31.0, 133.0) orientation:right color:gray context:context];
    
    //sbc 2
    [self drawTriangleAtPoint:CGPointMake(269.0, 113.0) orientation:left color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(269.0, 133.0) orientation:left color:gray context:context];
    
    //eic
    [self drawTriangleAtPoint:CGPointMake(137.0, 198.0) orientation:up color:gray context:context];
    [self drawTriangleAtPoint:CGPointMake(158.0, 198.0) orientation:up color:gray context:context];
    
    //bb1
    [self drawTriangleAtPoint:CGPointMake(84.0, 161.0) orientation:left color:gray context:context];
    
    //bb2
    [self drawTriangleAtPoint:CGPointMake(119.0, 161.0) orientation:left color:gray context:context];
    
         
    //set up for green outlines
    CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 1.0); //green stroke color for drawing bus outlines.
        
    //generator 1
    CGContextFillEllipseInRect(context, CGRectMake(19.0, 0.0, 30.0, 30.0));
    //generator 3
    CGContextFillEllipseInRect(context, CGRectMake(56.0, 0.0, 30.0, 30.0));
    //apu generator75.0
    CGContextFillEllipseInRect(context, CGRectMake(134.0, 0.0, 30.0, 30.0));
    //generator 2
    CGContextFillEllipseInRect(context, CGRectMake(215.0, 0.0, 30.0, 30.0));
    //generator 4
    CGContextFillEllipseInRect(context, CGRectMake(253.0, 0.0, 30.0, 30.0));
    
    
 */   
    
    if(gpuPowered == YES){
        [self drawGpuWithPower: TRUE inContext: context]; 
    }
    else {
        [self drawGpuWithPower: FALSE inContext: context]; 
    }
    
    
    CGFloat radius = 4.0;
    //dc bus 1.
    if(dcBus1Powered == YES){
        [self drawRoundedRect:dc1rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:dc1rect cornerRadius:radius color: gray drawType:fill context:context];
        
    }
    
    //central DC Bus
    if(centralDcBusPowered == YES){
        [self drawRoundedRect:centralDCBusRect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:centralDCBusRect cornerRadius:radius color: gray drawType:fill context:context];
        
    }
    
    //dc bus 2
    if(dcBus2Powered == YES) {
        [self drawRoundedRect:dc2Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:dc2Rect cornerRadius:radius color: gray drawType:fill context:context];
    }
    
    //hot bus 1.
    if(hotBus1Powered == YES){
        [self drawRoundedRect:hb1Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:hb1Rect cornerRadius:radius color: gray drawType:fill context:context];
        
    }
    
    //hot bus 2.
    if(hotBus2Powered == YES) {
        [self drawRoundedRect:hb2Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:hb2Rect cornerRadius:radius color: gray drawType:fill context:context];
    }
    
    //backup essential bus
    if(backupEssBusPowered == YES) {
        [self drawRoundedRect:beRect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:beRect cornerRadius:radius color: gray drawType:fill context:context];
    }
     
    //backup hot bus
    if(backupHotBusPowered == YES) {
        [self drawRoundedRect:bhbRect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:bhbRect cornerRadius:radius color: gray drawType:fill context:context];
    }
     
    //backup bus 1
    if(backupBus1Powered == YES) {
        [self drawRoundedRect:bb1Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:bb1Rect cornerRadius:radius color: gray drawType:fill context:context];
    }
    
    //backup bus 2
    if (backupBus2Powered == YES){
        [self drawRoundedRect:bb2Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:bb2Rect cornerRadius:radius color: gray drawType:fill context:context];
    }
    
    //shed bus 1
    if(shedBus1Powered == YES){
        [self drawRoundedRect:sb1Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:sb1Rect cornerRadius:radius color: gray drawType:fill context:context];
    }
     
    //shed bus 2
    if(shedBus2Powered == YES){
        [self drawRoundedRect:sb2Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:sb2Rect cornerRadius:radius color: gray drawType:fill context:context];
    }
    
    //essential bus 1
    if(essBus1Powered == YES){
        [self drawRoundedRect:eb1Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:eb1Rect cornerRadius:radius color: gray drawType:fill context:context];
    }
      
    //essential bus 2
    if(essBus2Powered == YES){
        [self drawRoundedRect:eb2Rect cornerRadius:radius color: gray drawType:fillStroke context:context];
    }
    else {
        [self drawRoundedRect:eb2Rect cornerRadius:radius color: gray drawType:fill context:context];
    }
      
    CGContextEndTransparencyLayer(context);
    //this call will disable shadow drawing for any further drawing code.
    CGContextRestoreGState(context);
    
    //draws text labels on each bus

    CGRect viewBounds = self.bounds;
    CGContextTranslateCTM(context, 0, viewBounds.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(context, 0.5);
    CGContextSelectFont(context, "Helvetica", 8.0, kCGEncodingMacRoman);
    CGContextSetCharacterSpacing(context, 2.0);
    CGContextSetTextDrawingMode(context, kCGTextStroke);
    CGContextShowTextAtPoint(context, dc1rect.origin.x + 23.0, 178.0, "DC 1", 4);
    CGContextShowTextAtPoint(context, dc2Rect.origin.x + 23.0, 178.0, "DC 2", 4);
    CGContextShowTextAtPoint(context, centralDCBusRect.origin.x + 4.0, 178.0, "Central", 7);
    CGContextShowTextAtPoint(context, hb1Rect.origin.x + 12.0 ,133.0, "Hot 1",5);
    CGContextShowTextAtPoint(context, hb2Rect.origin.x + 12.0 ,133.0, "Hot 2",5);
    CGContextShowTextAtPoint(context, beRect.origin.x + 5.0, 95.0, "B. Ess.", 7);
    CGContextShowTextAtPoint(context, bhbRect.origin.x + 5.0, 95.0, "B. Hot", 6);
    CGContextShowTextAtPoint(context, bb1Rect.origin.x + 2.0, 65.5, "Bck 1", 5);
    CGContextShowTextAtPoint(context, bb2Rect.origin.x + 2.0, 65.5, "Bck 2", 5);
    CGContextShowTextAtPoint(context, eb1Rect.origin.x + 13.0, 38.5, "Ess 1", 5);
    CGContextShowTextAtPoint(context, eb2Rect.origin.x + 13.0, 38.5, "Ess 2", 5);
    CGContextShowTextAtPoint(context, sb1Rect.origin.x + 3.0, 38.5, "Shd 1", 5);
    CGContextShowTextAtPoint(context, sb2Rect.origin.x + 3.0, 38.5, "Shd 2", 5);
}

-(void)powerAllBuses {
    self.dcBus1Powered = YES;
    self.dcBus2Powered = YES;
    self.centralDcBusPowered = YES;
    self.backupEssBusPowered = YES;
    self.backupHotBusPowered = YES;
    self.hotBus1Powered = YES;
    self.hotBus2Powered = YES;
    self.backupBus1Powered = YES;
    self.backupBus2Powered = YES;
    self.essBus1Powered = YES;
    self.essBus2Powered = YES;
    self.shedBus1Powered = YES;
    self.shedBus2Powered = YES;
    [self setNeedsDisplay];
}


-(void)depowerAllBuses {
    self.dcBus1Powered = NO;
    self.dcBus2Powered = NO;
    self.centralDcBusPowered = NO;
    self.backupEssBusPowered = NO;
    self.backupHotBusPowered = NO;
    self.hotBus1Powered = NO;
    self.hotBus2Powered = NO;
    self.backupBus1Powered = NO;
    self.backupBus2Powered = NO;
    self.essBus1Powered = NO;
    self.essBus2Powered = NO;
    self.shedBus1Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];
}


// power 11 buses A config (batteries auto, apu start w/battery , less than 3 generators)
-(void)powerElevenBusesA {
    self.dcBus1Powered = YES;
    self.dcBus2Powered = YES;
    self.centralDcBusPowered = YES;
    self.backupEssBusPowered = YES;
    self.backupHotBusPowered = YES;
    self.hotBus1Powered = YES;
    self.hotBus2Powered = YES;
    self.backupBus1Powered = YES;
    self.backupBus2Powered = YES;
    self.essBus1Powered = YES;
    self.essBus2Powered = YES;
    self.shedBus1Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];
}

// power 11 buses B config (electrical emergency abnormal)
-(void)powerElecAbnormBuses {
    self.dcBus1Powered = YES;
    self.dcBus2Powered = YES;
    self.centralDcBusPowered = YES;
    self.backupEssBusPowered = YES;
    self.backupHotBusPowered = YES;
    self.hotBus1Powered = YES;
    self.hotBus2Powered = YES;
    self.backupBus1Powered = NO;
    self.backupBus2Powered = NO;
    self.essBus1Powered = YES;
    self.essBus2Powered = YES;
    self.shedBus1Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];    
}

//power 10 buses (gpu selected, apu start w/gpu)
-(void)powerGroundOpsBuses {
    self.dcBus1Powered = YES;
    self.dcBus2Powered = YES;
    self.centralDcBusPowered = YES;
    self.backupEssBusPowered = NO;
    self.backupHotBusPowered = YES;
    self.hotBus1Powered = YES;
    self.hotBus2Powered = YES;
    self.backupBus1Powered = NO;
    self.backupBus2Powered = NO;
    self.essBus1Powered = YES;
    self.essBus2Powered = YES;
    self.shedBus1Powered = YES;
    self.shedBus2Powered = YES;
    [self setNeedsDisplay];
}

//power 8 buses (electrical ess xfr fail with DC1 powered)
-(void)powerElecEssXfrFailBusesOption1{
    self.dcBus1Powered = YES;
    self.dcBus2Powered = NO;
    self.centralDcBusPowered = YES;
    self.backupEssBusPowered = NO;
    self.backupHotBusPowered = YES;
    self.hotBus1Powered = YES;
    self.hotBus2Powered = YES;
    self.backupBus1Powered = NO;
    self.backupBus2Powered = NO;
    self.essBus1Powered = YES;
    self.essBus2Powered = YES;
    self.shedBus1Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];    
}

//power 8 buses (electrical ess xfr fail with DC2 powered)
-(void)powerElecEssXfrFailBusesOption2 {
    self.dcBus1Powered = NO;
    self.dcBus2Powered = YES;
    self.centralDcBusPowered = YES;
    self.backupEssBusPowered = NO;
    self.backupHotBusPowered = YES;
    self.hotBus1Powered = YES;
    self.hotBus2Powered = YES;
    self.backupBus1Powered = NO;
    self.backupBus2Powered = NO;
    self.essBus1Powered = YES;
    self.essBus2Powered = YES;
    self.shedBus1Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];

}


//power 7 ess buses (essential power configuration)
-(void)powerEssBuses{
    self.dcBus1Powered = NO;
    self.dcBus2Powered = NO;
    self.centralDcBusPowered = YES;
    self.backupEssBusPowered = YES;
    self.backupHotBusPowered = YES;
    self.hotBus1Powered = YES;
    self.hotBus2Powered = YES;
    self.backupBus1Powered = NO;
    self.backupBus2Powered = NO;
    self.essBus1Powered = YES;
    self.essBus2Powered = YES;
    self.shedBus1Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];
}

//power 3 buses (cold airplane)
-(void)powerColdAirplaneBuses{
    self.dcBus1Powered = NO;
    self.dcBus2Powered = NO;
    self.centralDcBusPowered = NO;
    self.backupEssBusPowered = NO;
    self.backupHotBusPowered = YES;
    self.hotBus1Powered = YES;
    self.hotBus2Powered = YES;
    self.backupBus1Powered = NO;
    self.backupBus2Powered = NO;
    self.essBus1Powered = NO;
    self.essBus2Powered = NO;
    self.shedBus1Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];
}

-(void)depowerShedBuses {
    self.shedBus1Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];
}

-(void)powerShedBuses {
    self.shedBus1Powered = YES;
    self.shedBus2Powered = YES;
    [self setNeedsDisplay];
}

-(void)depowerSameSideBus1 {
    self.dcBus1Powered = NO;
    self.shedBus1Powered = NO;
    [self setNeedsDisplay];

}

-(void)depowerSameSideBus2 {
    self.dcBus2Powered = NO;
    self.shedBus2Powered = NO;
    [self setNeedsDisplay];
 }

-(void)displayGPUPowerIndication {
    self.gpuPowered = YES;                 
    [self setNeedsDisplay];
}


-(void)hideGPUPowerIndication {
    self.gpuPowered = NO;                 
    [self setNeedsDisplay];
}




#pragma mark -
#pragma mark - Methods for Displaying individual bus green outlines

-(void)selectDCBus1PowerSymbol {
    [desiredBus setString: @"dCBus1PowerSymbol"];
    self.dcBus1Powered = YES;
    [self setNeedsDisplay];
    
    if ([desiredBus isEqualToString: selectedBus] == FALSE){
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"dCBus1PowerSymbol"];
}                            

-(void)selectDCBus2PowerSymbol {
    [desiredBus setString: @"dCBus2PowerSymbol"];
    self.dcBus2Powered = YES;
    [self setNeedsDisplay];

    if ([desiredBus isEqualToString: selectedBus] == FALSE){
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"dCBus2PowerSymbol"];
}

-(void)selectCentralBusPowerSymbol {
    [desiredBus setString: @"centralBusPowerSymbol"];
    self.centralDcBusPowered = YES;
    [self setNeedsDisplay];
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"centralBusPowerSymbol"];
}

-(void)selectHotBus1Symbol {
    [desiredBus setString: @"hotBus1Symbol"];
    self.hotBus1Powered = YES;
    [self setNeedsDisplay];    
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"hotBus1Symbol"];
}

-(void)selectHotBus2Symbol {
    [desiredBus setString: @"hotBus2Symbol"];
    self.hotBus2Powered = YES;
    [self setNeedsDisplay];
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"hotBus2Symbol"];
}

-(void)selectBackupEssBusSymbol {
    [desiredBus setString: @""];
    self.backupEssBusPowered = YES;
    [self setNeedsDisplay];    
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"backupEssBusSymbol"];
}

-(void)selectBackupHotBusSymbol {
    [desiredBus setString: @"backupHotBusSymbol"];
    self.backupHotBusPowered = YES;
    [self setNeedsDisplay];    
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"backupHotBusSymbol"];
}

-(void)selectBackupBus1Symbol {
    [desiredBus setString: @"backupBus1Symbol"];
    self.backupBus1Powered = YES;
    [self setNeedsDisplay];    
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    
    [selectedBus setString: @"backupBus1Symbol"];
}

-(void)selectBackupBus2Symbol {
    [desiredBus setString: @"backupBus2Symbol"];
    self.backupBus2Powered = YES;
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    
    [selectedBus setString: @"backupBus2Symbol"];
}

-(void)selectShedBus1Symbol {
    [desiredBus setString: @"shedBus1Symbol"];
    self.shedBus1Powered = YES;
    [self setNeedsDisplay];    
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"shedBus1Symbol"];
}

-(void)selectShedBus2Symbol {
    [desiredBus setString: @"shedBus2Symbol"];
    self.shedBus2Powered = YES;
    [self setNeedsDisplay]; 
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }    
    [selectedBus setString: @"shedBus2Symbol"];
}

-(void)selectEssBus1Symbol {
    [desiredBus setString: @"essBus1Symbol"];
    self.essBus1Powered = YES;
    [self setNeedsDisplay];    
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }    
    [selectedBus setString: @"essBus1Symbol"];
}

-(void)selectEssBus2Symbol {
    [desiredBus setString: @"essBus2Symbol"];
    self.essBus2Powered = YES;
    [self setNeedsDisplay];    
    if([desiredBus isEqualToString: selectedBus] == FALSE) {
        NSLog(@"desiredBus != selectedBus");
        [self didSelectAnotherBus];
    }
    [selectedBus setString: @"essBus2Symbol"];
}


-(void)didSelectAnotherBus {
    NSString *bus = [NSString stringWithString: selectedBus];
    
    if ([bus isEqualToString: @"dCBus1PowerSymbol"]) 
        self.dcBus1Powered = NO;
    
    else if ([bus isEqualToString: @"dCBus2PowerSymbol"])
        self.dcBus2Powered = NO;
    
    else if ([bus isEqualToString: @"essBus1Symbol"])
        self.essBus1Powered = NO;
    
    else if ([bus isEqualToString: @"essBus2Symbol"])
        self.essBus2Powered = NO;

    else if ([bus isEqualToString: @"shedBus1Symbol"])
        self.shedBus1Powered = NO;

    else if ([bus isEqualToString: @"shedBus2Symbol"])
        self.shedBus2Powered = NO;

    else if ([bus isEqualToString: @"hotBus1Symbol"])
        self.hotBus1Powered = NO;

    else if ([bus isEqualToString: @"hotBus2Symbol"])
        self.hotBus2Powered = NO;

    else if ([bus isEqualToString: @"backupEssBusSymbol"])
        self.backupEssBusPowered = NO;

    else if ([bus isEqualToString: @"backupHotBusSymbol"])
        self.backupHotBusPowered = NO;

    else if ([bus isEqualToString: @"centralBusPowerSymbol"])
        self.centralDcBusPowered = NO;

    else if ([bus isEqualToString: @"backupBus1Symbol"])
        self.backupBus1Powered = NO;

    else if ([bus isEqualToString: @"backupBus2Symbol"])
        self.backupBus2Powered = NO;

    [self setNeedsDisplay];
    
}


-(void)dealloc {
    CGColorRelease(gray);
    CGColorRelease(green);    
    [selectedBus release];
    [desiredBus release];
    [super dealloc];
}


@end
