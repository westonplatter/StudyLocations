//
//  studyLocationsAppDelegate.h
//  studyLocations
//
//  Copyright 2011 Nikola Tesla Patent Producers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface studyLocationsAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	
	NSDictionary *data;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) NSDictionary  *data;

@end

