//
//  RootViewController.m
//  studyLocations
//
//  Created by westy on 3/27/11.
//  Copyright 2011 Weston Platter. All rights reserved.
//

#import "RootViewController.h"
#import "detailViewController.h"
#import "studyLocationsAppDelegate.h"

@implementation RootViewController

@synthesize tableDataSource, CurrentTitle, CurrentLevel;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(CurrentLevel == 0) {
		
		//Initialize our table data source
		NSArray *tempArray = [[NSArray alloc] init];
		self.tableDataSource = tempArray;
		
        
        
        // ===========================================================================
        // try the various dictionary sorting methods here
        // ---------------------------------------------------------------------------
        
        NSArray *search = [NSArray arrayWithArray:tempArray];
        NSLog(@"count of search %@",[search count]);
        
        
        // ---------------------------------------------------------------------------
           [tempArray release];
        // ===============================================================================
        
        
        studyLocationsAppDelegate *AppDelegate = (studyLocationsAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.tableDataSource = [AppDelegate.data objectForKey:@"rows"];
		
        // NSLog(@"tableDataSource == %@", self.tableDataSource);
        
        
		self.navigationItem.title = @"Root";
	}
	else 
		self.navigationItem.title = CurrentTitle;	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableDataSource count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	NSDictionary *dictionary = [[NSDictionary alloc] init];
    dictionary = [self.tableDataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [dictionary objectForKey:@"title"];
    
    return cell;
    [dictionary release];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	//Get the dictionary of the selected data source.
    NSDictionary *dictionary = [self.tableDataSource objectAtIndex:indexPath.row];
	
	//Get the children of the present item.
	NSArray *children = [dictionary objectForKey:@"children"];
	
	if([children count] == 0) {
        
        // creat an instance of the DetailViewController
        detailViewController *dvController = [[detailViewController alloc] initWithNibName:@"detailViewController" bundle:[NSBundle mainBundle]];
        
        // pass off the whole dictionary item to the detailController
        dvController.detailDictionary = dictionary;
        dvController.err = @"true";
        
        
        // dictionary SEARCH TESTING
        
        /*
         //Quick NSLog Test
         if (dvController.detailDictionary == NULL) {
         NSLog(@"DVC dictionary == EMPTY");
         }
         else {NSLog(@"DVC dictionary == GOOD");}
         */
        
        [self.navigationController pushViewController:dvController animated:YES];
        
        /*
         
         
         // the following code was used to set DetailViewController Values with this code...
         // within this code meaning, within the TableViewController. This is not good coding
         // practices since we would net to repeat all of the following code if we wanted
         // use the same DetailController, but initiated from a different TableViewController.
         
         // You can see that the same code appears within the DetailViewController. The
         // benefit of placing the code there is that we just need to send the DCV a dictionary
         // item and the DVC will fill in all of its data (rather than passing it each peice
         // of data.
         
         NSString *tempTitle = [dictionary objectForKey:@"title"];
         NSString *tempDescription = [dictionary objectForKey:@"description"];
         NSString *tempAdress = [dictionary objectForKey:@"address"];
         NSString *tempImage = [dictionary objectForKey:@"image"];
         
         [dvController.detailTitle setText: tempTitle];
         [dvController.detailDescription setText:tempDescription];
         [dvController.detailAddress setText:tempAdress];
         [dvController.detailImage setImage:[UIImage imageNamed:tempImage]];
         
         // Set image from URL
         NSString *picture = @"http://www.google.com/images/logos/ps_logo2.png";
         dvController.detailImage.image = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString: picture ]]];
         */
        
        [dvController release];
    }
	else {
		
		//Prepare to tableview.
		RootViewController *rvController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:[NSBundle mainBundle]];
		
		//Increment the Current View
		rvController.CurrentLevel += 1;
		
		//Set the title;
		rvController.CurrentTitle = [dictionary objectForKey:@"title"];
		
		//Push the new table view on the stack
		rvController.tableDataSource = children;
		[self.navigationController pushViewController:rvController animated:YES];
		[rvController release];
	}
}

- (void)dealloc {
    
	[CurrentTitle release];
	[tableDataSource release];
    [super dealloc];
}

@end