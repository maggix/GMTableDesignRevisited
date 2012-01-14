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
    
	self.detailTextLabel.text = [dataObject objectForKey:@"label"];
	self.textLabel.text = [dataObject objectForKey:@"label"];
    
    self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    self.action = [dataObject objectForKey:@"action"];
    //Todo: aggiungere in seguito
    

}

- (void)handleSelectionInTableView:(UITableView *)aTableView
{
    //TODO: inviare al PARENT un selector:(showfile) per eseguire l'apertura del documento
    //Verificando prima che risponda al selector con respondsToSelector
	[super handleSelectionInTableView:aTableView];
	
}




@end
