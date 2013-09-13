//
//  DiodeView.m
//  ERJElectrical
//
//  Created by Matthew Hull on 9/10/13.
//
//

#import "DiodeView.h"

@implementation DiodeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Triangle Drawing
    UIBezierPath* trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint: CGPointMake(121.5, 213.5)];
    [trianglePath addLineToPoint: CGPointMake(197.5, 262.5)];
    [trianglePath addLineToPoint: CGPointMake(121.5, 313.5)];
    [trianglePath addLineToPoint: CGPointMake(121.5, 213.5)];
    [trianglePath closePath];
    [color setStroke];
    trianglePath.lineWidth = 4;
    [trianglePath stroke];
    
    
    //// Left Line Drawing
    UIBezierPath* leftLinePath = [UIBezierPath bezierPath];
    [leftLinePath moveToPoint: CGPointMake(64.5, 263.5)];
    [leftLinePath addLineToPoint: CGPointMake(120.5, 263.5)];
    [color setStroke];
    leftLinePath.lineWidth = 5;
    [leftLinePath stroke];
    
    
    //// Vertical Line Drawing
    UIBezierPath* verticalLinePath = [UIBezierPath bezierPath];
    [verticalLinePath moveToPoint: CGPointMake(198, 220)];
    [verticalLinePath addLineToPoint: CGPointMake(198, 306)];
    [color setStroke];
    verticalLinePath.lineWidth = 4;
    [verticalLinePath stroke];
    
    
    //// Right horizontal line Drawing
    UIBezierPath* rightHorizontalLinePath = [UIBezierPath bezierPath];
    [rightHorizontalLinePath moveToPoint: CGPointMake(198.5, 262.5)];
    [rightHorizontalLinePath addLineToPoint: CGPointMake(228.5, 262.5)];
    [color setStroke];
    rightHorizontalLinePath.lineWidth = 5;
    [rightHorizontalLinePath stroke];
    
    
    
    
}


@end
