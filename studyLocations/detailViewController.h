//
//  detailViewController.h
//  studyLocations
//
//  Copyright 2011 Nikola Tesla Patent Producers. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface detailViewController : UIViewController {
 
    NSDictionary            *detailDictionary;
    NSString                *err;
    IBOutlet UILabel        *detailTitle;
    IBOutlet UITextView     *detailDescription;
    IBOutlet UIImageView    *detailImage;
    IBOutlet UITextView     *detailAddress;
    IBOutlet UILabel        *detailTag;
    
}

@property (nonatomic, retain) IBOutlet UILabel      *detailTitle;
@property (nonatomic, retain) IBOutlet UITextView   *detailDescription;
@property (nonatomic, retain) IBOutlet UIImageView  *detailImage;
@property (nonatomic, retain) IBOutlet UITextView   *detailAddress;
@property (nonatomic, retain) IBOutlet UILabel      *detailTag;
@property (nonatomic, retain) NSDictionary          *detailDictionary;
@property (nonatomic, assign) NSString              *err;

@end