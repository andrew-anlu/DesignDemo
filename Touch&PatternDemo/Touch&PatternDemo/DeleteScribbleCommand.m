//
//  DeleteScribbleCommand.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "DeleteScribbleCommand.h"
#import "CanvesViewController.h"
#import "CoordinationViewController.h"

@implementation DeleteScribbleCommand
-(void)execute{
    CoordinationViewController *coordinationVc=[CoordinationViewController sharedInstance];
    CanvesViewController *vc=[coordinationVc canvasViewController];
    
    Scribble *scribble=[[Scribble alloc]init];
    [vc setScribble:scribble];
}
@end
