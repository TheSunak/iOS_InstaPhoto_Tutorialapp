//
//  FavoritesViewController.m
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/26/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Favorites";
        //Icon for tab bar:
        self.tabBarItem.image = [UIImage imageNamed:@"Multimedia"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    /*-------Normal Image---------------------
    UIImageView *patriots = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"patriots.png"]];
    patriots.frame = CGRectMake(0,0,300,150);
    [self.view addSubview:patriots];
     //-------Normal Image---------------------*/
    
    //--------Image as a button--------------
    
    //Create a custom button:
    UIButton *patriotsView = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //Set the state for Normal control:
    [patriotsView setImage:[UIImage imageNamed:@"patriots.png"]
                forState:UIControlStateNormal];
    
    //Set the state for when the button is highlighted:
    [patriotsView setImage:[UIImage imageNamed:@"patriots.png"]
                forState:UIControlStateHighlighted];
    
    //Set the frame:
    [patriotsView setFrame:CGRectMake(0,0,150,75)];
    
    //Add it to the view:
    [self.view addSubview:patriotsView];
    
    //Link the action of click on the picture:
    [patriotsView addTarget:self
                   action:@selector(showZoomedPicture:)
         forControlEvents:UIControlEventTouchUpInside];
    
    //--------Image as a button--------------
    
}

- (void)showZoomedPicture:(UIButton *)sender
{
    //CONTROLLER ON THE FLY!
    UIViewController *patriotsImageViewController = [[UIViewController alloc] init];
    patriotsImageViewController.view.frame = self.view.frame;
    patriotsImageViewController.title = @"New England Patriots";
    
    //Now create the image, full size
    UIImageView *patriotsView = [[UIImageView alloc]
                               initWithImage:[UIImage imageNamed:@"patriots.png"]];
    [patriotsView setContentMode:UIViewContentModeScaleAspectFit];
    
    //Set the frame for the Image
    patriotsView.frame = patriotsImageViewController.view.frame;
    
    //Create a subview onto our new Controller created on the fly:
    [patriotsImageViewController.view addSubview:patriotsView];
    
    //Put it into the navigation controller handling
    [self.navigationController pushViewController:patriotsImageViewController animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
