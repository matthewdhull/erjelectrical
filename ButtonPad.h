//
//  ButtonPad.h
//  Power Source
//
//  Created by Matthew Hull on 12/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface ButtonPad : UIView {
    BOOL isDisplayed;
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
    UIButton *button6;
    UIButton *button7;
    UIButton *button8;
    UIButton *button9;
    UIButton *button10;

    


}

@property (nonatomic, retain) UIButton *button1;
@property (nonatomic, retain) UIButton *button2;
@property (nonatomic, retain) UIButton *button3;
@property (nonatomic, retain) UIButton *button4;
@property (nonatomic, retain) UIButton *button5;
@property (nonatomic, retain) UIButton *button6;
@property (nonatomic, retain) UIButton *button7;
@property (nonatomic, retain) UIButton *button8;
@property (nonatomic, retain) UIButton *button9;
@property (nonatomic, retain) UIButton *button10;

@property BOOL isDisplayed;

//Deprecated 3/9/2010. These methods were used to display and hide button Pad.
//-(void)slideUp;

//-(void)slideDown;

@end
