//
//  detailViewController.m
//  studyLocations
//
//  Created by westy on 3/27/11.
//  Copyright 2011 Weston Platter. All rights reserved.
//

#import "detailViewController.h"

@implementation detailViewController
@synthesize detailDictionary, err;
@synthesize detailTitle, detailDescription, detailImage, detailAddress, detailTag;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Filled DetailViewController with data.plist info
    NSString *dTitle        =   [detailDictionary objectForKey:@"title"];
    NSString *dDescription  =   [detailDictionary objectForKey:@"description"];
    NSString *dAddress      =   [detailDictionary objectForKey:@"address"];
    NSString *dImage        =   [detailDictionary objectForKey:@"image"];
    NSString *dTag          =   [detailDictionary objectForKey:@"tag"];
    
    [self.detailTitle           setText:    dTitle];
    [self.detailDescription     setText:    dDescription];
    [self.detailAddress         setText:    dAddress];
    [self.detailImage           setImage:   [UIImage imageNamed:dImage]];
    [self.detailTag             setText:    dTag];
    
    if ([err isEqualToString:@"true" ]) {
        NSLog(@"from Detail = %@", dTitle);
        NSLog(@"- title = %@", dTitle);
        NSLog(@"- description = %@", dDescription);
        NSLog(@"- image %@", dImage);
        NSLog(@"- tag %@", dTag);
    
    }

	//self.navigationItem.title = @"Detail View";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
