//
//  VinViewController.h
//  PetitBallonProject2
//
//  Created by Élèves on 09/10/12.
//  Copyright (c) 2012 Élèves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadManager.h"
#import "DownloadDelegate.h"

@interface VinViewController : UITableViewController <DownloadDelegate>

{
    UIActivityIndicatorView *_activity;
    NSMutableArray *_arrayOfVin;
}

@end
