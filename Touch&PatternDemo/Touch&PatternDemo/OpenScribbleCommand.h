//
//  OpenScribbleCommand.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "Comman.h"
#import "ScribbleSource.h"

@interface OpenScribbleCommand : Comman
{
     @private
     id<ScribbleSource> scribbleSource_;
}
@property (nonatomic,strong)id<ScribbleSource>scribbleSource;

-(id)initWithScribbleSource:(id<ScribbleSource>)aScribbleSource;

-(void)execute;
@end















