//
//  NSMutableArray+Stack.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

-(void)push:(id)object;

-(id)pop;

-(void)dropButtom;


@end
