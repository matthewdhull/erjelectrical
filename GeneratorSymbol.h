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
    
    //uimage test 1/4/2010
    UIImageView *abnormalGeneratorImage;
    UIImageView *normalGeneratorImage;
    UIImageView *depoweredGeneratorImage;
    enum status generatorStatus;
    
       

}

@property (nonatomic, assign)  id <GeneratorSymbolDelegate> delegate;
@property CGContextRef context;
@property CGRect symbolRect;
@property (nonatomic, retain) UIColor *currentColor;
@property NSInteger powerState;
@property BOOL isPowered;

//uiimagetest 1/4/2010

@property (nonatomic, retain) UIImageView *abnormalGeneratorImage;
@property (nonatomic, retain) UIImageView *normalGeneratorImage;
@property (nonatomic, retain) UIImageView *depoweredGeneratorImage;
@property enum status generatorStatus;


-(void)power;

-(void)depower;

-(void)abnormal;

-(UIImageView *)findVisibleImage;

-(void)fadeOutImage:(UIImageView *)visibleImage fadeInImage:(UIImageView *)hiddenImage;


@end
