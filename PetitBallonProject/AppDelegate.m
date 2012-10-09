//
//  AppDelegate.m
//  PetitBallonProject
//
//  Created by Élèves on 03/10/12.
//  Copyright (c) 2012 Élèves. All rights reserved.
//

#import "AppDelegate.h"


#import "RootViewController.h"


#import "VinViewController.h"
#import "CoursViewController.h"
#import "CommanderViewController.h"
#import "CommenterViewController.h"



@implementation AppDelegate


@synthesize tabBarController = _tabBarController;
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];

    
    [self.window makeKeyAndVisible];
    
    // Pour affichage du SplashScreen assez longtemps
    //sleep(3);
    
    // Allocation du TabBar
    self.tabBarController = [[UITabBarController alloc] init];
    
    // Création des onglets
    // Onglet n°1 : Vins
    VinViewController *vinViewController = [[VinViewController alloc] initWithNibName:@"VinViewController" bundle:nil];
    
    UINavigationController *vinNavigationController = [[UINavigationController alloc] initWithRootViewController:vinViewController];
    vinViewController.title = @"Vins";
    [vinNavigationController setNavigationBarHidden:NO];
    
    // Onglets n°2 : Cours
    CoursViewController *coursViewController = [[CoursViewController alloc] initWithNibName:@"CoursViewController" bundle:nil];
    
    UINavigationController *coursNavigationController = [[UINavigationController alloc] initWithRootViewController:coursViewController];
    coursViewController.title = @"Cours";
    [coursNavigationController setNavigationBarHidden:NO];
    
    
    // Onglet n°3 : Commander
    CommanderViewController *commanderViewController = [[CommanderViewController alloc] initWithNibName:@"CommanderViewController" bundle:nil];
    
    UINavigationController *commanderNavigationController = [[UINavigationController alloc] initWithRootViewController:commanderViewController];
    commanderViewController.title = @"Commander";
    [commanderNavigationController setNavigationBarHidden:NO];
    
    
    // Onglet n°4 : Commenter
    CommenterViewController *commenterViewController = [[CommenterViewController alloc] initWithNibName:@"CommenterViewController" bundle:nil];
    
    UINavigationController *commenterNavigationController = [[UINavigationController alloc] initWithRootViewController:commenterViewController];
    commenterViewController.title = @"Commenter";
    [commenterNavigationController setNavigationBarHidden:NO];
    
    
    
    // Ajout des controleurs au TabBar
    _tabBarController.viewControllers = [NSArray arrayWithObjects:vinNavigationController, coursNavigationController, commanderNavigationController,commenterNavigationController, nil];
    
    // Ajouter la vue du Tab à la fenetre
    [self.window setRootViewController:_tabBarController];
    
    
    // Première page avec interaction barre de navigation
    RootViewController *rootViewController = [[RootViewController alloc] initWithNibName:@"RootViewController"bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    [self.tabBarController presentModalViewController:nav animated:NO];
    

    
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
