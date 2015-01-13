//
//  MarkVisitor.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol Mark;
@class Dot,Vertex,Stroke;


@protocol MarkVisitor <NSObject>

-(void) visitMark:(id<Mark>)mark;

-(void)visitDot:(Dot*)dot;
-(void)visitVertext:(Vertex*)vertext;
-(void)visitStroke:(Stroke*)stroke;


@end
