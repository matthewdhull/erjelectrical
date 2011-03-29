//
//  LineContactor.h
//  Power Source
//
//  Created by Matthew Hull on 12/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LineContactorOrientationUp : UIView {

}

-(void)open;


-(void)close;

BOOL closed;

@end


@interface LineContactorOrientationRight: UIView {
}

-(void)open;

-(void)close;

BOOL closed;

@end



@interface LineContactorOrientationLeft: UIView {
}

-(void)open;

-(void)close;

BOOL closed;


@end