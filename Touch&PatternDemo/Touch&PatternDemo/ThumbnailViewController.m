//
//  ThumbnailViewController.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ThumbnailViewController.h"
#import "ScribbleThumbnailCellTableViewCell.h"

@interface ThumbnailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *arrayData;
@property (nonatomic,strong)ScribbleManager *scribbleManager;
@end

@implementation ThumbnailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"涂鸦图仓库";
    self.view.backgroundColor=[UIColor whiteColor];
    _scribbleManager=[[ScribbleManager alloc]init];
    
    // with a dark cloth texture image
    UIColor *backgroundColor = [UIColor colorWithPatternImage:
                                [UIImage imageNamed:@"background_texture"]];
    [[self view] setBackgroundColor:backgroundColor];
    
    
    
    [self initView];
}

-(void)initTableView{
    _tableView=[[UITableView alloc]init];
    _tableView.frame=CGRectMake(0, 68, SCREEN_WIDTH, SCREEN_HEIHT-64);
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    
}
-(void)initView{
    UINavigationBar *navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:navigationBar];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 20, 100, 30)];
    [btn setTitle:@"done" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [navigationBar addSubview:btn];
    
    [self initTableView];
}
-(void)closeAction:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UItableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CGFloat numberOfPlaceholders=[ScribbleThumbnailCellTableViewCell numberOfPlaceHolders];
    NSInteger numberOfScribbles=[_scribbleManager numberOfScribbles];
    
    NSInteger numberOfRows=ceil(numberOfScribbles / numberOfPlaceholders);
    return numberOfRows;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentity=@"cell";
    ScribbleThumbnailCellTableViewCell *cell=(ScribbleThumbnailCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentity];
    if(cell==nil){
        cell=[[ScribbleThumbnailCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentity];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.backgroundColor=[UIColor clearColor];
    NSInteger numberOfSupportedThumbnails=[ScribbleThumbnailCellTableViewCell numberOfPlaceHolders];
    NSUInteger rowIndex=[indexPath row];
    NSInteger thumbnailIndex=rowIndex*numberOfSupportedThumbnails;
    NSInteger numberOfScribbles=[_scribbleManager numberOfScribbles];
    
    for (int i=0; i<numberOfSupportedThumbnails && (thumbnailIndex+i)<numberOfScribbles; ++i) {
        UIView *scribbleThumbnail=[_scribbleManager scribbleThumbnailViewAtIndex:thumbnailIndex+i];
        [cell addThumbnailView:scribbleThumbnail atIndex:i];
    }
    return cell;
}
#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
@end













