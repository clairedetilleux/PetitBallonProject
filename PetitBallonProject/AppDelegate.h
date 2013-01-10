//
//  AppDelegate.h
//  PetitBallonProject
//
//  Created by Élèves on 03/10/12.
//  Copyright (c) 2012 Élèves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VinViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    VinViewController *_vinViewController;
    UINavigationController *_navController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end