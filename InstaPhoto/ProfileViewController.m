//
//  ProfileViewController.m
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/26/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "ProfileViewController.h"

//This allows us get picture from internet using AFNetworking:
#import "UIImageView+AFNetworking.h"

//This allows us to get JSON data from internet:
#import "AFJSONRequestOperation.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Profile";
        //Icon for tab bar:
        self.tabBarItem.image = [UIImage imageNamed:@"Spy"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //-----SETTING THE SCROLL VIEW---------
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(320,480);
    //setting the 480 based on the last UILabel and the total size we want to be able to scroll down to.
    
    //-------------------------------------
        
    
    /*------------STANDARD-----------------------
     //Determines how a view lays out its content:
     [vishalView setContentMode:UIViewContentModeScaleAspectFit];
     
     //Frame set:
     vishalView.frame = self.view.frame;
     //------------STANDARD-----------------------*/

    
    //-------Text fields for the view-------------
    
    
    /*-----------------IMAGE THE OLD WAY--------------------
    UIImageView *vishalView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vishal.jpg"]];
    vishalView.frame = CGRectMake(20,20,100,150);
    [self.scrollView addSubview:vishalView];
    //-----------------IMAGE THE OLD WAY--------------------*/
    
    
    //-----------------IMAGE THE USING AFNETWORKING--------------------*/
    
    //Get a profileImage using UIImageView:
    UIImageView *profileImageView = [[UIImageView alloc] init];
    
    //Set the frame of the picture:
    profileImageView.frame = CGRectMake(20,20,80,114);
    
    //Using the AFNetworking pull the picture down and put it into a placeholder - good practice.
    [profileImageView setImageWithURL:[NSURL URLWithString:@"http://sphotos-a.xx.fbcdn.net/hphotos-ash4/281497_10100703106845059_1761265290_n.jpg"]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    //Add to the Scrollview
    [self.scrollView addSubview:profileImageView];

    //---------------------------------------------------------------------
    
 
    
    
    
    
    //----------------PULLING JSON DATA OFF THE INTERNET USING AFNETWORKING------
    
    //Create an NSURL set to our endpoint:
    NSURL *url = [[NSURL alloc] initWithString:@"https://itunes.apple.com/lookup?upc=720642462928"];
    
    //Create an NSURLRequest with our NSURL
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    //Create a AFJSONRequestOperation which will do the call to the internet
    
    
    //In order to do the ASYNCH operation, using the "^" means its a block
    //Blocks will allow me to do the ASYNCH operation in Obj-C
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
        //Store the return JSON data into the userProfile NSDictionary:
                                             
                                             //This command below returns an NSArray:
                                             self.itunes = [JSON objectForKey:@"results"];
                                             
                                             //NSLog(@"%@", [JSON objectForKey:@"results"]);
                                             //self.userProfile = [JSON objectForKey:@"results"];
                                             [self requestSuccessful];
                                             
                                    
    }
    
    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
    {
        NSLog(@"NSError: %@",error.localizedDescription);
    }];
    
    [operation start];
    //---------------------------------------------------------------------------
    

    /*-----Population of the Information on the profile in static format, no JSON------

    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,140,280,40)];
    nameLabel.text = @"Name: Vishal Sunak";
    //Add the subview into the ScrollView
    [self.scrollView addSubview:nameLabel];
    
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,200,280,40)];
    cityLabel.text = @"From: Nashua, NH";
    
    //Add the subview into the ScrollView
    [self.scrollView addSubview:cityLabel];
    
    UITextView *biography = [[UITextView alloc] initWithFrame:CGRectMake(12,260,300,180)];
    biography.font = [UIFont fontWithName:@"Helvetica" size:15];
    biography.editable = NO;
    biography.text = @"Computer/Systems Engineer, NEU & WPI Grad, @BOStartupSchool Fall '12, Boston sports fan, fantasy football addict, movie buff, musician";
    
    //Add the subview into the ScrollView
    [self.scrollView addSubview:biography];
    
    UILabel *twitterLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,400,280,40)];
    twitterLabel.text = @"theSunak";
    
    //Add the subview into the ScrollView
    [self.scrollView addSubview:twitterLabel];
    
    //Add the scrollView onto the ViewController's view
    
    [self.view addSubview:self.scrollView];*/
    
     //-----Population of the Information on the profile in static format, no JSON------
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) requestSuccessful
{
    //Load the dictionary with the array at index 0, so that's going to give us everything in the JSON
    self.itunesDict = [self.itunes objectAtIndex:0];
    
    // EXAMPLE FROM Code school console how to parse a NSdictionary for content:
     UILabel *artistLabel = [[UILabel alloc] init];
     artistLabel.frame = CGRectMake(20,140,280,40);
    
    //Set the artistName string with
    NSString *artistName = [self.itunesDict objectForKey:@"artistName"];
    
     artistLabel.text = artistName;
    
    
    
    [self.scrollView addSubview:artistLabel];

    [self.view addSubview:self.scrollView];
    
    
    
    
}

@end
