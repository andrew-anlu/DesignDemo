//
//  CanvesViewController.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "CanvasView.h"
#import "NSMutableArray+Stack.h"
#import "CanvasViewGenerator.h"
#import "Comman.h"

@interface CanvesViewController : UIViewController


@property (nonatomic, retain) CanvasView *canvasView;
@property (nonatomic, retain) Scribble *scribble;
@property (nonatomic, retain) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;

- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

- (NSInvocation *) drawScribbleInvocation;
- (NSInvocation *) undrawScribbleInvocation;

- (void) executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation;
- (void) unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation;

/*! MacBook Pro 2015-01-14 15:08 编辑
 *  @brief  命令的模式实现撤销和恢复
 *
 *  @param command        命令
 *  @param prepareForUndo <#prepareForUndo description#>
 *
 *  @since <#version number#>
 */
-(void)executeCommand:(Comman *)command prepareForUndo:(BOOL)prepareForUndo;
-(void)undoCommand;
-(void)redoCommand;
@property (nonatomic,strong)NSMutableArray *undoStack;
@property (nonatomic,strong)NSMutableArray *redoStack;
@end
