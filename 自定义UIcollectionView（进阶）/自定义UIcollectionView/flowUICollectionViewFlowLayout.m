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
    self.minimumLineSpacing =100;
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
        
        if (ABS(itemCenterX -centerX)<=150) {
        
        
        
        
         CGFloat scale = 1 + 0.8*(1 - ABS(itemCenterX - centerX)/150);
        
        arrt.transform3D =CATransform3DMakeScale(scale, scale, 1.0);
        }
        else{
            arrt.transform =CGAffineTransformMakeScale(1, 1);
        }
    }
    
    
    return arr;
    
    
}


//用于设置scrolleVie停止滚动那一刻的位置
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    
    
    //计算出scrollview最后停留的范围
    CGRect lastRect ;
    lastRect.origin =proposedContentOffset;
    lastRect.size = self.collectionView.frame.size;
    
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width*0.5;
    
    
    
    //取出这个范围内的所有属性
    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
    
    CGFloat adjustOffsetX = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes*attrs in array) {
        
        if (ABS(attrs.center.x - centerX)<ABS(adjustOffsetX)) {
            
            adjustOffsetX = attrs.center.x -centerX;
        }
        
    }
    
    
    
    
    return  CGPointMake(proposedContentOffset.x+adjustOffsetX, proposedContentOffset.y);
    
    
    
}




@end
