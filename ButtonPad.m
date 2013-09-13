//
//  ButtonPad.m
//  Power Source
//
//  Created by Matthew Hull on 12/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ButtonPad.h"


@implementation ButtonPad
@synthesize isDisplayed;
@synthesize button1, button2, button3, button4, button5, button6, button7, button8, button9, button10;



- (id)initWithFrame:(CGRect)frame {

  if (self = [super initWithFrame: frame]) {
      self.backgroundColor = [UIColor clearColor];
//      UIImageView *buttonBackground = [[UIImageView alloc] initWithImage:  [UIImage imageNamed: @"buttonPad2.png"]];
//      [self addSubview: buttonBackground];
//      [buttonBackground release];
      
      UIColor *normalStateColor = [UIColor colorWithRed: 254.0f/255.0f green:254.0f/255.0f blue:254.0f/255.0f alpha: 1.0];
      UIColor *disabledStateColor = [UIColor colorWithRed:45.0f/255.0f green:45.0f/255.0f blue:45.0f/255.0f alpha: 1.0];
      UIColor *highlightedStateColor = [UIColor blueColor];
      
      
      //button changes 2/17/2010: Subtracted 7 from every button.frame origin.Y value to adjust for smaller buttonPad2.image.
      //if you want to revert to ButtonPad.png, remove all (-7) from the frame(s)
      UIButton *buttonA = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonA.frame = CGRectMake(20.0, 20.0 - 8, 50.0, 50.0);
      [buttonA setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonA setTitle: @"← Main Menu" forState: UIControlStateNormal];
      buttonA.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonA.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonA.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonA setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonA setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      self.button1 = buttonA;
      [self addSubview: button1];
      
      UIButton *buttonB = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonB.frame = CGRectMake(78.0, 20.0 - 8, 50.0, 50.0);
      [buttonB setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonB setTitle: @"Cold Airplane" forState: UIControlStateNormal];
      buttonB.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonB.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonB.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonB setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonB setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      [buttonB setTitleColor:  disabledStateColor forState: UIControlStateDisabled];
      self.button2 = buttonB;
      [self addSubview: button2];
      
      UIButton *buttonC = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonC.frame = CGRectMake(136.0, 20.0 - 8, 50.0, 50.0);
      [buttonC setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonC setTitle: @"Batteries Auto" forState: UIControlStateNormal];
      buttonC.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonC.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonC.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonC setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonC setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      [buttonC setTitleColor: disabledStateColor forState: UIControlStateDisabled];
      self.button3 = buttonC;
      [self addSubview: button3];

      UIButton *buttonD = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonD.frame = CGRectMake(194.0, 20.0 - 8, 50.0, 50.0);
      [buttonD setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonD setTitle: @"Start A.P.U." forState: UIControlStateNormal];
      buttonD.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonD.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonD.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonD setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonD setTitleColor: highlightedStateColor  forState: UIControlStateHighlighted];
      [buttonD setTitleColor: disabledStateColor forState: UIControlStateDisabled];
      self.button4 = buttonD;
      [self addSubview: button4];
      
      UIButton *buttonE = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonE.frame = CGRectMake(252.0, 20.0 - 8, 50.0, 50.0);
      [buttonE setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonE setTitle: @"All Gens On" forState: UIControlStateNormal];
      buttonE.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonE.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonE.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonE setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonE setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      [buttonE setTitleColor: disabledStateColor forState: UIControlStateDisabled];
      self.button5 = buttonE;
      [self addSubview: button5];
      
      UIButton *buttonF = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonF.frame = CGRectMake(20.0, 79.0 - 8, 50.0, 50.0);
      [buttonF setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonF setTitle: @"Gen 1 Fail" forState: UIControlStateNormal];
      buttonF.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonF.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonF.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonF setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonF setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      [buttonF setTitleColor: disabledStateColor forState: UIControlStateDisabled];
      self.button6 = buttonF;
      [self addSubview: button6];
      
      UIButton *buttonG = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonG.frame = CGRectMake(78.0, 79.0 - 8, 50.0, 50.0);
      [buttonG setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonG setTitle: @"Gen 2 Fail" forState: UIControlStateNormal];
      buttonG.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonG.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonG.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonG setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonG setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      [buttonG setTitleColor: disabledStateColor forState: UIControlStateDisabled];
      self.button7 = buttonG;
      [self addSubview: button7];

      UIButton *buttonH = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonH.frame = CGRectMake(136.0, 79.0 - 8, 50.0, 50.0);
      [buttonH setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonH setTitle: @"Gen 3 Fail" forState: UIControlStateNormal];
      buttonH.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonH.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonH.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonH setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonH setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      [buttonH setTitleColor: disabledStateColor forState: UIControlStateDisabled];
      self.button8 = buttonH;
      [self addSubview: button8];
      
      UIButton *buttonI = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonI.frame = CGRectMake(194.0, 79.0 - 8, 50.0, 50.0);
      [buttonI setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonI setTitle: @"Gen 4 Fail" forState: UIControlStateNormal];
      buttonI.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonI.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
      buttonI.titleLabel.textAlignment = NSTextAlignmentCenter;
      [buttonI setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonI setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      [buttonI setTitleColor: disabledStateColor forState: UIControlStateDisabled];
      self.button9 = buttonI;
      [self addSubview: button9];
      
      UIButton *buttonJ = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonJ.frame = CGRectMake(252.0, 79.0 -8, 50.0, 50.0);
      [buttonJ setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonJ setTitle: @"More →" forState: UIControlStateNormal];
      buttonJ.titleLabel.font = [UIFont systemFontOfSize: 11];
      [buttonJ setTitleColor: normalStateColor forState: UIControlStateNormal];
      [buttonJ setTitleColor: highlightedStateColor forState: UIControlStateHighlighted];
      [buttonJ setTitleColor: disabledStateColor forState: UIControlStateDisabled];
      self.button10 = buttonJ;
      [self addSubview: button10];
      
      
      }
    return self;
}


