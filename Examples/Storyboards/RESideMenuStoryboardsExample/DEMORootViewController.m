//
//  DEMOViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMORootViewController.h"
#import "DEMOLeftMenuViewController.h"
#import "DEMOFirstViewController.h"
#import "DEMOSecondViewController.h"

@interface DEMORootViewController ()

@end

@implementation DEMORootViewController

- (void)awakeFromNib
{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
    self.rightMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightMenuViewController"];
    self.backgroundImage = [UIImage imageNamed:@"Stars"];
    self.delegate = self;
}

#pragma mark -
#pragma mark RESideMenu Delegate

- (BOOL)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
    
    UINavigationController *navController = sideMenu.contentViewController;
    if( [navController.topViewController conformsToProtocol:@protocol(RESideViewDelegate) ])
    {
        UIViewController <RESideViewDelegate>*resideView = navController.topViewController;
        return [resideView shouldAllowMenu];
    }
    return NO;
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (BOOL)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
    if( [self.sideMenuViewController.contentViewController conformsToProtocol:@protocol(RESideViewDelegate) ])
    {
        UIViewController <RESideViewDelegate>*resideView = self.sideMenuViewController.contentViewController;
        return [resideView shouldAllowMenu];
    }
    return YES;
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

@end
