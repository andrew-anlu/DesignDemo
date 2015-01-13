//
//  Dot.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "Dot.h"

@implementation Dot

@synthesize color;
@synthesize size;

-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor{
    [visitor visitDot:self];
}

#pragma mark
#pragma mark NsCopying method
-(id)copyWithZone:(NSZone *)zone{
    Dot *dotCopy=[[[self class] allocWithZone:zone] initWithLocation:[super location]];
    [dotCopy setColor:[UIColor colorWithCGColor:[color CGColor]]];
    [dotCopy setSize:size];
    
   return dotCopy;
}


#pragma mark
#pragma mark NSCoder methods
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if(self){
        color=[aDecoder decodeObjectForKey:@"DotColor"];
        size=[aDecoder decodeFloatForKey:@"DotSize"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:color forKey:@"DotColor"];
    [aCoder encodeFloat:size forKey:@"DotSize"];
}


#pragma mark
#pragma mark An Extended Direct-draw Example
-(void)drawWithContext:(CGContextRef)context{
    CGFloat x=self.location.x;
    CGFloat y=self.location.y;
    
    CGFloat framesize=self.size;
    
    CGRect frame=CGRectMake(x-framesize/2, y-framesize/2, framesize, framesize);
    
    CGContextSetFillColorWithColor(context, [self.color CGColor]);
    CGContextFillEllipseInRect(context, frame);
}



@end

















