//
//  LabelCell+Selectable.m
//  ElencoServiziCoreData
//
//  Created by Giovanni Maggini on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LabelCell+Selectable.h"
#import "PageViewController.h"


@implementation LabelCell (Selectable)


//
// handleSelectionInTableView:
//
// Performs the appropriate action when the cell is selected
//
- (void)handleSelectionInTableView:(UITableView *)aTableView
{
//	[super handleSelectionInTableView:aTableView];
//	
//    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.superview];
//    [self.superview addSubview:HUD];
//	HUD.allowsCancelation = YES;
//    HUD.delegate = self;
//    //HUD.labelText = @"Loading";
//    //HUD.detailsLabelText = @"updating data";
//	
////    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
//    [HUD show:YES];
//    
//	NSInteger rowIndex = [aTableView indexPathForCell:self].row;
//    [[Manager sharedManager] DownloadDocumentById:[NSNumber numberWithInt:16982]];
//	[((PageViewController *)aTableView.delegate).navigationController
//     pushViewController:[[[DetailViewController alloc] initWithRowIndex:rowIndex] autorelease]
//     animated:YES];
//    
//    [HUD hide:YES afterDelay:0];
}



@end
