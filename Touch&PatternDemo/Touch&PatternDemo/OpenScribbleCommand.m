//
//  OpenScribbleCommand.m
//  Touch&PatternDemo
// 打开涂鸦图的方法
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "OpenScribbleCommand.h"
#import "Comman.h"
#import "ScribbleSource.h"
#import "CoordinationViewController.h"
#import "CanvesViewController.h"

@implementation OpenScribbleCommand

@synthesize scribbleSource=scribbleSource_;
-(id)initWithScribbleSource:(id<ScribbleSource>)aScribbleSource{
    if(self=[super init]){
        [self setScribbleSource:aScribbleSource];
    }
    return self;
}

-(void)execute{
    Scribble *scribble=[scribbleSource_ scribble];
    //set it to the current CanvasViewController
    CoordinationViewController *coodinater=[CoordinationViewController sharedInstance];
    CanvesViewController *controller=[coodinater canvasViewController];
    [controller setScribble:scribble];
}

@end


















