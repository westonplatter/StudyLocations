//
//  studyLocationsAppDelegate.h
//  studyLocations
//
//  Created by westy on 3/27/11.
//  Copyright 2011 Weston Platter. All rights reserved.
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

