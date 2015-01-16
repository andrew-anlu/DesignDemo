//
//  ScribbleMemento.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"

@implementation ScribbleMemento
-(NSData*)data{
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:mark];
    return data;
}

+(ScribbleMemento *)mementoWithData:(NSData *)data{
    id<Mark> remoteMark=(id<Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento *memento=[[ScribbleMemento alloc]initWithMark:remoteMark];
    return  memento;
}
-(id)initWithMark:(id<Mark>)aMark{
    self=[super init];
    if(self){
        [self setMark:aMark];
    }
    return self;
}
@end


















