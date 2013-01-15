

#import "CoursCell.h"
#import "CoursViewController.h"

@implementation CoursCell
@synthesize wineName = _wineName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        
        // Modification du texte de la cellule
        // Ajouter le prix du vin
        _winePrice = [[UILabel alloc] initWithFrame:CGRectOffset(CGRectInset(self.frame, 5.0, 0.0), 0.0, 0.0)];
        _winePrice.font = [UIFont fontWithName:@"arial" size:18.0];
        _winePrice.textAlignment = UITextAlignmentRight;
        [self.contentView addSubview:_winePrice];
        
        
        
        // Création d'un rectangle dans la cellule pour modifier position du texte
        _wineName = [[UILabel alloc] initWithFrame:CGRectOffset(CGRectInset(self.frame, 50.0, 0.0), 0.0, -8.0)];
        _wineName.font = [UIFont fontWithName:@"arial" size:18.0];
        _wineName.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:_wineName];
        
        
        
        // Ajouter l'année
        _wineDate = [[UILabel alloc] initWithFrame:CGRectOffset(CGRectInset(self.frame, 50.0, 10.0), 0.0, 10.0)];
        _wineDate.font = [UIFont fontWithName:@"arial" size:14.0];
        _wineDate.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:_wineDate];
        
        
        
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
