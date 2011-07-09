//
//  DetailViewController.m
//  CustomNavText
//
//  Created by Kevin Donnelly on 7/8/11.
//  Copyright 2011 -. All rights reserved.
//

#import "DetailViewController.h"
#import "CustomNavBar.h"

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    CustomNavBar *navBar = (CustomNavBar*)self.navigationController.navigationBar;
    
    // Set the title view to a logo
    UIImage* titleImage = [UIImage imageNamed:@"navigationBarLogo.png"];
    UIView* titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,titleImage.size.width, self.navigationController.navigationBar.frame.size.height)];
    UIImageView* titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    [titleView addSubview:titleImageView];
    titleImageView.center = titleView.center;
    CGRect titleImageViewFrame = titleImageView.frame;
    // Offset the logo up a bit
    titleImageViewFrame.origin.y = titleImageViewFrame.origin.y + 3.0;
    titleImageView.frame = titleImageViewFrame;
    self.navigationItem.titleView = titleView;
    
    [navBar setBackgroundWith:[UIImage imageNamed:@"navigationBarBackground.png"]];
    UIButton* back = [navBar backButtonWith:[UIImage imageNamed:@"navigationBarBackButton.png"] highlight:nil leftCapWidth:10.0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
