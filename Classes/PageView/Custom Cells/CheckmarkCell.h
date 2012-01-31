//
//  CheckmarkCell.h
//  TableDesignRevisited
//
//  Created by Giovanni Maggini on 13/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageCell.h"

@interface CheckmarkCell : PageCell

@property (nonatomic) BOOL checked;
@property (nonatomic, retain) NSString* value;

@end
