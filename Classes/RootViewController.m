//
//  RootViewController.m
//  TableDesignRevisited
//
//  Created by Matt Gallagher on 2010/12/19.
//  Copyright 2010 Matt Gallagher. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//

#import "RootViewController.h"
#import "LabelCell.h"
#import "TextFieldCell.h"
#import "NibLoadedCell.h"
#import "GradientBackgroundTable.h"
#import "CheckmarkCell.h"

@implementation RootViewController

//
// title
//
// returns the navigation bar text for the front screen
//
- (NSString *)title
{
	return NSLocalizedString(@"TableViewRevisited", @"");
}

//
// createRows
//
// Constructs all the rows on the front screen and animates them in
//
- (void)createRows
{
	[self addSectionAtIndex:0 withAnimation:UITableViewRowAnimationFade];
	for (NSInteger i = 0; i < 4; i++)
	{
		[self
			appendRowToSection:0
			cellClass:[LabelCell class]
			cellData:[NSString stringWithFormat:
				NSLocalizedString(@"This is row %ld", @""), i + 1]
			withAnimation:(i % 2) == 0 ?
				UITableViewRowAnimationLeft :
				UITableViewRowAnimationRight];
	}

	[self addSectionAtIndex:1 withAnimation:UITableViewRowAnimationFade];
	for (NSInteger i = 0; i < 4; i++)
	{
		[self
			appendRowToSection:1
			cellClass:[NibLoadedCell class]
         cellData:[NSDictionary dictionaryWithObjectsAndKeys:
                   [NSString stringWithFormat:
                   NSLocalizedString(@"This is row %ld", @""), i + 1],
                   @"labelText",
                   [NSString stringWithString:@"cocoawithlove-logo"],
                   @"imageName",
                   [NSString stringWithString:@"Cell Title"],
                   @"titleLabelText",
                   nil]
			withAnimation:(i % 2) == 0 ?
				UITableViewRowAnimationLeft :
				UITableViewRowAnimationRight];
	}

	[self addSectionAtIndex:2 withAnimation:UITableViewRowAnimationFade];
	for (NSInteger i = 0; i < 4; i++)
	{
		[self
			appendRowToSection:2
			cellClass:[TextFieldCell class]
			cellData:
				[NSMutableDictionary dictionaryWithObjectsAndKeys:
					[NSString stringWithFormat:
						NSLocalizedString(@"TextField %ld", @""), i + 1],
						@"label",
					@"", @"value",
					NSLocalizedString(@"Value goes here", @""),
						@"placeholder",
				nil]
			withAnimation:(i % 2) == 0 ?
				UITableViewRowAnimationLeft :
				UITableViewRowAnimationRight];
	}
    [self addSectionAtIndex:3 withAnimation:UITableViewRowAnimationFade];
	for (NSInteger i = 0; i < 4; i++)
	{
		[self
         appendRowToSection:3
         cellClass:[CheckmarkCell class]
         cellData:[NSString stringWithFormat:
                   NSLocalizedString(@"This is row %ld", @""), i + 1]
         withAnimation:(i % 2) == 0 ?
         UITableViewRowAnimationLeft :
         UITableViewRowAnimationRight];
	}

	[self hideLoadingIndicator];
}

//
// refresh
//
// Removes all existing rows and starts a reload (on a 0.5 second timer)
//
- (void)refresh:(id)sender
{
	[self removeAllSectionsWithAnimation:UITableViewRowAnimationFade];
	[self performSelector:@selector(createRows) withObject:nil afterDelay:0.5];
	[self showLoadingIndicator];
}

//
// viewDidLoad
//
// On load, refreshes the view (to load the rows)
//
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.useCustomHeaders = YES;
	[self refresh:nil];
}

//
// loadView
//
// Since the view is so simple (just a GradientBackgroundView) we might as
// well contruct it in code.
//
- (void)loadView
{
	GradientBackgroundTable *aTableView =
		[[[GradientBackgroundTable alloc]
			initWithFrame:CGRectZero
			style:UITableViewStyleGrouped]
		autorelease];
	
	self.view = aTableView;
	self.tableView = aTableView;
}

//
// textFieldDidEndEditing:
//
// Update the rowData for the text field rows to match the edited value of the
// text field.
//
- (void)textFieldDidEndEditing:(UITextField *)textField
{
	UIView *parentOfParent = textField.superview.superview;
	if ([parentOfParent isKindOfClass:[TextFieldCell class]])
	{
		TextFieldCell *cell = (TextFieldCell *)parentOfParent;
		NSIndexPath *indexPathForCell = [self.tableView indexPathForCell:cell];
		NSMutableDictionary *rowData =
			[self dataForRow:indexPathForCell.row inSection:indexPathForCell.section];
		[rowData setObject:textField.text forKey:@"value"];
	}
}

/*
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 3; // Undocumented constant
//    http://stackoverflow.com/questions/308081/is-it-possible-to-configure-a-uitableview-to-allow-multiple-selection
}
*/

//
// tableView:titleForHeaderInSection:
//
// Header text for the three sections
//
// Parameters:
//    aTableView - the table
//    section - the section for which header text should be returned
//
// returns the header text for the appropriate section
//
- (NSString *)tableView:(UITableView *)aTableView
	titleForHeaderInSection:(NSInteger)section
{
	if (section == 0)
	{
		return NSLocalizedString(@"Simple text rows", nil);
	}
	else if (section == 1)
	{
		return NSLocalizedString(@"Rows loaded from NIBs", nil);
	}
	else if (section == 2)
	{
		return NSLocalizedString(@"Some editable text fields", nil);
	}
	else if (section == 3)
	{
		return NSLocalizedString(@"Some checkmark cells", nil);
	}
	return nil;
}

@end

