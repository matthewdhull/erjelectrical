//
//  LineContactor.h
//  Power Source
//
//  Created by Matthew Hull on 12/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LineContactorOrientationUp : UIView {
    BOOL closed;
}

@property (nonatomic, assign) BOOL closed;

-(void)open;


-(void)close;



@end


@interface LineContactorOrientationRight: UIView {
    BOOL closed;
}

@property (nonatomic, assign) BOOL closed;


-(void)open;

-(void)close;


@end



@interface LineContactorOrientationLeft: UIView {
    BOOL closed;
}

@property (nonatomic, assign) BOOL closed;

-(void)open;

-(void)close;



@end