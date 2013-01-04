//
//  AppDelegate.m
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/26/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //This is the initialization of the tab controller:
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Set the rootViewController to the tabController:
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    //Now Define the ViewController that will be used:

    //FeedController that shows up as "Feed" in the tab at the bottom
    UIViewController *feedViewController = [[UIViewController alloc] init];
    feedViewController.title = @"Feed";
    feedViewController.tabBarItem.image = [UIImage imageNamed:@"fire"];
    
    //FavoritesController that shows up as "Favorites" in the tab at the bottom
    UIViewController *favoritesViewController = [[UIViewController alloc] init];
    favoritesViewController.title = @"Favorites";
    feedViewController.tabBarItem.image = [UIImage imageNamed:@"tab_icon_feed"];
    
    //Set the background colors of each of our Controllers that are in the tab
    feedViewController.view.backgroundColor = [UIColor blueColor];
    favoritesViewController.view.backgroundColor = [UIColor redColor];
    
    //Adds the view controllers to the tabBarController
    [tabBarController setViewControllers:@[feedViewController, favoritesViewController]];
    
    
    //Icons: 
    
    
    return YES;
}



@end
