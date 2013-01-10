//
//  VinViewController.m
//  PetitBallonProject
//
//  Created by Élèves on 09/10/12.
//  Copyright (c) 2012 Élèves. All rights reserved.
//

#import "VinViewController.h"
#import "WineCell.h"
#import "VinListViewController.h"



@interface VinViewController ()

@end

@implementation VinViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    _dataToShow = [[NSArray alloc] initWithObjects:@"Vin d'octobre", @"Vin de septembre", @"Vin d'août", @"Vin de juillet", @"Vin de juin", nil];
    
    _priceToShow = [[NSArray alloc] initWithObjects:@"10€", @"25€", @"17€", @"23€", @"7€", nil];
    
    _dateToShow = [[NSArray alloc] initWithObjects:@"1920", @"1999", @"2006", @"2010", @"1986", nil];
    
    _descriptionToShow = [[NSArray alloc] initWithObjects:@"Très bon vin, beaucoup de caractère.", @"Peu tannique. Idéal pour le dessert.", @"Touche fruitée.Mûre, pêche, orange.", @"Vin d'été. A boire frais.", @"Vin des côtes de Provence.", nil];
  
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






#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // Return the number of rows in the section.
    return [_dataToShow count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    static NSString *CellIdentifier = @"WineCell";
    
    WineCell *cell = (WineCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[WineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.wineName.text = [_dataToShow objectAtIndex:[indexPath row]];
    
    cell.winePrice.text = [_priceToShow objectAtIndex:[indexPath row]];
    
    cell.wineDate.text = [_dateToShow objectAtIndex:[indexPath row]];
    
    return cell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VinListViewController *vinListViewController = [[VinListViewController alloc] initWithNibName:@"VinListViewController" bundle:nil];
    vinListViewController.titre = [_dataToShow objectAtIndex:[indexPath row]];
    vinListViewController.price = [_priceToShow objectAtIndex:[indexPath row]];
    vinListViewController.date = [_dateToShow objectAtIndex:[indexPath row]];
    vinListViewController.description = [_descriptionToShow objectAtIndex:[indexPath row]];

    
    [self.navigationController pushViewController:vinListViewController animated:YES];
}

@end
