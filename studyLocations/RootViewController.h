//
//  RootViewController.h
//  studyLocations
//
//  Created by westy on 3/27/11.
//  Copyright 2011 Weston Platter. All rights reserved.
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
