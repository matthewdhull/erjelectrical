//
//  GeneratorBorderDisplay.m
//  ERJElectrical
//
//  Created by Matthew Hull on 9/13/13.
//
//

#import "GeneratorBorderDisplay.h"

@implementation GeneratorBorderDisplay

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //// Color Declarations
    UIColor* color5 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.463 green: 0.467 blue: 0.467 alpha: 1];
    UIColor* color7 = [UIColor colorWithRed: 0.306 green: 0.314 blue: 0.314 alpha: 1];
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(10, 12, 300, 119)];
    [color6 setFill];
    [roundedRectanglePath fill];
    
    
    //// Rounded Rectangle 2 Drawing
    UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(18, 20, 284, 98) cornerRadius: 4];
    [color5 setFill];
    [roundedRectangle2Path fill];
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
    [rectanglePath moveToPoint: CGPointMake(10, 140)];
    [rectanglePath addLineToPoint: CGPointMake(310, 140)];
    [rectanglePath addLineToPoint: CGPointMake(310, 125)];
    [rectanglePath addLineToPoint: CGPointMake(282, 125)];
    [rectanglePath addCurveToPoint: CGPointMake(279, 122) controlPoint1: CGPointMake(282, 125) controlPoint2: CGPointMake(279, 123.2)];
    [rectanglePath addCurveToPoint: CGPointMake(279, 118) controlPoint1: CGPointMake(279, 117.19) controlPoint2: CGPointMake(279, 118)];
    [rectanglePath addLineToPoint: CGPointMake(10, 118)];
    [rectanglePath addLineToPoint: CGPointMake(10, 140)];
    [rectanglePath closePath];
    [color7 setFill];
    [rectanglePath fill];
    
    
    
}
@end