- (void)drawRect:(CGRect)rect { 
    //// Color Declarations
    UIColor* keyGray = [UIColor colorWithRed: 0.282 green: 0.282 blue: 0.282 alpha: 1];
    UIColor* keyboardBkgroundBlack = [UIColor colorWithRed: 0.063 green: 0.063 blue: 0.063 alpha: 1];
    
    //// background rectangle Drawing
    UIBezierPath* backgroundRectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(-0.5, 0.5, 320, 152)];
    [keyboardBkgroundBlack setFill];
    [backgroundRectanglePath fill];
    [[UIColor blackColor] setStroke];
    backgroundRectanglePath.lineWidth = 1;
    [backgroundRectanglePath stroke];
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(20, 12, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectanglePath fill];
    
    
    //// Rounded Rectangle 2 Drawing
    UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(20, 71, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle2Path fill];
    
    
    //// Rounded Rectangle 3 Drawing
    UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(78, 12, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle3Path fill];
    
    
    //// Rounded Rectangle 4 Drawing
    UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(78, 71, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle4Path fill];
    
    
    //// Rounded Rectangle 5 Drawing
    UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(136, 71, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle5Path fill];
    
    
    //// Rounded Rectangle 6 Drawing
    UIBezierPath* roundedRectangle6Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(194, 71, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle6Path fill];
    
    
    //// Rounded Rectangle 7 Drawing
    UIBezierPath* roundedRectangle7Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(252, 71, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle7Path fill];
    
    
    //// Rounded Rectangle 8 Drawing
    UIBezierPath* roundedRectangle8Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(136, 12, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle8Path fill];
    
    
    //// Rounded Rectangle 9 Drawing
    UIBezierPath* roundedRectangle9Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(194, 12, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle9Path fill];
    
    
    //// Rounded Rectangle 10 Drawing
    UIBezierPath* roundedRectangle10Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(252, 12, 50, 50) cornerRadius: 4];
    [keyGray setFill];
    [roundedRectangle10Path fill];
    
    
}


//Deprecated 3/9/2010. These methods were used to display and hide button Pad.
/*
-(void)slideUp {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationDelegate:self];
    
    [self setFrame:CGRectMake(0.0, 337.0, 320.0, 152.0) ];
    [UIView commitAnimations];
    isDisplayed = YES;
}

-(void)slideDown {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationDelegate:self];
    
    [self setFrame: CGRectMake(0.0, 431.0, 320.0, 152.0)];
    [UIView commitAnimations];
    isDisplayed = NO;
}
 */



- (void)dealloc {
    [button1 release];
    [button2 release];
    [button3 release];
    [button4 release];
    [button5 release];
    [button6 release];
    [button7 release];
    [button8 release];
    [button9 release];
    [button10 release];
    [super dealloc];
}


@end
