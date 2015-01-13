//
//  Stroke.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@protocol MarkVisitor;

@interface Stroke : NSObject<Mark>{
    NSMutableArray *children;
}


@property (nonatomic,strong)UIColor *color;
@property (nonatomic)CGFloat size;
@property (nonatomic)CGPoint location;
@property (nonatomic,readonly)NSUInteger count;
@property (nonatomic,readonly)id<Mark> lastChild;


-(void)addMark:(id<Mark>)mark;

-(void)removeMark:(id<Mark>)mark;

-(id<Mark>) childMarkAtIndex:(NSUInteger)index;

//for the Visitor pattern
-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor;

-(id)copyWithZone:(NSZone *)zone;

-(NSEnumerator *)enumerator;


-(void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block;










@end
