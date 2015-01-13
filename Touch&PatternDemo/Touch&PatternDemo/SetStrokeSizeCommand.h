//
//  SetStrokeSizeCommand.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "Comman.h"

@class  SetStrokeSizeCommand;

@protocol SetStrokeSizeCommandDelegate <NSObject>
/*!
 *  @brief  调整大小的命令
 *
 *  @param command 命令
 *  @param size    大小
 *
 *  @since <#version number#>
 */
-(void)command:(SetStrokeSizeCommand*)command didRequestForStrokeSize:(CGFloat *)size;

@end

@interface SetStrokeSizeCommand : Comman

@property (nonatomic,weak)id<SetStrokeSizeCommandDelegate> delegate;

-(void)execute;

@end
