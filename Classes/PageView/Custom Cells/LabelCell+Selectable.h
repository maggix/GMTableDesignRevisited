//
//  LabelCell+Selectable.h
//  ElencoServiziCoreData
//
//  Created by Giovanni Maggini on 10/20/11.
//  Copyright (c) 2011 Giovanni Maggini. All rights reserved.
//

#import "LabelCell.h"
//#import "MBProgressHUD.h"
//La selezione e il MBProgressHUD sono nel DetailDisclosureCell

@interface LabelCell (Selectable) // <MBProgressHUDDelegate>

- (void)handleSelectionInTableView:(UITableView *)aTableView;

@end
