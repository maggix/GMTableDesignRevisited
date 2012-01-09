//
//  ButtonCell.m
//  ElencoServiziCoreData
//
//  Created by Giovanni Maggini on 27/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ButtonCell.h"

@implementation ButtonCell
@synthesize cellButton;
//@synthesize buttonText;

#pragma mark - View lifecycle


//
// nibName
//
// returns the name of the nib file from which the cell is loaded.
//
+ (NSString *)nibName
{
	return @"ButtonCell";
}

//
// handleSelectionInTableView:
//
// Performs the appropriate action when the cell is selected
//
- (void)handleSelectionInTableView:(UITableView *)aTableView
{
    //Questa cella non deve essere selezionata in quanto a cella
}

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
//    anIndexPath - the indexPath of the 'cell
//
- (void)configureForData:(id)dataObject
               tableView:(UITableView *)aTableView
               indexPath:(NSIndexPath *)anIndexPath
{
	[super configureForData:dataObject tableView:aTableView indexPath:anIndexPath];
    
    cellButton.titleLabel.text = [(NSDictionary *)dataObject objectForKey:@"buttonLabel"];
    notificationName = [(NSDictionary *)dataObject objectForKey:@"notificationName"];
    //self.userInteractionEnabled = NO; //Verificare che il bottone funzioni comunque
}

- (IBAction)buttonClicked:(id)sender
{
//    SEL buttonSelector = NSSelectorFromString(selectorName);
//    [super performSelector:buttonSelector];
     [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:nil];
}

@end
