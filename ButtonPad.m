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
      UIImageView *buttonBackground = [[UIImageView alloc] initWithImage:  [UIImage imageNamed: @"buttonPad2.png"]];
      [self addSubview: buttonBackground];
      [buttonBackground release];
      
      
      //button changes 2/17/2010: Subtracted 7 from every button.frame origin.Y value to adjust for smaller buttonPad2.image.
      //if you want to revert to ButtonPad.png, remove all (-7) from the frame(s)
      UIButton *buttonA = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonA.frame = CGRectMake(20.0, 20.0 - 8, 50.0, 50.0);
      [buttonA setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonA setTitle: @"← Main Menu" forState: UIControlStateNormal];
      buttonA.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonA.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonA.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonA setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonA setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      self.button1 = buttonA;
      [self addSubview: button1];
      
      UIButton *buttonB = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonB.frame = CGRectMake(78.0, 20.0 - 8, 50.0, 50.0);
      [buttonB setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonB setTitle: @"Cold Airplane" forState: UIControlStateNormal];
      buttonB.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonB.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonB.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonB setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonB setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonB setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button2 = buttonB;
      [self addSubview: button2];
      
      UIButton *buttonC = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonC.frame = CGRectMake(136.0, 20.0 - 8, 50.0, 50.0);
      [buttonC setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonC setTitle: @"Batteries Auto" forState: UIControlStateNormal];
      buttonC.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonC.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonC.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonC setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonC setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonC setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button3 = buttonC;
      [self addSubview: button3];

      UIButton *buttonD = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonD.frame = CGRectMake(194.0, 20.0 - 8, 50.0, 50.0);
      [buttonD setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonD setTitle: @"Start A.P.U." forState: UIControlStateNormal];
      buttonD.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonD.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonD.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonD setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonD setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonD setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button4 = buttonD;
      [self addSubview: button4];
      
      UIButton *buttonE = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonE.frame = CGRectMake(252.0, 20.0 - 8, 50.0, 50.0);
      [buttonE setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonE setTitle: @"All Gens On" forState: UIControlStateNormal];
      buttonE.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonE.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonE.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonE setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonE setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonE setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button5 = buttonE;
      [self addSubview: button5];
      
      UIButton *buttonF = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonF.frame = CGRectMake(20.0, 79.0 - 8, 50.0, 50.0);
      [buttonF setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonF setTitle: @"Gen 1 Fail" forState: UIControlStateNormal];
      buttonF.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonF.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonF.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonF setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonF setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonF setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button6 = buttonF;
      [self addSubview: button6];
      
      UIButton *buttonG = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonG.frame = CGRectMake(78.0, 79.0 - 8, 50.0, 50.0);
      [buttonG setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonG setTitle: @"Gen 2 Fail" forState: UIControlStateNormal];
      buttonG.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonG.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonG.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonG setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonG setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonG setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button7 = buttonG;
      [self addSubview: button7];

      UIButton *buttonH = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonH.frame = CGRectMake(136.0, 79.0 - 8, 50.0, 50.0);
      [buttonH setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonH setTitle: @"Gen 3 Fail" forState: UIControlStateNormal];
      buttonH.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonH.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonH.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonH setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonH setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonH setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button8 = buttonH;
      [self addSubview: button8];
      
      UIButton *buttonI = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonI.frame = CGRectMake(194.0, 79.0 - 8, 50.0, 50.0);
      [buttonI setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonI setTitle: @"Gen 4 Fail" forState: UIControlStateNormal];
      buttonI.titleLabel.font = [UIFont systemFontOfSize: 11];
      buttonI.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
      buttonI.titleLabel.textAlignment = UITextAlignmentCenter;
      [buttonI setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonI setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonI setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button9 = buttonI;
      [self addSubview: button9];
      
      UIButton *buttonJ = [UIButton buttonWithType: UIButtonTypeCustom];
      buttonJ.frame = CGRectMake(252.0, 79.0 -8, 50.0, 50.0);
      [buttonJ setBackgroundImage: [UIImage imageNamed: @"blackButton.png"] forState: UIControlStateHighlighted];
      [buttonJ setTitle: @"More →" forState: UIControlStateNormal];
      buttonJ.titleLabel.font = [UIFont systemFontOfSize: 11];
      [buttonJ setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
      [buttonJ setTitleColor: [UIColor whiteColor] forState: UIControlStateHighlighted];
      [buttonJ setTitleColor: [UIColor grayColor] forState: UIControlStateDisabled];
      self.button10 = buttonJ;
      [self addSubview: button10];
      
      
      }
    return self;
}


- (void)drawRect:(CGRect)rect { 
       
    
    // Drawing code
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
