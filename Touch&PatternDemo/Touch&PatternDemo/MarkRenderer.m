//
//  MarkRenderer.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "MarkRenderer.h"


@implementation MarkRenderer

-(id)initWithCGContext:(CGContextRef)context{
    self=[super init];
    if(self){
        context_=context;
        shouldMoveContextToDot_=YES;
    }
    return self;
}

-(void)visitMark:(id<Mark>)mark{

}


-(void)visitDot:(Dot *)dot{
    CGFloat x=[dot location].x;
    CGFloat y=[dot location].y;
    
    CGFloat frameSize=[dot size];
    CGRect frame=CGRectMake(x-frameSize/2, y-frameSize/2, frameSize, frameSize);
    
    CGContextSetFillColorWithColor(context_, [[dot color] CGColor]);
    CGContextFillEllipseInRect(context_, frame);
}


-(void)visitVertext:(Vertex *)vertext{
    CGFloat x=[vertext location].x;
    CGFloat y=[vertext location].y;
    
    if(shouldMoveContextToDot_){
        CGContextMoveToPoint(context_, x, y);
        shouldMoveContextToDot_=NO;
    }else{
        CGContextAddLineToPoint(context_, x, y);
    }
}

-(void)visitStroke:(Stroke *)stroke{
    CGContextSetStrokeColorWithColor(context_, [[stroke color] CGColor]);
    CGContextSetLineWidth(context_, [stroke size]);
    CGContextSetLineCap(context_, kCGLineCapRound);
    
    CGContextStrokePath(context_);
    shouldMoveContextToDot_=YES;
}














@end
