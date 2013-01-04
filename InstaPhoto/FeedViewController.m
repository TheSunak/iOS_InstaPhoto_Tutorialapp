//
//  FeedViewController.m
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/26/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "FeedViewController.h"
#import "FavoritesViewController.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"Feed";
        //Icon for tab bar:
        self.tabBarItem.image = [UIImage imageNamed:@"Setup"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    //Create the button for the Navigation Controller:
    UIButton *favoritesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    favoritesButton.frame = CGRectMake(60, 100, 200, 44);
    [favoritesButton setTitle:@"View Favorites" forState:UIControlStateNormal];
    [self.view addSubview:favoritesButton];
    
    //Target is the action for what to do when someone pushes the buttons:
    [favoritesButton addTarget:self action:@selector(showFavorites:)
              forControlEvents:UIControlEventTouchUpInside];
}

- (void)showFavorites:(UIButton *)sender
{
    //Create a new FavoritesviewController instance:
    FavoritesViewController *favoritesViewController = [[FavoritesViewController alloc] init];
    
    //Push the navigation view onto the NavigationController:
    [self.navigationController pushViewController:favoritesViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
