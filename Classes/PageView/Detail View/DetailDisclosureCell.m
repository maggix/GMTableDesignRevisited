//
//  DetailDisclosureCell.m
//  ElencoServiziCoreData
//
//  Created by Giovanni Maggini on 10/20/11.
//  Copyright (c) 2011 Giovanni Maggini. All rights reserved.
//

#import "DetailDisclosureCell.h"


@implementation DetailDisclosureCell
@synthesize action;

//
// configureForData:tableView:indexPath:
//
// Invoked when the cell is given data. All fields should be updated to reflect
// the data.
//
// Parameters:
//    dataObject - the dataObject (can be nil for data-less objects)
//    aTableView - the tableView (passed in since the cell may not be in the
//		hierarchy)
//    anIndexPath - the indexPath of the cell
//
- (void)configureForData:(id)dataObject
               tableView:(UITableView *)aTableView
               indexPath:(NSIndexPath *)anIndexPath
{
	[super configureForData:dataObject tableView:aTableView indexPath:anIndexPath];
    if([dataObject isKindOfClass:[NSDictionary class]])
    {
        self.textLabel.text = [dataObject objectForKey:@"label"];
        
//        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.action = [dataObject objectForKey:@"action"];
    }
    else
    {
        self.textLabel.text = dataObject;
    }

}


//- (void)handleSelectionInTableView:(UITableView *)aTableView
//{
//	[super handleSelectionInTableView:aTableView];	
//}




@end
