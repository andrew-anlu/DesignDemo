//
//  SetStrokeColorCommand.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "SetStrokeColorCommand.h"
#import "CoordinationViewController.h"
#import "CanvesViewController.h"

@implementation SetStrokeColorCommand

-(void)execute{
    CGFloat redValue=0;
    CGFloat greenValue=0;
    CGFloat blueValue=0;
    
    [_delegate command:self didRequestColorComponentsForRed:&redValue green:&greenValue blue:&blueValue];
    
    if(_RGBValuesProvider){
        _RGBValuesProvider(&redValue,&greenValue,&blueValue);
    }
    
    UIColor *color=[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1];
    
    CoordinationViewController *coordinator=[CoordinationViewController sharedInstance];
    CanvesViewController *controller=[coordinator canvasViewController];
    
    [_delegate command:self didFinishColorUpdateWithColor:color];
    if(_postColorUpdateProvider){
        _postColorUpdateProvider(color);
    }
    
}
@end
