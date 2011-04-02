//
//  studyLocationsAppDelegate.m
//  studyLocations
//
//  Copyright 2011 Nikola Tesla Patent Producers. All rights reserved.
//

#import "studyLocationsAppDelegate.h"

@implementation studyLocationsAppDelegate
@synthesize window, navigationController;
@synthesize data;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // URLs loaded in NSStrings
    NSString *webPath = @"http://www.ke.think602.com/";
    NSString *webPathData = [webPath stringByAppendingFormat:@"webdata.plist"];
    NSString *cxTest = [webPath stringByAppendingFormat:@"test"];
    
    // Test Connection to external server
    // currently, connected to Weston's www.think602.com server
    NSURL     *testURL = [NSURL URLWithString:cxTest];
    NSError   *error;
    NSString  *cxResults = [NSString stringWithContentsOfURL:testURL encoding:NSASCIIStringEncoding error: &error];
    // '&' before & to deference the var once. Otherwise, error will occur 
    
    
    // loads webserver XML file if internet is available; if not, loads local XML file.
    if (cxResults) {
        
        NSLog(@"successfully loaded webserver XML file");
        // connection SUCCESSFUL, load webdata.plist
        
        NSLog(@"webPathData = %@", webPathData);
        
        NSURL *dataURL = [NSURL URLWithString:webPathData];
        NSDictionary *webTempDict = [[NSDictionary alloc] initWithContentsOfURL:dataURL];
        self.data = webTempDict;
        [webTempDict release];
    }
    else {
        
        NSLog(@"\nError = %@ \n\n", error);
        NSLog(@"failed loading webserver XML file ");
        NSLog(@"loading XML file originally distributed with app");
        // connection failed, load local data.plist data
        NSString *Path = [[NSBundle mainBundle] bundlePath];
        NSString *DataPath = [Path stringByAppendingPathComponent:@"data.plist"];
        NSDictionary *tempDict = [[NSDictionary alloc] initWithContentsOfFile:DataPath];
        self.data = tempDict;
        [tempDict release];
    }
    
    NSString *dir = @"on";
    if ([dir isEqualToString:@"on"]) {
        
        // for development purposes, load local XML file
        NSLog(@"successfully loaded local     XML file"); 
        NSString *Path = [[NSBundle mainBundle] bundlePath];
        NSString *DataPath = [Path stringByAppendingPathComponent:@"data.plist"];
        NSDictionary *tempDict = [[NSDictionary alloc] initWithContentsOfFile:DataPath];
        self.data = tempDict;
        [tempDict release];
    }
    
    
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[data release];
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
