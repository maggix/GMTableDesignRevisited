//
//  LabelCell.m
//  TableDesignRevisited
//
//  Created by Matt Gallagher on 2010/04/22.
//  Copyright 2010 Matt Gallagher. All rights reserved.
//  Modified by Giovanni Maggini
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

#import "LabelCell.h"
#import "PageViewController.h"


@implementation LabelCell
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
	
    if([dataObject isKindOfClass:[NSDictionary class]]){
        self.textLabel.text = [dataObject objectForKey:@"label"];
        if ([dataObject objectForKey:@"displayDisclosureIndicator"]) {
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        if ([dataObject objectForKey:@"action"])
        {
            self.action = [(NSDictionary*)dataObject objectForKey:@"action"];
        }
        else
        {
            self.action = @"";
        }
        if ([dataObject objectForKey:@"image"]) {
            self.imageView.image = [UIImage imageNamed:[dataObject objectForKey:@"image"]];
            NSString *highlightedImage = [NSString stringWithFormat:@"%@-pressed",[dataObject objectForKey:@"image"]];
            NSString *path = [[NSBundle mainBundle] pathForResource:highlightedImage ofType:@"png"];
            if (path) {
                self.imageView.highlightedImage = [UIImage imageNamed:highlightedImage];
            }
//            [highlightedImage release];
            [path release];
        }
        
    }
    else
    {
        self.textLabel.text = (NSString*)dataObject;
    }
}

@end
