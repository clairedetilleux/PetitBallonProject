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
#import "Vin.h"



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

    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_activity];
    
    
    [[DownloadManager shared] loadLocalFileName:@"ListeVin" withDelegate:self];
    
    
    //_dataToShow = [[NSArray alloc] initWithObjects:@"Vin d'octobre", @"Vin de septembre", @"Vin d'août", @"Vin de juillet", @"Vin de juin", nil];
    
    //_priceToShow = [[NSArray alloc] initWithObjects:@"10€", @"25€", @"17€", @"23€", @"7€", nil];
    
    //_dateToShow = [[NSArray alloc] initWithObjects:@"1920", @"1999", @"2006", @"2010", @"1986", nil];
    
    //_descriptionToShow = [[NSArray alloc] initWithObjects:@"Très bon vin, beaucoup de caractère.", @"Peu tannique. Idéal pour le dessert.", @"Touche fruitée.Mûre, pêche, orange.", @"Vin d'été. A boire frais.", @"Vin des côtes de Provence.", nil];
  
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
    return _arrayOfVin.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    static NSString *CellIdentifier = @"WineCell";
    
    WineCell *cell = (WineCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[WineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //cell.wineName.text = [_dataToShow objectAtIndex:[indexPath row]];
    
    //cell.winePrice.text = [_priceToShow objectAtIndex:[indexPath row]];
    
    //cell.wineDate.text = [_dateToShow objectAtIndex:[indexPath row]];
    
    
    // Get the contact for the row
    Vin *c = [_arrayOfVin objectAtIndex:indexPath.row];
    
    // Display!
    cell.wineName.text = [NSString stringWithFormat:@"%@", c.Name];
    cell.winePrice.text = [NSString stringWithFormat:@"%d", c.Price];
    cell.wineDate.text = [NSString stringWithFormat:@"%@", c.Millesime];
    
    return cell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*VinListViewController *vinListViewController = [[VinListViewController alloc] initWithNibName:@"VinListViewController" bundle:nil];
    vinListViewController.titre = [c.Name objectAtIndex:[indexPath row]];
    vinListViewController.price = [c.Price objectAtIndex:[indexPath row]];
    vinListViewController.date = [c.Millesime objectAtIndex:[indexPath row]];
    vinListViewController.description = [c.Description objectAtIndex:[indexPath row]];
    
     [self.navigationController pushViewController:vinListViewController animated:YES];*/

}


#pragma mark - DownloadDelegate protocol

- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError *)error
{
    // Stop activity indicator
    [_activity stopAnimating];
    NSLog(@"%@", error);
    // Todo : handle the error
}

- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest *)request
{
    // Start the activity indicator
    [_activity startAnimating];
}

- (void) downloadOperation:(DownloadOperation *)operation didLoadObject:(id)object
{
    // Stop activity indicator
    [_activity stopAnimating];
    
    // Now, we need to go through all the objects loaded in the JSON, parse it, and create new Objective-C objects
    // First, remove previous objects in instance array
    [_arrayOfVin removeAllObjects];
    
    // Allocate it if not already. This is called lazy loading. Remember, we are on mobile devices, where RAM use is really important
    if (!_arrayOfVin)
        _arrayOfVin = [NSMutableArray new];
    
    // Now enumerate the json array
    for (NSDictionary *dic in object)
    {
        // Create a new contact
        Vin *c = [Vin new];
        
        // Set its properties from JSON 'object'
        c.Name = [dic objectForKey:@"Name"];
        c.Millesime = [dic objectForKey:@"Millesime"];
        c.Price = [[dic objectForKey:@"Price"] integerValue];
        c.Description = [dic objectForKey:@"Description"];
        
        
        // Add it to the array
        [_arrayOfVin addObject:c];
    }
    
    // Just for fun, sort the array
    [_arrayOfVin sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES]]];
    
    // Try these
    // [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES]]];
    // [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"age" ascending:YES]]];
    // Pretty cool no?
    
    // We are almost done. Please note that the parsing is made here just to avoid complexification. You should always create a model like YouTubeManager class which handles the parsing and give the data to the controller. Remember the MVC pattern
    
    // When we finished, reload the table view
    [self.tableView reloadData];
}

@end
