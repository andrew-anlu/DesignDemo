//
//  Vertex.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

-(id)initWithLocation:(CGPoint)location{
    if(self=[super init]){
        [self setLocation:location];
    }
    return self;
}

-(void)setColor:(UIColor *)color{}

-(UIColor*)color{return nil;}

-(void)setSize:(CGFloat)size{}

-(CGFloat) size {return 0; }

#pragma mark Mark operations do nothing
-(void)addMark:(id<Mark>)mark{}

-(void)removeMark:(id<Mark>)mark{}

-(id<Mark>) childMarkAtIndex:(NSUInteger)index{return nil;}

-(id<Mark>) lastChild{ return nil;}

-(NSUInteger)count{return 0;}

-(NSEnumerator *)enumerator{return nil;}


-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor{
    [visitor visitVertext:self];
}


#pragma mark
#pragma mark NSCoping method
-(id)copyWithZone:(NSZone *)zone{
    Vertex *vertextCopy=[[[self class]allocWithZone:zone] initWithLocation:_location];
    return vertextCopy;
}

#pragma mark
#pragma mark NSCoder methods
//解码
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super init];
    if(self){
        _location=[(NSValue*)[aDecoder decodeObjectForKey:@"VertexLocation"] CGPointValue];
    }
    return self;
}
//编码
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:[NSValue valueWithCGPoint:_location] forKey:@"VertexLocation"];
}

#pragma mark
#pragma mark MarkIterator methods
-(void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block{}

-(void)drawWithContext:(CGContextRef)context{
    CGFloat x=self.location.x;
    CGFloat y=self.location.y;
    CGContextAddLineToPoint(context, x, y);
}

@end



















