//
//  GeneratorSymbol.m
//  Power Source
//
//  Created by Matthew Hull on 12/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GeneratorSymbol.h"


@implementation GeneratorSymbol

@synthesize delegate;
@synthesize context;
@synthesize symbolRect;
@synthesize currentColor;
@synthesize powerState;
@synthesize isPowered;
@synthesize generatorStatus;

- (id)initWithFrame:(CGRect)frame {
    if((self =  [super initWithFrame:frame])){ 
        self.backgroundColor = [UIColor clearColor];
        symbolRect = CGRectMake(0.0, 0.0, 30.0, 30.0);
    }
    return self;
}





- (void)drawRect:(CGRect)rect {
    self.context = UIGraphicsGetCurrentContext();
    
    if(self.generatorStatus == depowered) {
        CGContextSetRGBFillColor(context, 200.0/255.0, 200.0/255.0, 200.0/255.0, 1.0);
        CGContextFillEllipseInRect(context, self.symbolRect);
    }
    else if(self.generatorStatus == abnormal){
        //set a clipping ellipse and then draw diagonal red lines.

        CGContextSetRGBFillColor(context, 0.45f, 0.0f, 0.0f, 1.0f);
        CGContextFillEllipseInRect(context, self.symbolRect);
        
        CGContextSaveGState(context);
        CGContextAddEllipseInRect(context, self.symbolRect);
        CGContextClip(context);
        
        CGContextSetRGBStrokeColor(context, 0.7, 0.0, 0.0, 1.0);
        CGContextSetLineWidth(context, 3.0);        

        CGContextMoveToPoint(context, 16.5, 0.0);
        CGContextAddLineToPoint(context, 0.0, 16.5);
        
        CGContextMoveToPoint(context, 26.5, 0.0);
        CGContextAddLineToPoint(context, 0.0, 26.5);
        
        CGContextMoveToPoint(context, 7.0, 30.0);
        CGContextAddLineToPoint(context, 30.0, 7.0);
        
        CGContextMoveToPoint(context, 17.0, 30.0);
        CGContextAddLineToPoint(context, 30.0, 17.0);
        CGContextStrokePath(context);        
        CGContextRestoreGState(context);
    }
    else if(self.generatorStatus == normal) {
        
        CGContextSetRGBFillColor(context, 0.0f, 1.0f, 20.0f/255.0f, 1.0f);
        CGContextFillEllipseInRect(context, self.symbolRect);
        
    }


}




-(void)power {
  
    self.isPowered = YES;
    self.generatorStatus = powered;
    
    [delegate generatorIsNormal:self];
    
    [self setNeedsDisplay];
    
   
}

 -(void)depower {
     self.isPowered = NO;
     self.generatorStatus = depowered;
    [delegate generatorIsNormal:self];     
    [self setNeedsDisplay];
     
}

-(void)abnormal {
    self.isPowered = NO;
    self.generatorStatus = abnormal;
    
    [delegate generatorIsAbnormal:self];
    [self setNeedsDisplay];  
}


- (void)dealloc {
    [currentColor release];
    [super dealloc];
}


@end
