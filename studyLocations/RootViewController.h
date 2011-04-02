//
//  RootViewController.h
//  studyLocations
//
//  Copyright 2011 Nikola Tesla Patent Producers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	
	NSArray                     *tableDataSource;
	NSString                    *CurrentTitle;
	NSInteger                   *CurrentLevel;
}

@property (nonatomic, retain) NSArray       *tableDataSource;
@property (nonatomic, retain) NSString      *CurrentTitle;
@property (nonatomic, readwrite) NSInteger  *CurrentLevel;


@end
