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
@end
