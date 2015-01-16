//
//  ScribbleMemento.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface ScribbleMemento : NSObject
{
  @private
    id<Mark>mark;
    BOOL hasCompleteSnapshot_;
}

+(ScribbleMemento *)mementoWithData:(NSData *)data;

-(NSData *)data;

@end
















