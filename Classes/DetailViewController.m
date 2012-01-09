//
//  DetailViewController.m
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

#import "DetailViewController.h"
#import "NibLoadedCell.h"

@implementation DetailViewController

//
// initWithRowIndex:
//
// Initializes the detail view with the only "detail view" piece of information:
// the row index of the selected view.
//
// Parameters:
//    aRowIndex - the selected row index
//
// returns the initialized row
//
- (id)initWithRowIndex:(NSInteger)aRowIndex
{
	self = [super init];
	if (self != nil)
	{
		rowIndex = aRowIndex;
	}
	return self;
}

//
// title
//
// returns the navigation item title
//
- (NSString *)title
{
	return NSLocalizedString(@"Detail View", @"");
}

//
// nibName
//
// returns the name of the NIB file from which this view is loaded
//
- (NSString *)nibName
{
	return @"DetailView";
}

//
// viewDidLoad
//
// Constructs a single, static row.
//
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self addSectionAtIndex:0 withAnimation:UITableViewRowAnimationNone];
	[self
		appendRowToSection:0
		cellClass:[NibLoadedCell class]
		cellData:[NSString stringWithFormat:
			NSLocalizedString(@"You selected NIB loaded cell %ld", @""), rowIndex + 1]
		withAnimation:UITableViewRowAnimationNone];
}

@end
