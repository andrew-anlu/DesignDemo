//
//  CanvesViewController.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "CanvesViewController.h"
#import "Dot.h"
#import "Stroke.h"
#import "Scribble.h"
#import "CanvasViewGenerator.h"
#import "PaterViewGenerate.h"
#import "ClothViewGenerator.h"

#import "drawScribbleCommand.h"
//#import "PaperCanvasViewGenerator.h"

@interface CanvesViewController ()

@property (nonatomic)CGPoint startPoint;
@end

@implementation CanvesViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    CanvasViewGenerator *defaultGenerator = [[ClothViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:defaultGenerator];
    
    // setup default stroke color and size
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:kRED];
    CGFloat greenValue = [userDefaults floatForKey:kGREEN];
    CGFloat blueValue = [userDefaults floatForKey:kBLUE];
    CGFloat sizeValue = [userDefaults floatForKey:kSIZE];
    
    Scribble *myScribble=[[Scribble alloc]init];
    [self setScribble:myScribble];
    
    _strokeSize=sizeValue;
    _strokeColor=RGBACOLOR(redValue, greenValue, blueValue, 1);
}


// hook up everything with a new Scribble instance
- (void) setScribble:(Scribble *)aScribble
{
    if (_scribble != aScribble)
    {
        _scribble = aScribble;
        
        // add itself to the scribble as
        // an observer for any changes to
        // its internal state - mark
        [_scribble addObserver:self
                    forKeyPath:@"mark"
                       options:NSKeyValueObservingOptionInitial |
         NSKeyValueObservingOptionNew
                       context:nil];
    }
}
#pragma mark -
#pragma mark Loading a CanvasView from a CanvasViewGenerator

- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator
{
    [_canvasView removeFromSuperview];
    CGRect aFrame = CGRectMake(0, 0, 320, 436);
    CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
    [self setCanvasView:aCanvasView];
    NSInteger viewIndex = [[[self view] subviews] count] - 1;
//    [[self view] insertSubview:_canvasView atIndex:viewIndex];
    [self.view addSubview:aCanvasView];
}


#pragma mark
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    _startPoint=[[touches anyObject] locationInView:_canvasView];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint  lastPoint=[[touches anyObject]previousLocationInView:_canvasView];
    
    if(CGPointEqualToPoint(lastPoint,_startPoint)){
        NSLog(@"手指在移动的过程中，坐标的变化:%@",NSStringFromCGPoint(lastPoint));
        [self initColorAndSize];
        id<Mark> newStroke=[[Stroke alloc]init];
        [newStroke setColor:_strokeColor];
        [newStroke setSize:_strokeSize];
//    1️⃣   [_scribble addMark:newStroke shouldAddToPreviousMark:NO];
        
//    2️⃣    NSInvocation *drawInvocation=[self drawScribbleInvocation];
//        [drawInvocation setArgument:&newStroke atIndex:2];
//        
//        NSInvocation *undrwaInvocation=[self undrawScribbleInvocation];
//        [undrwaInvocation setArgument:&newStroke atIndex:2];
//        
//        //execute the draw command with the undraw command
//        [self executeInvocation:drawInvocation withUndoInvocation:undrwaInvocation];
        
//     3️⃣用命令模式实现撤销和恢复
        
        NSDictionary *userinfo=@{ScribbleObjectUserInfoKey:_scribble,
                                 MARKOBJECTINFoKEY:newStroke,
                                 AddToPreviousMarkUserInfoKey:[NSNumber numberWithBool:NO]};
        drawScribbleCommand *command=[[drawScribbleCommand alloc]init];
        [command setUserInfo:userinfo];
        [self executeCommand:command prepareForUndo:YES];
    }
    CGPoint thisPoint=[[touches anyObject]locationInView:_canvasView];
    //创建一个顶点
    Vertex *vertext=[[Vertex alloc]initWithLocation:thisPoint];
    [_scribble addMark:vertext shouldAddToPreviousMark:YES];
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:_canvasView];
    CGPoint thisPoint = [[touches anyObject] locationInView:_canvasView];
    
    // if the touch never moves (stays at the same spot until lifted now)
    // just add a dot to an existing stroke composite
    // otherwise add it to the temp stroke as the last vertex
    if (CGPointEqualToPoint(lastPoint, thisPoint))
    {
        [self initColorAndSize];
        Dot *singleDot = [[Dot alloc]
                           initWithLocation:thisPoint];
        [singleDot setColor:_strokeColor];
        [singleDot setSize:_strokeSize];
        
//  1.      [_scribble addMark:singleDot shouldAddToPreviousMark:NO];
        
//  2.      NSInvocation *drawInvocation=[self drawScribbleInvocation];
//        [drawInvocation setArgument:&singleDot atIndex:2];
//        
//        NSInvocation *undrawInvocation=[self undrawScribbleInvocation];
//        [undrawInvocation setArgument:&singleDot atIndex:2];
//        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
//  3.用命令模式
        NSDictionary *userinfo=@{ScribbleObjectUserInfoKey:_scribble,
                                 MARKOBJECTINFoKEY:singleDot,
                                 AddToPreviousMarkUserInfoKey:[NSNumber numberWithBool:NO]};
        drawScribbleCommand *command=[[drawScribbleCommand alloc]init];
        [command setUserInfo:userinfo];
        [self executeCommand:command prepareForUndo:YES];
    }
    // reset the start point here
    _startPoint = CGPointZero;
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    _startPoint = CGPointZero;
}

