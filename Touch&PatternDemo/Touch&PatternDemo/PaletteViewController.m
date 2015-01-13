//
//  PaletteViewController.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "PaletteViewController.h"
#import "SetStrokeColorCommand.h"
#import "SetStrokeSizeCommand.h"

@interface PaletteViewController ()<SetStrokeSizeCommandDelegate>

@end

@implementation PaletteViewController


-(void)viewDidDisappear:(BOOL)animated{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor whiteColor];
    [self initView];
    
    SetStrokeColorCommand *colorCommand=(SetStrokeColorCommand *)_redSlider.command;
    
    [colorCommand setRGBValuesProvider:^(CGFloat *red,CGFloat *green,CGFloat *blue){
        *red=_redSlider.value;
        *green=_greenSlider.value;
        *blue=_blueSlider.value;
    }];
    
    //设置背景颜色
    [colorCommand setPostColorUpdateProvider:^(UIColor *color){
        [_paletteView setBackgroundColor:color];
    }];
    
    //把颜色存储起来
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:kRED];
    CGFloat greenValue = [userDefaults floatForKey:kGREEN];
    CGFloat blueValue = [userDefaults floatForKey:kBLUE];
    CGFloat sizeValue = [userDefaults floatForKey:kSIZE];
    
    
    [_redSlider setValue:redValue];
    [_greenSlider setValue:greenValue];
    [_blueSlider setValue:blueValue];
    [_sizeSlider setValue:sizeValue];
    
    
    UIColor *color=[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:sizeValue];
    [_paletteView setBackgroundColor:color];
    
    
    SetStrokeSizeCommand *sizeCommand=(SetStrokeSizeCommand*)_sizeSlider.command;
    sizeCommand.delegate=self;
    
    
}

-(void)initView{
    
    SetStrokeColorCommand *colorCommand=[[SetStrokeColorCommand alloc]init];
    SetStrokeSizeCommand *sizeCommand=[[SetStrokeSizeCommand alloc]init];
    
    UINavigationBar *navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:navigationBar];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 20, 100, 30)];
    [btn setTitle:@"done" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [navigationBar addSubview:btn];
    
    //开始创建页面
    UILabel *titleLb=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(navigationBar.frame)+15, SCREEN_WIDTH, 20)];
    titleLb.text=@"Stroke Color";
    titleLb.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:titleLb];
    
    //红
    UILabel *rLb=[[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(titleLb.frame)+15, 20, 20)];
    rLb.text=@"R";
    [self.view addSubview:rLb];
    _redSlider=[[CommandSlider alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rLb.frame), rLb.frame.origin.y, 220, 30)];
    _redSlider.command=colorCommand;
    [self.view addSubview:_redSlider];
    
    [_redSlider addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    //绿
    UILabel *gLb=[[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(rLb.frame)+15, 20, 20)];
    gLb.text=@"G";
    [self.view addSubview:gLb];
    _greenSlider=[[CommandSlider alloc]initWithFrame:CGRectMake(CGRectGetMaxX(gLb.frame), gLb.frame.origin.y, 220, 30)];
    _greenSlider.command=colorCommand;
    [self.view addSubview:_greenSlider];
    [_greenSlider addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    //蓝
    UILabel *bLb=[[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(gLb.frame)+15, 20, 20)];
    bLb.text=@"B";
    [self.view addSubview:bLb];
    
    _blueSlider=[[CommandSlider alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bLb.frame), CGRectGetMaxY(gLb.frame)+15, 220, 30)];
    _blueSlider.command=colorCommand;
    [self.view addSubview:_blueSlider];
    [_blueSlider addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    _paletteView=[[UIView alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(_blueSlider.frame)+30, SCREEN_WIDTH-80, 100)];
    _paletteView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_paletteView];
    
    
    //大小
    UIImage *bigImg=[UIImage imageNamed:@"large_dot"];
    UIImage *smallImg=[UIImage imageNamed:@"small_dot"];
    UIImageView *smallImgView=[[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_paletteView.frame)+19, smallImg.size.width, smallImg.size.height)];
    smallImgView.image=smallImg;
    [self.view addSubview:smallImgView];
   
    _sizeSlider=[[CommandSlider alloc]initWithFrame:CGRectMake(CGRectGetMaxX(smallImgView.frame), CGRectGetMaxY(_paletteView.frame)+20, 200, 30)];
    [self.view addSubview:_sizeSlider];
    _sizeSlider.command=sizeCommand;
    [_sizeSlider addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    UIImageView *bigImgView=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_sizeSlider.frame), _sizeSlider.frame.origin.y-10, bigImg.size.width, bigImg.size.height)];
    bigImgView.image=bigImg;
    [self.view addSubview:bigImgView];
    
}


-(void)doneAction:(UIButton *)btn{
  [self dismissViewControllerAnimated:YES completion:^{
      NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
      [userDefault setFloat:[_redSlider value] forKey:kRED];
      [userDefault setFloat:_greenSlider.value forKey:kGREEN];
      [userDefault setFloat:_blueSlider.value forKey:kBLUE];
      [userDefault setFloat:_sizeSlider.value forKey:kSIZE];
      
      [userDefault synchronize];
  }];
}

#pragma mark
#pragma mark--SetStrokeColorCommandDelegate methods
-(void)command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat *)size{
    *size=[_sizeSlider value];
}

-(void)onCommandSliderValueChanged:(CommandSlider *)slider{
    [[slider command]execute];
}



@end
