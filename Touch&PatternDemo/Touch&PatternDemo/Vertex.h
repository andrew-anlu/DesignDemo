//
//  Vertex.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@protocol MarkVisitor;


@interface Vertex : NSObject<Mark>
@property (nonatomic,strong)UIColor *color;
@property (nonatomic)CGFloat size;
@property (nonatomic)CGPoint location;
@property (nonatomic,readonly)NSUInteger count;
@property (nonatomic,readonly)id<Mark> lastChild;

-(id)initWithLocation:(CGPoint)location;

-(void)addMark:(id<Mark>)mark;

-(void)removeMark:(id<Mark>)mark;
/*!
 *  @brief  根据索引查询mark的方法
 *
 *  @param index 索引
 *
 *  @return 查询到的Mark
 *
 *  @since <#version number#>
 */
-(id<Mark>)childMarkAtIndex:(NSUInteger)index;

/*!
 *  @brief  for the Vistor pattern
 *
 *  @param visitor <#visitor description#>
 *
 *  @since <#version number#>
 */
-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor;
/*!
 *  @brief  赋值
 *
 *  @param zone <#zone description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(id)copyWithZone:(NSZone *)zone;

/*!
 *  @brief  迭代模式
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(NSEnumerator *)enumerator;

/*!
 *  @brief  for internal iterator implementation
 *
 *  @param block <#block description#>
 *
 *  @since <#version number#>
 */
-(void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block;

-(id)initWithCoder:(NSCoder *)aDecoder;
-(void)encodeWithCoder:(NSCoder *)aCoder;

@end































