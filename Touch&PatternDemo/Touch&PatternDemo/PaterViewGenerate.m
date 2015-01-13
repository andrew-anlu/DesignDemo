//
//  PaterViewGenerate.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/13.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "PaterViewGenerate.h"
#import "PaperView.h"

@implementation PaterViewGenerate
-(CanvasView*)canvasViewWithFrame:(CGRect)aFrame{
    
    PaperView *view=[[PaperView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIHT)];
    
    
    return view;
}
@end
