//
//  FeedTableViewController.h
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/27/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewController : UITableViewController

//Array to use for loading the table:

@property (strong, nonatomic) NSArray *imageTitleArray;
@property (strong, nonatomic) NSArray *imageFileNameArray;

@end
