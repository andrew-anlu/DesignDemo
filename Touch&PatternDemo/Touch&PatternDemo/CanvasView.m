//
//  CanvasView.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"

@implementation CanvasView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context=UIGraphicsGetCurrentContext();
    MarkRenderer *markRenderer=[[MarkRenderer alloc]initWithCGContext:context];
    [_mark acceptMarkVisitor:markRenderer];

}






@end
