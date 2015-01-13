//
//  MarkEnumerator.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface MarkEnumerator : NSEnumerator{
   @private
    NSMutableArray *stack_;
}
-(id)initWithMark:(id<Mark>)aMark;

-(NSArray *)allObjects;

-(id)nextObject;

@end
