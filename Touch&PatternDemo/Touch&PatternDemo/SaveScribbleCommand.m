//
//  SaveScribbleCommand.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "SaveScribbleCommand.h"
#import "UIView+UIImage.h"
#import "ScribbleManager.h"
#import "CoordinationViewController.h"

@implementation SaveScribbleCommand
-(void)execute{
    CoordinationViewController *coordinatingController=[CoordinationViewController sharedInstance];
    CanvesViewController *canvasViewController=[coordinatingController canvasViewController];
    UIImage *canvasViewImage=[[canvasViewController canvasView] image];
    
    //获取信笔涂鸦的图
    Scribble *scribble=[canvasViewController scribble];
    //用哪个ScribbleManager的实力去保存涂鸦图和缩略图
    ScribbleManager *manager=[[ScribbleManager alloc]init];
    [manager saveScribble:scribble thumbnail:canvasViewImage];
    
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"恭喜!保存成功了" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}
@end



























