//
//  Cours.h
//  PetitBallonProject
//
//  Created by jessica goguillon on 15/01/13.
//  Copyright (c) 2013 Élèves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cours : NSObject
@property (nonatomic, strong) NSString *Title;
@property (nonatomic, strong) NSString *Date;
@property (nonatomic, assign) NSString *Lieu;
@property (nonatomic, strong) NSString *Description;
@end
