//
//  StackLayout.m
//  自定义UIcollectionView
//
//  Created by Dee on 15/6/3.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "StackLayout.h"

#define DRandon0_1 (arc4random_uniform(100)/100.0)

@implementation StackLayout
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSMutableArray*array = [NSMutableArray array];
    NSInteger count =[self.collectionView numberOfItemsInSection:0];
    
    for (int i =0;  i<count ;i++) {
        UICollectionViewLayoutAttributes *attr= [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        attr.size =CGSizeMake(100, 100);
        attr.center = CGPointMake(self.collectionView.frame.size.width*.5,self.collectionView.frame.size.height*.5);
        
        attr.zIndex = count- i;
        attr.transform =CGAffineTransformMakeRotation(DRandon0_1 *M_PI_4);
        [array  addObject:attr];
    }
    
    
    
    return  array;
    
}


@end
