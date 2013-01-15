//
//  CoursViewController.h
//  PetitBallonProject
//
//  Created by Élèves on 10/01/13.
//  Copyright (c) 2013 Élèves. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DownloadManager.h"
#import "DownloadDelegate.h"

@interface CoursViewController : UITableViewController <DownloadDelegate>

{
    UIActivityIndicatorView *_activity;
    NSMutableArray *_arrayOfCours;
}

@end
