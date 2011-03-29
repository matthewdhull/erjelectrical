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

//uiimageview test
@synthesize abnormalGeneratorImage;
@synthesize normalGeneratorImage;
@synthesize depoweredGeneratorImage;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        symbolRect = CGRectMake(0.0, 0.0, 30.0, 30.0);
        
        UIImageView *abnormalImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"abnormalStripes.png"]];
        self.abnormalGeneratorImage = abnormalImage;
        abnormalGeneratorImage.alpha = 0.0;
        [self addSubview: abnormalGeneratorImage];
        [abnormalImage release];
        
        UIImageView *normalImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"normalGeneratorSymbol.png"]];
        self.normalGeneratorImage = normalImage;
        normalGeneratorImage.alpha = 0.0;
        [self addSubview: normalGeneratorImage];
        [normalImage release];
        
        UIImageView *depoweredImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"depoweredGeneratorSymbol.png"]];
        self.depoweredGeneratorImage = depoweredImage;
        depoweredGeneratorImage.alpha = 0.0;
        [self addSubview: depoweredGeneratorImage];
        [depoweredImage release];
    }
    return self;
}





- (void)drawRect:(CGRect)rect {
    
}




-(void)power {
  
        
    [UIImageView beginAnimations: @"Fade Animation" context: nil];
    [UIImageView setAnimationCurve: UIViewAnimationCurveEaseOut];
    [UIImageView setAnimationDuration: 0.5];
    [UIImageView setAnimationRepeatCount: 1];
    if (abnormalGeneratorImage.alpha == 1.0) {
        abnormalGeneratorImage.alpha = 0.0;
    }
    
    if (depoweredGeneratorImage.alpha == 1.0) {
        depoweredGeneratorImage.alpha = 0.0;
    }
    
    normalGeneratorImage.alpha = 1.0;
    [UIImageView commitAnimations];
    
    self.isPowered = YES;
    self.generatorStatus = powered;
    
    [delegate generatorIsNormal:self];
    
   
}

 -(void)depower {
     
     [UIImageView beginAnimations: @"Fade Animation" context: nil];
     [UIImageView setAnimationCurve: UIViewAnimationCurveEaseOut];
     [UIImageView setAnimationDuration: 0.5];
     [UIImageView setAnimationRepeatCount: 1];
     if (normalGeneratorImage.alpha == 1.0) {
         normalGeneratorImage.alpha = 0.0;
     }
     
     if (abnormalGeneratorImage.alpha == 1.0) {
         abnormalGeneratorImage.alpha = 0.0;
     }
     
     depoweredGeneratorImage.alpha = 1.0;
     [UIImageView commitAnimations];
     
     self.isPowered = NO;
     self.generatorStatus = depowered;

     
}

-(void)abnormal {
   
    
    [UIImageView beginAnimations: @"Fade Animation" context: nil];
    [UIImageView setAnimationCurve: UIViewAnimationCurveEaseOut];
    [UIImageView setAnimationDuration: 0.5];
    [UIImageView setAnimationRepeatCount: 1];
    if (normalGeneratorImage.alpha == 1.0) {
        normalGeneratorImage.alpha = 0.0;
    }
    
    if (depoweredGeneratorImage.alpha == 1.0) {
        depoweredGeneratorImage.alpha = 0.0;
    }
    
    abnormalGeneratorImage.alpha = 1.0;
    [UIImageView commitAnimations];
     
    self.isPowered = NO;
    self.generatorStatus = abnormal;
    
    [delegate generatorIsAbnormal:self];
  
}


-(UIImageView *)findVisibleImage {
    UIImageView *image;
    if(normalGeneratorImage.alpha == 1.0) {
        normalGeneratorImage = image;
    }
    else if(abnormalGeneratorImage.alpha == 1.0) {
        abnormalGeneratorImage = image;
    }
    else if (depoweredGeneratorImage.alpha == 1.0) {
        depoweredGeneratorImage = image;
    }
    return image;
}







-(void)fadeOutImage:(UIImageView *)visibleImage fadeInImage:(UIImageView *)hiddenImage {

    [UIImageView beginAnimations: @"Fade Animation" context: nil];
    [UIImageView setAnimationCurve: UIViewAnimationCurveLinear];
    [UIImageView setAnimationDuration: 0.5];
    [UIImageView setAnimationRepeatCount: 1];
    visibleImage.alpha = 0.0;
    hiddenImage.alpha = 1.0;
    [UIImageView commitAnimations];
}



- (void)dealloc {
    [currentColor release];
    
    [abnormalGeneratorImage release];
    [normalGeneratorImage release];
    [depoweredGeneratorImage release];
    [super dealloc];
}


@end
