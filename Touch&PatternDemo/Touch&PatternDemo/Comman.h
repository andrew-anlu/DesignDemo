//
//  Comman.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comman : NSObject
@property (nonatomic,strong)NSDictionary *userInfo;

/*!
 *  @brief  执行方法
 *
 *  @since <#version number#>
 */
-(void) execute;

/*!
 *  @brief  撤销的方法
 *
 *  @since <#version number#>
 */
-(void) undo;

@end
