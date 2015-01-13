//
//  SetStrokeColorCommand.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "Comman.h"

typedef void(^RGBValuesProvider)(CGFloat *red,CGFloat *green,CGFloat *blue);
typedef void(^PostColorUpdateProvider)(UIColor *color);


@class SetStrokeColorCommand;

@protocol SetStrokeColorCommandDelegate <NSObject>

/*!
 *  @brief  调整RGB的命令
 *
 *  @param command <#command description#>
 *  @param red     <#red description#>
 *  @param green   <#green description#>
 *  @param blue    <#blue description#>
 *
 *  @since <#version number#>
 */
-(void)command:(SetStrokeColorCommand*) command didRequestColorComponentsForRed:(CGFloat *)red
         green:(CGFloat *)green
          blue:(CGFloat *)blue;
/*!
 *  @brief  修改预览的背景颜色命令
 *
 *  @param command <#command description#>
 *  @param color   <#color description#>
 *
 *  @since <#version number#>
 */
-(void)command:(SetStrokeColorCommand*) command didFinishColorUpdateWithColor:(UIColor *)color;
@end


@interface SetStrokeColorCommand : Comman

@property (nonatomic,weak)id<SetStrokeColorCommandDelegate> delegate;

@property (nonatomic,strong)RGBValuesProvider RGBValuesProvider;

@property (nonatomic,strong)PostColorUpdateProvider postColorUpdateProvider;


-(void)execute;
@end
















