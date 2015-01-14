//
//  drawScribbleCommand.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/14.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "drawScribbleCommand.h"
#import "Scribble.h"
#import "GlobalConfig.h"

@implementation drawScribbleCommand
-(void)execute{
    if(!self.userInfo){
        return;
    }
    
    scribble_=[self.userInfo objectForKey:ScribbleObjectUserInfoKey];
    mark=(id)[self.userInfo objectForKey:MARKOBJECTINFoKEY];
     BOOL flag= [[self.userInfo objectForKey:AddToPreviousMarkUserInfoKey] boolValue];
    shouldAddtoPreviousMark_=flag;
    [scribble_ addMark:mark shouldAddToPreviousMark:shouldAddtoPreviousMark_];
    
}

-(void)undo{
    mark=(id)[self.userInfo objectForKey:MARKOBJECTINFoKEY];
    [scribble_ removeMark:mark];
}

@end
