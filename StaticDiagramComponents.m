//
//  StaticDiagramComponents.m
//  ERJElectrical
//
//  Created by Matthew Hull on 4/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StaticDiagramComponents.h"
#import "RectConstants.h"


@implementation StaticDiagramComponents


typedef enum Orientation {
    left, right, up, down  
} Orientation;

@synthesize gray;
@synthesize green;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        UIColor *grayShade = [UIColor colorWithRed:131.0/255.0 green:131.0/255.0 blue:131.0/255.0 alpha:1.0];
        gray  = grayShade.CGColor;
        CGColorRetain(gray);
        
        UIColor *greenShade = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
        green = greenShade.CGColor;
        CGColorRetain(green);
        
    }
    return self;
}

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
    
    /*
     0.0, 0.0
     
     
     -1.0, 1.0                1.0, 1.0
     
     
     0.0, 1.0
     
     
     */
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


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, gray);
    CGContextSetLineWidth(context, 2.0);
    
    //shadow
    CGSize shadowOffset = CGSizeMake (5,  5);
    CGContextSaveGState(context);
    CGContextSetShadow (context, shadowOffset, 4);
    
    CGContextBeginTransparencyLayer(context, NULL);
    
    
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
    
    
// diagram labels
    CGContextEndTransparencyLayer(context);
    //this call will disable shadow drawing for any further drawing code.
    CGContextRestoreGState(context);
    

}


- (void)dealloc
{
    [super dealloc];
    CGColorRelease(gray);
    CGColorRelease(green);
}

@end
