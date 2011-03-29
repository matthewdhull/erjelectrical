//
//  UserManualViewController.h
//  Power Source
//
//  Created by Matthew Hull on 3/8/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UserManualViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *manualArray;
}   


@property (nonatomic, retain) NSArray *manualArray;


//allocates and initializes a view controller with a webview loaded with an html document.
//UIViewController must be released.
-(UIViewController *)webViewControllerWithFile:(NSString *)path title:(NSString *)titleString;
    
-(void)deselectRow;


@end
