//
//  ClothViewGenerator.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/13.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "ClothViewGenerator.h"
#import "ClothView.h"

@implementation ClothViewGenerator

-(CanvasView*)canvasViewWithFrame:(CGRect)aFrame{
    
    ClothView *view=[[ClothView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIHT)];
    
    return view;
}
@end
