//
//  GeneratorSymbol.h
//  Power Source
//
//  Created by Matthew Hull on 12/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define kNormalConfig 0
#define kDepoweredConfig 1
#define kAbnormalConfig 2

enum status { powered, depowered, abnormal };

@protocol GeneratorSymbolDelegate

@required
-(void)generatorIsAbnormal:(id)sender;
-(void)generatorIsNormal:(id)sender;

@end


@interface GeneratorSymbol : UIView {
    
    id <GeneratorSymbolDelegate> delegate;
    CGContextRef context;
    CGRect symbolRect;
    UIColor *currentColor;
    NSInteger powerState;
    BOOL isPowered;
    enum status generatorStatus;

}

@property (nonatomic, assign)  id <GeneratorSymbolDelegate> delegate;
@property CGContextRef context;
@property CGRect symbolRect;
@property (nonatomic, retain) UIColor *currentColor;
@property NSInteger powerState;
@property BOOL isPowered;
@property enum status generatorStatus;


-(void)power;

-(void)depower;

-(void)abnormal;

@end
