//
//  imageCollectionView.m
//  自定义UIcollectionView
//
//  Created by Dee on 15/6/2.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "imageCollectionViewCell.h"

@interface imageCollectionView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation imageCollectionView

-(void)setImageName:(NSString *)imageName
{
    
    _imageName =[imageName copy];
    self.imageView.image =[UIImage imageNamed:imageName];
    

    
}
-(void)awakeFromNib
{
    self.imageView.layer.borderColor =[UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth =3;
    self.imageView.layer.cornerRadius= 10;
    self.imageView.clipsToBounds =YES;
}
@end
