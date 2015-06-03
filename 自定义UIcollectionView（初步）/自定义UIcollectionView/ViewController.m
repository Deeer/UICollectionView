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
    [collectionView registerNib:[UINib nibWithNibName:@"UIcolllectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    
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






@end
