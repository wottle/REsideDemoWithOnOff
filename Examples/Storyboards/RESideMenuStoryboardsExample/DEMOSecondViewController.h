//
//  DEMOSecondViewController.h
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface DEMOSecondViewController : UIViewController <RESideViewDelegate>

- (IBAction)pushViewController:(id)sender;
- (BOOL) shouldAllowMenu;

@end
