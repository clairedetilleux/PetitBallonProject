//
//  VinListViewController.m
//  PetitBallonProject
//
//  Created by Élèves on 10/01/13.
//  Copyright (c) 2013 Élèves. All rights reserved.
//

#import "VinListViewController.h"
#import "Vin.h"
#import "VinViewController.h"


@interface VinListViewController ()

@end

@implementation VinListViewController

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
        
    // Do any additional setup after loading the view from its nib.
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 30)];
    [self.view addSubview:_label];
    
    _labelPrice = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 200, 30)];
    [self.view addSubview:_labelPrice];
    _labelPrice.text = _price;
    
    _labelDate = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 200, 30)];
    [self.view addSubview:_labelDate];
    _labelDate.text = _date;
    
    _labelDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 90, 400, 30)];
    [self.view addSubview:_labelDescription];
    _labelDescription.text = _description;
    
    
    
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
