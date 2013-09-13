//
//  Power_SourceAppDelegate.m
//  Power Source
//
//  Created by Matthew Hull on 11/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Power_SourceAppDelegate.h"
#import "NewRootController.h"



@implementation Power_SourceAppDelegate

@synthesize window;
@synthesize rootController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {  
    
       
    rootController  = [[NewRootController alloc] init];
    rootController.view.frame = [[UIScreen mainScreen] bounds];
    [window setRootViewController: rootController];
    [window addSubview: rootController.view];
    [window makeKeyAndVisible];
    
}


- (void)dealloc {
    
    [rootController release];
    [window release];
    [super dealloc];
}

@end





