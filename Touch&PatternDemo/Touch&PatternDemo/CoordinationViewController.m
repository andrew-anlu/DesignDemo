//
//  CoordinationViewController.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "CoordinationViewController.h"
#import  "PaletteViewController.h"


@interface CoordinationViewController (){
  
}

-(void) initialize;
@end

@implementation CoordinationViewController

static CoordinationViewController *sharedCoordinator;
-(void)initialize{
    _canvasViewController=[[CanvesViewController alloc]init];
    _activeViewcontroller=_canvasViewController;
    [self.view addSubview:_canvasViewController.view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];
    [self initView];
    // Do any additional setup after loading the view.
}

+(CoordinationViewController*)sharedInstance{
    if(sharedCoordinator == nil){
        sharedCoordinator=[[super alloc]init];
        [sharedCoordinator initialize];
    }
    return sharedCoordinator;
}

-(void)initView{
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIHT-50, SCREEN_WIDTH, 50)];
    [_canvasViewController.view addSubview:toolBar];
    toolBar.backgroundColor=[UIColor purpleColor];
    
    UIBarButtonItem *startItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *endItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    

    
    //回收站
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(itemClick:)];
    
    //保存
    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"save"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    //打开
    UIBarButtonItem *item3=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"open"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    //颜色
    UIBarButtonItem *item4=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"palette"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    item4.tag=kButtonTagOpenPlatterView;
    //undo
    UIBarButtonItem *item5=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"undo"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    //redo
    UIBarButtonItem *item6=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"redo"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    
    toolBar.items=@[startItem,item1,startItem,item2,startItem,item3,startItem,item4,startItem,item5,startItem,item6,endItem];
    
}

-(void)itemClick:(id)sender{
    NSLog(@"clicked");
    if([sender isKindOfClass:[UIBarButtonItem class]]){
        switch ([(UIBarButtonItem *)sender tag]) {
            case kButtonTagOpenPlatterView: //画板颜色设置
            {
            
                PaletteViewController *controller=[[PaletteViewController alloc]init];
                [_canvasViewController presentViewController:controller animated:YES completion:nil];
                _activeViewcontroller=controller;
            }
                break;
                
            case kButtonTagOpenThumbnailView:
            {
                ThumbnailViewController *controller=[[ThumbnailViewController alloc]init];
                [_canvasViewController presentViewController:controller animated:YES completion:nil];
                _activeViewcontroller=_canvasViewController;
            
            }
                break;
                
            default:{
               [_canvasViewController dismissViewControllerAnimated:YES completion:^{
                   
               }];
                _activeViewcontroller=_canvasViewController;
            }
                break;
        }
    }else{
        [_canvasViewController dismissViewControllerAnimated:YES completion:^{}];
        _activeViewcontroller=_canvasViewController;
    }
}




@end
