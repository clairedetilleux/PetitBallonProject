//
//  VinViewController.h
//  PetitBallonProject
//
//  Created by Élèves on 09/10/12.
//  Copyright (c) 2012 Élèves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadManager.h"

@interface VinViewController : UITableViewController <DownloadDelegate>

{
    
    UIActivityIndicatorView *_activity;
    NSMutableArray *_arrayOfVin;
    
    /*NSArray *_dataToShow;
    NSArray *_priceToShow;
    NSArray *_dateToShow;
    NSArray *_descriptionToShow;*/

}
@end
