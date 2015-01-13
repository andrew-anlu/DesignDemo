//
//  Stroke.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator.h"

@implementation Stroke

@synthesize color;
@synthesize size;

-(id)init{
    self=[super init];
    if(self){
        children=[[NSMutableArray alloc]init];
    }
    return self;
}

-(void)setLocation:(CGPoint)location{
   // it doesn't set any arbitrary location
}
-(CGPoint)location{
    if([children count]>0){
      //
    }
    return CGPointZero;
}

-(void)addMark:(id<Mark>)mark{
    [children addObject:mark];
    
}

-(void)removeMark:(id<Mark>)mark{
    
    if([children containsObject:mark]){
    
        [children removeObject:mark];
    }else{
        [children makeObjectsPerformSelector:@selector(removeObject:) withObject:mark];
    }
}

-(id<Mark>)childMarkAtIndex:(NSUInteger)index{
 if(index >= [children count])
     return nil;
    return [children objectAtIndex:index];
}

-(id<Mark>) lastChild{
    return [children lastObject];
}
-(NSUInteger) count{
    return [children count];
}

-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor{
    for (id <Mark> dot in children)
    {
        [dot acceptMarkVisitor:visitor];
    }
    
    [visitor visitStroke:self];
}

#pragma mark
#pragma mark NSCopying method
-(id)copyWithZone:(NSZone *)zone{
    Stroke *strokeCopy=[[[self class] allocWithZone:zone] init];
    
    //copy the color
    [strokeCopy setColor:[UIColor colorWithCGColor:[color CGColor]]];
    //copy the size
    [strokeCopy setSize:size];
    
    //copy the childer
    for (id<Mark> child in children) {
        id<Mark> childCopy=[child copy];
        [strokeCopy addMark:childCopy];
    }
    
    return strokeCopy;
}

#pragma mark --
#pragma mark NScoder methods
-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        color=[aDecoder decodeObjectForKey:@"StrokeColor"];
        size=[aDecoder decodeFloatForKey:@"StrokeSize"];
        children=[aDecoder decodeObjectForKey:@"StrokeChildren"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:color forKey:@"StrokeColor"];
    [aCoder encodeFloat:size forKey:@"StrokeSize"];
    [aCoder encodeObject:children forKey:@"StrokeChildren"];
}

#pragma mark
#pragma mark enumerator methods

-(NSEnumerator *)enumerator{
    return [[MarkEnumerator alloc]initWithMark:self];
}
-(void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block{
    BOOL stop=NO;
    NSEnumerator *enumerator=[self enumerator];
    
    for (id<Mark> mark in enumerator) {
        block(mark,&stop);
        if(stop){
            break;
        }
    }
}

#pragma mark
#pragma mark an Extended Direct-draw Example
-(void)drawWithContext:(CGContextRef)context{
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    
    for (id<Mark> mark in children) {
        [mark drawWithContext:context];
    }

    CGContextSetLineWidth(context, self.size);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
    CGContextStrokePath(context);
    
}




















@end
