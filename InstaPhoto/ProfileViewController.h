//
//  ProfileViewController.h
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/26/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) UIScrollView *scrollView;

//Set this NSDictionary for the returned JSON:
@property (strong, nonatomic) NSDictionary *itunesDict;
@property (strong, nonatomic) NSArray *itunes;


@end
