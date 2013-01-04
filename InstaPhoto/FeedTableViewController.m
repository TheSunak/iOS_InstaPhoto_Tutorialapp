//
//  FeedTableViewController.m
//  InstaPhoto
//
//  Created by Vishal Sunak on 12/27/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "FeedTableViewController.h"
#import "PhotoViewController.h"

@interface FeedTableViewController ()

@end

@implementation FeedTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.title = @"Feed";
        //Icon for tab bar:
        self.tabBarItem.image = [UIImage imageNamed:@"Setup"];
        
        self.imageTitleArray = @[@"Patriots",@"Bruins",@"Red Sox",@"Celtics", @"Rhody Rams"];
        self.imageFileNameArray = @[@"patriots.gif", @"bruins.gif", @"redsox.png", @"celtics.png", @"rhody.gif"];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the sectio based on the array:
   return self.imageTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //--------------------Reuseable cells-------------------------------------
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Title"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Title"];
    }
    
    cell.textLabel.text = self.imageTitleArray[indexPath.row];
    
    //Add in a thumbname using this by loading it in from an array and using an index:
    //cell.imageView.image = [UIImage imageNamed:self.imageThumbnailArray[indexPath.row]];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //This function runs when a cell is selected and we have access to the information on What was selected
    //by using the indexPath value.
    
    
    //Log out to the console which row is clicked:
    NSLog(@"Row %d", indexPath.row);
    
    //Photo view control... shows an image when selected:
    
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    photoVC.imageFileName = self.imageFileNameArray[indexPath.row];
    photoVC.imageTitle = self.imageTitleArray[indexPath.row];
    
    [self.navigationController pushViewController:photoVC animated:YES];
    
    /*FROM CODE SCHOOL TUTORIAL:
    //cell.textLabel.text =  self.images[indexPath.row][@"title"];
    //cell.detailTextLabel.text = self.images[indexPath.row][@"detail"];
    
    //Based on this JSON:
    ￼[
    {
        "title": "Image 1",
        "detail": "Nice starfield.",
        "filename": "http://...",
        "thumbnail": "http://..."
    },
      {
          "title": "Image 2",
          "detail": "bad starfield.",
          "filename": "http://...",
          "thumbnail": "http://..."
      }] */
    

}

@end
