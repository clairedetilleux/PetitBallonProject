//
//  VinListViewController.h
//  PetitBallonProject
//
//  Created by Élèves on 10/01/13.
//  Copyright (c) 2013 Élèves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VinViewController.h"

@interface VinListViewController : UIViewController
{
    UILabel *_label;
    UILabel *_labelPrice;
    UILabel *_labelDate;
    UILabel *_labelDescription;

}


@property (nonatomic, strong) NSString *titre;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *description;

@end
