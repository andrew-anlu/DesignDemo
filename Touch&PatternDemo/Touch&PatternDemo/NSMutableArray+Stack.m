//
//  NSMutableArray+Stack.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

-(void)push:(id)object{
    if(object!=nil){
        [self addObject:object];
    }
}

-(id)pop
{
 if([self count]==0)
     return nil;
    id object=[self lastObject];
    return object;
}

-(void)dropButtom{
  if([self count]==0)
      return;
    
    [self removeObjectAtIndex:0];
}







@end
