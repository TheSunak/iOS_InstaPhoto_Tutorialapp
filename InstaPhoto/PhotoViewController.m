//
//  PhotoViewController.m
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/27/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor  = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageFileName]];
    imageView.frame = CGRectMake(75,50,200,200);
    [self.view addSubview:imageView];
    
    UILabel *imageTitleLabel = [[UILabel alloc] init];
    
    imageTitleLabel.text = self.imageTitle;
    
    imageTitleLabel.frame = CGRectMake(125,320,300,40);
    [self.view addSubview:imageTitleLabel];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
