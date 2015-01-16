//
//  ScribbleManager.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"
#import "ScribbleThumbnailViewImageProxy.h"
@interface ScribbleManager : NSObject
/*! MacBook Pro 2015-01-16 09:47 编辑
 *  @brief  保存涂鸦图的方法
 *
 *  @param scribble 涂鸦图
 *  @param image    图片
 *
 *  @since <#version number#>
 */
-(void)saveScribble:(Scribble*)scribble thumbnail:(UIImage *)image;
/*! MacBook Pro 2015-01-16 09:48 编辑
 *  @brief  涂鸦图的数量
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(NSInteger) numberOfScribbles;
/*! MacBook Pro 2015-01-16 09:48 编辑
 *  @brief  获取涂鸦图的方法
 *
 *  @param indes <#indes description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(Scribble *)scribbleAtIndex:(NSInteger)indes;

-(UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index;
@end
