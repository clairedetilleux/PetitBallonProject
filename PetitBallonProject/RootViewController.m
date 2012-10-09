//
//  RootViewController.m
//  PetitBallonProject
//
//  Created by Élèves on 03/10/12.
//  Copyright (c) 2012 Élèves. All rights reserved.
//

#import "RootViewController.h"
#import "VinViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

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
    
    // Première page avec interaction bouton Entrer
    // Le bouton entrer permet d'entrer dans l'application
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Entrer" style:UIBarButtonItemStylePlain target:self action:@selector(goToVinView:)];
    
    
    // Ajouter une image de fond ur la page d'accueil 
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundImage.png"]];
    [self.view addSubview:imageView];
    
    self.title = @"Accueil";
}

- (void) goToVinView:(id)sender{
    
    [self dismissModalViewControllerAnimated:YES];
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
