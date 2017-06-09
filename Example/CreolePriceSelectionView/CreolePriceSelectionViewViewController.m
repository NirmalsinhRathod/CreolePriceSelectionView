//
//  CreolePriceSelectionViewViewController.m
//  CreolePriceSelectionView
//
//  Created by NirmalsinhRathod on 06/09/2017.
//  Copyright (c) 2017 NirmalsinhRathod. All rights reserved.
//

#import "CreolePriceSelectionViewViewController.h"
#import "CreolePriceSelectionView.h"
@interface CreolePriceSelectionViewViewController ()

@end

@implementation CreolePriceSelectionViewViewController

- (void)viewDidLoad
{
    
    CreolePriceSelectionView *objCreolePriceSelectionView = [[CreolePriceSelectionView alloc] initWithFrame:CGRectMake(0, 200, 375, 100)];
    [objCreolePriceSelectionView setDefaultColor]; // It will set defualt color for text and background.
    
    /*
     You can set text color manually also.
     
     objCreolePriceSelectionView.selectItemColor = YOUR_SELECTED_ITEM_COLOR.
     objCreolePriceSelectionView.normalItemColor  = YOUR_NORMAL_ITEM_COLOR.
     objCreolePriceSelectionView.selectedTextColor = YOUR_SELECTED_TEXT_COLOR
     objCreolePriceSelectionView.normalTextColor = YOUR_NORMAL_TEXT_COLOR
     
     */
    
    // You can pass your array for price like this:
    [objCreolePriceSelectionView setup:[[NSMutableArray alloc] initWithObjects:@"10", @"20", @"30", @"40", @"50", @"60", @"70", @"80", @"90", @"100", nil]];
    
    // Its directlly select the
    // This is optional steps to do. If you don't do this one, then it will set first automatically.
    [objCreolePriceSelectionView setPriceForItem:@"30"];
    
    [self.view addSubview:objCreolePriceSelectionView];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
