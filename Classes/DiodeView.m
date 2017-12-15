//
//  DiodeView.m
//  ERJElectrical
//
//  Created by Matthew Hull on 9/10/13.
//
//

#import "DiodeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DiodeView
@synthesize strokeColor = _strokeColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    [self setNeedsDisplay];
}

-(UIColor *)strokeColor {
    return _strokeColor;
}


- (void)drawRect:(CGRect)rect {
    
    
    //// Color Declarations
    UIColor *color;
    
    if(!_strokeColor)
        color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    else {
        color = _strokeColor;
    }
    
    //// Triangle Drawing
    UIBezierPath* trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint: CGPointMake(59.5, 3.5)];
    [trianglePath addLineToPoint: CGPointMake(135.5, 52.5)];
    [trianglePath addLineToPoint: CGPointMake(59.5, 103.5)];
    [trianglePath addLineToPoint: CGPointMake(59.5, 3.5)];
    [trianglePath closePath];
    [color setStroke];
    trianglePath.lineWidth = 4;
    [trianglePath stroke];
    
    
    //// Left Line Drawing
    UIBezierPath* leftLinePath = [UIBezierPath bezierPath];
    [leftLinePath moveToPoint: CGPointMake(2.5, 53.5)];
    [leftLinePath addLineToPoint: CGPointMake(58.5, 53.5)];
    [color setStroke];
    leftLinePath.lineWidth = 5;
    [leftLinePath stroke];
    
    
    //// Vertical Line Drawing
    UIBezierPath* verticalLinePath = [UIBezierPath bezierPath];
    [verticalLinePath moveToPoint: CGPointMake(136, 10)];
    [verticalLinePath addLineToPoint: CGPointMake(136, 96)];
    [color setStroke];
    verticalLinePath.lineWidth = 4;
    [verticalLinePath stroke];
    
    
    //// Right horizontal line Drawing
    UIBezierPath* rightHorizontalLinePath = [UIBezierPath bezierPath];
    [rightHorizontalLinePath moveToPoint: CGPointMake(136.5, 52.5)];
    [rightHorizontalLinePath addLineToPoint: CGPointMake(166.5, 52.5)];
    [color setStroke];
    rightHorizontalLinePath.lineWidth = 5;
    [rightHorizontalLinePath stroke];
    
}


@end
