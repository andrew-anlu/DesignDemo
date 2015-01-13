//
//  MarkRenderer.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"
@interface MarkRenderer : NSObject<MarkVisitor>
{
  @private
    BOOL shouldMoveContextToDot_;
    
    @protected
    CGContextRef context_;
}

-(id)initWithCGContext:(CGContextRef)context;

-(void)visitMark:(id<Mark>)mark;
-(void)visitDot:(Dot *)dot;
-(void)visitStroke:(Stroke *)stroke;
-(void)visitVertext:(Vertex *)vertext;

@end
