//
//  AppDelegate.m
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/26/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "AppDelegate.h"

//With Refactor of code:
//#import "FeedViewController.h"
#import "FavoritesViewController.h"
#import "ProfileViewController.h"

//With TableViewController
#import "FeedTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //------------- TAB CONTROLLER--------------------
    //UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //Set the rootViewController to the tabController:
    //self.window.rootViewController = tabBarController;
    //------------------------------------------------
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    /*/----------------OLD WAY BEFORE REFACTOR----------------------------------
    //Now Define the ViewController that will be used:

    //FeedController that shows up as "Feed" in the tab at the bottom
    FeedViewController *feedViewController = [[FeedViewController alloc] init];
    feedViewController.title = @"Feed";
    //Icon for tab bar:
    feedViewController.tabBarItem.image = [UIImage imageNamed:@"Setup"];
 
    //FavoritesController that shows up as "Favorites" in the tab at the bottom
    UIViewController *favoritesViewController = [[UIViewController alloc] init];
    favoritesViewController.title = @"Favorites";
    //Icon for tab bar:
    favoritesViewController.tabBarItem.image = [UIImage imageNamed:@"Binoculars"];
    
    //Set the background colors of each of our Controllers that are in the tab
    feedViewController.view.backgroundColor = [UIColor blueColor];
    favoritesViewController.view.backgroundColor = [UIColor redColor];
    
    //Adds the view controllers to the tabBarController
    [tabBarController setViewControllers:@[feedViewController, favoritesViewController]];
    
     //--------------------------------------------------*/
    
    
    //---------------FEED TABLE CONTROLLER---------
    
    FeedTableViewController *feedTableViewController = [[FeedTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    //Send to the navigation controller:
    UINavigationController *feedNavController = [[UINavigationController alloc]
                                                 initWithRootViewController:feedTableViewController];
    
    //---------------------------------------------
    
    
    
    
    //------------------TAB AND NAV CONTROLLERS-------------------------------------
    
    //FeedViewController *feedViewController = [[FeedViewController alloc] init];
    //UINavigationController *feedNavController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
    
    FavoritesViewController *favoritesViewController = [[FavoritesViewController alloc] init];
    UINavigationController *favoritesNavController = [[UINavigationController alloc] initWithRootViewController:favoritesViewController];
    
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    UINavigationController *profileNavController = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    //-------------------------------------------------
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //[tabBarController setViewControllers:@[feedNavController, favoritesNavController, profileNavController]];
    
    [tabBarController setViewControllers:@[feedNavController, favoritesNavController, profileNavController]];
    self.window.rootViewController = tabBarController;
    //-------------------------------------------------
    
    //-------------------------TAB BAR CONTROLLER---------------------------------
    //Adds the view controllers to the tabBarController
    //[tabBarController setViewControllers:@[feedViewController, favoritesViewController, profileViewController]];
    //----------------------------------------------------------
    
    //------------------------NAVIGATION CONTROLLER-------------------------------

    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
    //self.window.rootViewController = navController;
    //-------------------------------------------------------
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