-(void)initColorAndSize{
    // setup default stroke color and size
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:kRED];
    CGFloat greenValue = [userDefaults floatForKey:kGREEN];
    CGFloat blueValue = [userDefaults floatForKey:kBLUE];
    CGFloat sizeValue = [userDefaults floatForKey:kSIZE];
    
    _strokeColor=[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1];
    self.strokeSize=sizeValue;
}

-(void)setStrokeSize:(CGFloat)strokeSize{
    // enforce the smallest size
    // allowed
    if (strokeSize < 5.0)
    {
        _strokeSize = 5.0;
    }
    else
    {
        _strokeSize = strokeSize;
    }
}

#pragma mark
#pragma mark--KVO实现模式
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([object isKindOfClass:[Scribble class]] &&
        [keyPath isEqualToString:@"mark"])
    {
        id <Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        [_canvasView setMark:mark];
        [_canvasView setNeedsDisplay];
    }
}



#pragma mark
#pragma mark--Draw Scribble Invocation Generation Methods
-(NSInvocation *)drawScribbleInvocation{
    NSMethodSignature *executeMethodSignature=[_scribble methodSignatureForSelector:@selector(addMark:shouldAddToPreviousMark:)];
    
    NSInvocation *drawInvocation=[NSInvocation invocationWithMethodSignature:executeMethodSignature];
    [drawInvocation setTarget:_scribble];
    [drawInvocation setSelector:@selector(addMark:shouldAddToPreviousMark:)];
    BOOL attachToPreviousMark=NO;
    [drawInvocation setArgument:&attachToPreviousMark atIndex:3];
    return drawInvocation;
}
-(NSInvocation *)undrawScribbleInvocation{
    NSMethodSignature *unexecuteMethodSignature=[_scribble methodSignatureForSelector:@selector(removeMark:)];
    NSInvocation *undrawInvocation=[NSInvocation invocationWithMethodSignature:unexecuteMethodSignature];
    [undrawInvocation setTarget:_scribble];
    [undrawInvocation setSelector:@selector(removeMark:)];
    
    return undrawInvocation;
}

#pragma mark Draw Scribble Command Methods

- (void) executeInvocation:(NSInvocation *)invocation
        withUndoInvocation:(NSInvocation *)undoInvocation
{
    [invocation retainArguments];
    
    [[self.undoManager prepareWithInvocationTarget:self]
     unexecuteInvocation:undoInvocation
     withRedoInvocation:invocation];
    
    [invocation invoke];
}

- (void) unexecuteInvocation:(NSInvocation *)invocation
          withRedoInvocation:(NSInvocation *)redoInvocation
{
    [[self.undoManager prepareWithInvocationTarget:self]
     executeInvocation:redoInvocation
     withUndoInvocation:invocation];
    
    [invocation invoke];
}

#pragma mark
#pragma mark--命令的模式实现撤销和恢复
-(void)executeCommand:(Comman *)command prepareForUndo:(BOOL)prepareForUndo{
    if(prepareForUndo){
       //懒加载undoStack_
        if(_undoStack==nil){
            _undoStack=[[NSMutableArray alloc]initWithCapacity:LEVELSOFUNDOS];
        }
        //如果撤销栈满了,就丢掉栈底的元素
        if([_undoStack count]==LEVELSOFUNDOS){
            [_undoStack dropButtom];
        }
        //把命令压入撤销栈
        [_undoStack push:command];
    }
    [command execute];
}

-(void)undoCommand{
    Comman *command=[_undoStack pop];
    [command undo];
    
    [_undoStack removeObject:command];
    //把命令压入恢复栈
    if(_redoStack==nil){
        _redoStack=[[NSMutableArray  alloc]initWithCapacity:LEVELSOFUNDOS];
    }
    [_redoStack push:command];
    
}
-(void)redoCommand{
    Comman *command=[_redoStack pop];
    [command execute];
    
    [_redoStack removeObject:command];
    
    [_undoStack push:command];
}

@end

































