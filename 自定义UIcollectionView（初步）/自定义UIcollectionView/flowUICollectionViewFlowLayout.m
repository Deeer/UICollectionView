//
//  flowUICollectionViewFlowLayout.m
//  自定义UIcollectionView
//
//  Created by Dee on 15/6/2.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "flowUICollectionViewFlowLayout.h"
static const CGFloat DeeItemWH =100;

@implementation flowUICollectionViewFlowLayout


-(instancetype)init
{
    
    if (self= [super init]) {
        
      
    }
    return self;
    
}

//一些初始化工作最好在这里做

-(void)prepareLayout
{
    [super prepareLayout];
    
    //cell的尺寸
    self.itemSize = CGSizeMake(DeeItemWH, DeeItemWH);
    CGFloat inset= (self.collectionView.frame.size.width -DeeItemWH)*.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    //设置
    self.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing =80;
    //        UICollectionViewLayoutAttributes
    
    
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    CGRect visiabelRect;
    visiabelRect.size =self.collectionView.frame.size;
    visiabelRect.origin =self.collectionView.contentOffset;
    
    
    
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    
    //计算屏幕最中间的x
    CGFloat centerX= self.collectionView.contentOffset.x + self.collectionView.frame.size.width*.5;
    
    for (UICollectionViewLayoutAttributes *arrt in arr) {
        
        if (!CGRectIntersectsRect(visiabelRect, arrt.frame))continue;
        
        
       //每一个item中点的X
        CGFloat itemCenterX =arrt.center.x;
        
         CGFloat scale = 1 + 1 - ABS(itemCenterX - centerX)/self.collectionView.frame.size.width*.5;
        
        arrt.transform3D =CATransform3DMakeScale(scale, scale, 1.0);
    }
    
    
    return arr;
    
    
}





@end
