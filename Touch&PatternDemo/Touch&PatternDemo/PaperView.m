//
//  PaperView.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/13.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "PaperView.h"

@implementation PaperView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *titleLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        titleLb.text=@"PaperView";
        titleLb.textColor=[UIColor redColor];
        titleLb.textAlignment=NSTextAlignmentCenter;
        [self addSubview:titleLb];
        
        
        // Initialization code
        [self setBackgroundColor:[UIColor orangeColor]];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
