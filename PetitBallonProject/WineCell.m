//
//  WineCell.m
//  PetitBallonProject
//
//  Created by Élèves on 09/10/12.
//  Copyright (c) 2012 Élèves. All rights reserved.
//

#import "WineCell.h"

@implementation WineCell
@synthesize wineName = _wineName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // Modification du texte de la cellule
        // Création d'un rectangle dans lea cellule pour modifier position du texte
        _wineName = [[UILabel alloc] initWithFrame:CGRectOffset(CGRectInset(self.frame, 25.0, 0.0), 25.0, 0.0)];
        _wineName.font = [UIFont fontWithName:@"arial" size:20.0];
        _wineName.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:_wineName];
        
        
        // Ajouter une image à la cellule
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"87-wine-glass.png"]];
        imageView.frame = CGRectMake(20.0, 15.0, 10.0, 15.0);
        [self.contentView addSubview:imageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
