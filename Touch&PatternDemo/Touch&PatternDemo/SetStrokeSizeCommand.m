//
//  SetStrokeSizeCommand.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "SetStrokeSizeCommand.h"
#import "CoordinationViewController.h"

@implementation SetStrokeSizeCommand

-(void)execute{
    CGFloat strokeSize=1;
    [_delegate command:self didRequestForStrokeSize:&strokeSize];
    
    CoordinationViewController *coordinator=[CoordinationViewController sharedInstance];
    CanvesViewController *canvasViewcontroller=coordinator.canvasViewController;
    

    
}
@end
