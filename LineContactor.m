//
//  LineContactor.m
//  Power Source
//
//  Created by Matthew Hull on 12/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LineContactor.h"

@implementation LineContactorOrientationUp


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 10.0);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 20.0, 0.0);
    CGContextStrokePath(context);
}


-(void)close {
    [UIView beginAnimations: @"close" context: nil];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount: 1];
    self.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    [UIView commitAnimations];
    closed = YES;
}

-(void)open {
    [UIView beginAnimations: @"open" context: nil];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount: 1];
    self.transform = CGAffineTransformMakeTranslation(0.0, -5.0);
    [UIView commitAnimations];
    closed = NO;
}
    


- (void)dealloc {
    [super dealloc];
}

@end


@implementation LineContactorOrientationRight


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 10.0);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 0.0, 20.0);
    CGContextStrokePath(context);
}


-(void)close {
    [UIView beginAnimations: @"close" context: nil];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount: 1];
    self.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    [UIView commitAnimations];
    closed = YES;
}


-(void)open {
    [UIView beginAnimations: @"open" context: nil];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount: 1];
    self.transform = CGAffineTransformMakeTranslation(5.0, 0.0);
    [UIView commitAnimations];
    closed = NO;
}



- (void)dealloc {
    [super dealloc];
}

@end



@implementation LineContactorOrientationLeft

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 10.0);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 0.0, 20.0);
    CGContextStrokePath(context);
}


-(void)close {
    [UIView beginAnimations: @"close" context: nil];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount: 1];
    self.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    [UIView commitAnimations];
    closed = YES;
}

-(void)open {
    [UIView beginAnimations: @"open" context: nil];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount: 1];
    self.transform = CGAffineTransformMakeTranslation(-5.0, 0.0);
    [UIView commitAnimations];
    closed = NO;
}



- (void)dealloc {
    [super dealloc];
}

@end

