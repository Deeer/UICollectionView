//
//  ViewController.m
//  自定义UIcollectionView
//
//  Created by Dee on 15/6/2.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "ViewController.h"
#import "flowUICollectionViewFlowLayout.h"
#import "imageCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)NSMutableArray *images;
@property (nonatomic,weak)UICollectionView *collectionView;
@end

@implementation ViewController

static NSString *const ID = @"image";
-(NSMutableArray *)images
{
    if (!_images) {
        self.images =[[NSMutableArray  alloc]init];
        
        for (int i =1; i<=20; i++) {
           [self.images addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
    }
    return _images;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat w = self.view.frame.size.width;
    CGRect rec= CGRectMake(0, 100,w, 200);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:rec collectionViewLayout:[[flowUICollectionViewFlowLayout alloc]init]];
    collectionView.dataSource =self;
    collectionView.delegate = self;
    self.collectionView= collectionView;
    [collectionView registerNib:[UINib nibWithNibName:@"UIcolllectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[flowUICollectionViewFlowLayout class]]) {
    [self.collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init] animated:YES];
    }
    else
    {
        [self.collectionView setCollectionViewLayout:[[flowUICollectionViewFlowLayout alloc]init]];
    }
    
}

#pragma mark  <UICollectionviewDateSource>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    imageCollectionView *cell =[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    cell.backgroundColor =[UIColor redColor];
    cell.imageName = self.images[indexPath.item];
    
    return cell;
    
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //删除模型数据
    [self.images removeObjectAtIndex:indexPath.item];
    //刷新ui
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
    
}




@end
