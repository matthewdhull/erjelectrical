//
//  GradientView.m
//  ERJElectrical
//
//  Created by Matthew Hull on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "GradientView.h"



@implementation GradientView

- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame])){
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 1.0, 0.06,  // Start color
        1.0, 1.0, 1.0, 0.65 }; // End color
    
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
    
    CGRect currentBounds = self.bounds;
    CGPoint topLeft = CGPointMake(CGRectGetMinX(currentBounds), 0.0f);
    CGPoint bottomRight = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
    CGContextDrawRadialGradient(currentContext, glossGradient, topLeft, 5.0, bottomRight, 400, kCGGradientDrawsAfterEndLocation);    
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace); 
}

- (void)dealloc
{
    [super dealloc];
}

@end
