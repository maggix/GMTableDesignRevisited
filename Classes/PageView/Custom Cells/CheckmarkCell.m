//
//  CheckmarkCell.m
//  TableDesignRevisited
//
//  Created by Giovanni Maggini on 13/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CheckmarkCell.h"

@implementation CheckmarkCell
@synthesize checked, value;

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
        self.textLabel.text = [(NSDictionary*)dataObject objectForKey:@"label"];
        if([dataObject objectForKey:@"value"])
        {
            self.value = [(NSDictionary*)dataObject objectForKey:@"value"];
        }
        if ([dataObject objectForKey:@"checked"]) {
            
            self.checked = [[(NSDictionary*)dataObject objectForKey:@"checked"] boolValue];
            if (checked)
            {
                self.accessoryType = UITableViewCellAccessoryCheckmark;
            }
        }
    }
    else
    {
        self.textLabel.text = dataObject;
    }
    
}

//- (void)handleSelectionInTableView:(UITableView *)aTableView
//{
//	[super handleSelectionInTableView:aTableView];
//
//    if(self.accessoryType == UITableViewCellAccessoryCheckmark)
//    {
//        self.accessoryType = UITableViewCellAccessoryNone;
//    }
//    else if(self.accessoryType == UITableViewCellAccessoryNone)
//    {
//        self.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
//}

/*
 //http://developer.apple.com/library/ios/#documentation/UserExperience/Conceptual/TableView_iPhone/ManageSelections/ManageSelections.html#//apple_ref/doc/uid/TP40007451-CH9-SW6
- (void)tableView:(UITableView *)theTableView
didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    
    [theTableView deselectRowAtIndexPath:[theTableView indexPathForSelectedRow] animated:NO];
    UITableViewCell *cell = [theTableView cellForRowAtIndexPath:newIndexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        // Reflect selection in data model
    } else if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        // Reflect deselection in data model
    }
}
 */

@end
