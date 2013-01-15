//
//  CoursViewController.m
//  PetitBallonProject
//
//  Created by Élèves on 09/10/12.
//  Copyright (c) 2012 Élèves. All rights reserved.
//

#import "CoursViewController.h"
#import "WineCell.h"
#import "CoursListViewController.h"
#import "Cours.h"



@interface CoursViewController ()

@end

@implementation CoursViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    //self = [super initWithStyle:style];
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
    
    
    [[DownloadManager shared] loadLocalFileName:@"ListeCours" withDelegate:self];
    
    
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
    return _arrayOfCours.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    static NSString *CellIdentifier = @"CoursCell";
    
    CoursCell *cell = (CoursCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[CoursCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //cell.wineName.text = [_dataToShow objectAtIndex:[indexPath row]];
    
    //cell.winePrice.text = [_priceToShow objectAtIndex:[indexPath row]];
    
    //cell.wineDate.text = [_dateToShow objectAtIndex:[indexPath row]];
    
    
    // Get the contact for the row
    Cours *c = [_arrayOfCours objectAtIndex:indexPath.row];
    
    // Display!
    cell.wineName.text = [NSString stringWithFormat:@"%@", c.Name];
    cell.winePrice.text = [NSString stringWithFormat:@"%d", c.Price];
    cell.wineDate.text = [NSString stringWithFormat:@"%@", c.Date];
    
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoursListViewController *coursListViewController = [[CoursListViewController alloc] initWithNibName:@"CoursListViewController" bundle:nil];
    /*vinListViewController.titre = [c.Name objectAtIndex:[indexPath row]];
     vinListViewController.price = [c.Price objectAtIndex:[indexPath row]];
     vinListViewController.date = [c.Millesime objectAtIndex:[indexPath row]];
     vinListViewController.description = [c.Description objectAtIndex:[indexPath row]];*/
    
    [self.navigationController pushViewController:coursListViewController animated:YES];
    
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
    if (!_arrayOfCOurs)
        _arrayOfCours = [NSMutableArray new];
    
    // Now enumerate the json array
    for (NSDictionary *dic in object)
    {
        // Create a new contact
        COUrs *c = [Cours new];
        
        // Set its properties from JSON 'object'
        c.Title = [dic objectForKey:@"Name"];
        c.Date = [dic objectForKey:@"Millesime"];
        c.Lieu = [dic objectForKey:@"Description"];
        c.Description = [dic objectForKey:@"Price"];
        
        // Add it to the array
        [_arrayOfCours addObject:c];
    }
    
    // Just for fun, sort the array
    [_arrayOfCours sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES]]];
    
    // Try these
    // [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES]]];
    // [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"age" ascending:YES]]];
    // Pretty cool no?
    
    // We are almost done. Please note that the parsing is made here just to avoid complexification. You should always create a model like YouTubeManager class which handles the parsing and give the data to the controller. Remember the MVC pattern
    
    // When we finished, reload the table view
    [self.tableView reloadData];
}
@end
