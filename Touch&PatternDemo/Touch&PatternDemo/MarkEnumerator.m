//
//  MarkEnumerator.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "MarkEnumerator.h"
#import "NSMutableArray+Stack.h"

@implementation MarkEnumerator


-(NSArray *)allObjects{
    return [[stack_ reverseObjectEnumerator] allObjects];
}

-(id)nextObject{
    return [stack_ pop];
}

-(id)initWithMark:(id<Mark>)aMark{
    self=[super init];
    if(self){
        stack_=[[NSMutableArray alloc]initWithCapacity:[aMark count]];
        [self traverseAndBuildStackWithMark:aMark];
    }
    return self;

}

-(void)traverseAndBuildStackWithMark:(id<Mark>)mark{
if(mark==nil)
    return;
    [stack_ push:mark];
    
    NSUInteger index=[mark count];
    id<Mark> childMark;
    while (childMark = [mark childMarkAtIndex:--index]) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}



@end
