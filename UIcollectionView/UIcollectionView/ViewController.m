//
//  ViewController.m
//  UIcollectionView
//
//  Created by Dee on 15/6/2.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController
static NSString* ID  =@"co";
- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat scrW =self.view.frame.size.width;
    CGRect rec =CGRectMake(0, 0, scrW, 200);
    UICollectionView *collection =[[UICollectionView alloc]initWithFrame:rec collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    collection.dataSource =self;
    collection.delegate =self;
    
    
    [collection registerNib:[UINib nibWithNibName:@"collectionVeiw" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collection];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark -UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor =[UIColor yellowColor];
    return cell;
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(96, 100);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}




@end
