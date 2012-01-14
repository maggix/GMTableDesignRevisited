//
//  ButtonCell.h
//  ElencoServiziCoreData
//
//  Created by Giovanni Maggini on 27/12/11.
//  Copyright (c) 2011 Giovanni Maggini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageCell.h"

@interface ButtonCell : PageCell
{
    UIButton *cellButton;
    NSString *notificationName;
}

@property (nonatomic, retain) IBOutlet UIButton *cellButton;
//@property (nonatomic, retain) NSString *selectorName;
//@property (nonatomic, retain) NSString *buttonText;

- (IBAction)buttonClicked:(id)sender;


@end
