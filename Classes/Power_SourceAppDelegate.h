//
//  Power_SourceAppDelegate.h
//  Power Source
//
//  Created by Matthew Hull on 11/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewRootController;


@interface Power_SourceAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NewRootController *rootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain)  NewRootController *rootController;

@end