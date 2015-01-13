//
//  ClothView.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/13.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "ClothView.h"

@implementation ClothView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *titleLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        titleLb.text=@"ClothView";
        titleLb.textColor=[UIColor redColor];
        [self addSubview:titleLb];
        titleLb.textAlignment=NSTextAlignmentCenter;
        // Initialization code
        [self setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
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
