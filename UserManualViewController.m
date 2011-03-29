//
//  UserManualViewController.m
//  Power Source
//
//  Created by Matthew Hull on 3/8/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "UserManualViewController.h"


@implementation UserManualViewController
@synthesize manualArray;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    

    
    NSString *path1 = [[NSBundle mainBundle] pathForResource: @"ERJElecSysUserManual" ofType: @"html"];
    UIViewController *firstController = [self webViewControllerWithFile: path1 title: @"Introduction"];
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource: @"InteractiveMode" ofType: @"html"];
    UIViewController *secondController = [self webViewControllerWithFile: path2 title: @"Interactive Mode"];
    
    NSString *path3 = [[NSBundle mainBundle] pathForResource: @"PowerSourceListMode" ofType: @"html"];
    UIViewController *thirdController = [self webViewControllerWithFile: path3 title: @"Pwr Src List Mode"];
    
    NSString *path4 = [[NSBundle mainBundle] pathForResource: @"ScenarioGuide" ofType: @"html"];
    UIViewController *fourthController = [self webViewControllerWithFile: path4 title: @"Scenario Guide"];
    
    NSString *path5 = [[NSBundle mainBundle] pathForResource: @"Contact" ofType: @"html"];
    UIViewController *fifthController = [self webViewControllerWithFile: path5 title: @"Contact"];
    
    NSString *path6 = [[NSBundle mainBundle] pathForResource: @"RWDifferences" ofType: @"html"];
    UIViewController *sixthController = [self webViewControllerWithFile: path6 title: @"R/W Differences"];
    
    NSString *path7 = [[NSBundle mainBundle] pathForResource: @"LexiconLimitations" ofType: @"html"];
    UIViewController *seventhController = [self webViewControllerWithFile: path7 title: @"Lexicon / Limitations"];
    
    
 NSArray *array = [[NSArray alloc] initWithObjects: firstController, secondController, 
 thirdController, fourthController, sixthController, 
 seventhController, fifthController, nil];
 
 [firstController release];
 [secondController release];
 [thirdController release];
 [fourthController release];
 [fifthController release];
 [sixthController release];
 [seventhController release];
 
 
 self.manualArray = array;
 [array release];
 
 [super viewDidLoad];
 
}



//allocates and initializes a view controller with a webview loaded with an html document.
//UIViewController must be released.
-(UIViewController *)webViewControllerWithFile:(NSString *)path title:(NSString *)titleString{
    
    CGRect webViewFrame = CGRectMake(0.0, 0.0, 320.0, 460.0);
    UIViewController *webViewController = [[UIViewController alloc] init];
    webViewController.title = titleString;
    UIWebView *webView = [[UIWebView alloc] initWithFrame: webViewFrame];
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:4 error:nil];
    webView.backgroundColor = [UIColor grayColor];
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSURL *bundlePathURL = [NSURL fileURLWithPath:bundlePath];
    [webView loadHTMLString: htmlString baseURL: bundlePathURL];
    [webViewController.view addSubview: webView];
    [webView release];
    
    //must be released
    return webViewController;
}



-(void)deselectRow {
    NSIndexPath *selection = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:selection animated:YES];
}


 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
     return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger section;
    section = 1;
    return section ;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [self.manualArray count];    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
        return @"              Table Of Contents";
}




// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if(section == 0) {
        if (row == 0) {
            cell.textLabel.text = @"Introduction";        
        }
        if (row == 1) {
            cell.textLabel.text = @"Interactive Mode";
        }
        if (row == 2) {
            cell.textLabel.text = @"Power Source List Mode";
        }
        if (row == 3) {
            cell.textLabel.text = @"Scenario Guide";
        }
        if (row == 4) {
            cell.textLabel.text = @"Real-World Differences";
        }
        if (row == 5) {
            cell.textLabel.text = @"Lexicon/Limitations";
        }
        if (row == 6) {
            cell.textLabel.text = @"Contact";
        }
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *nextController = [self.manualArray objectAtIndex: row];
    [self.navigationController pushViewController: nextController animated: YES];
   }




#pragma mark -
#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    
    self.manualArray = nil;
    
}


- (void)dealloc {
    [manualArray release];
    
    [super dealloc];
}

@end
