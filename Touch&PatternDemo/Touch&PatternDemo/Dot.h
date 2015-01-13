//
//  Dot.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-30.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"

@interface Dot : Vertex


@property (nonatomic,strong)UIColor *color;
@property (nonatomic)CGFloat size;

/*!
 *  @brief  for the Visitor pattern
 *
 *  @param visitor <#visitor description#>
 *
 *  @since <#version number#>
 */
-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor;

/*!
 *  @brief  for the Prototype pattren
 *
 *  @param zone <#zone description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(id)copyWithZone:(NSZone *)zone;
/*!
 *  @brief for the Memento pattern
 *
 *  @param coder <#coder description#>
 *
 *  @since <#version number#>
 */




@end
