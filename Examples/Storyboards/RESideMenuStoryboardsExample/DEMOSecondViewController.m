//
//  DEMOSecondViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOSecondViewController.h"

@interface DEMOSecondViewController ()

@end

@implementation DEMOSecondViewController

- (IBAction)pushViewController:(id)sender
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = @"Pushed Controller";
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)firstViewControllerButton:(id)sender
{
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"firstViewController"]]
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];

}

- (BOOL) shouldAllowMenu
{
    return NO;
}

@end
