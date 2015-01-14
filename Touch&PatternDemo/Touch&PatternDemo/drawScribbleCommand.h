//
//  drawScribbleCommand.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/14.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "Comman.h"
#import "Scribble.h"

@interface drawScribbleCommand : Comman
{
  @private
    Scribble *scribble_;
    id<Mark>mark;
    BOOL shouldAddtoPreviousMark_;
}

-(void)execute;
-(void)undo;

@end
