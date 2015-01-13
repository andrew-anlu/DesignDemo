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
        [_scribble addMark:newStroke shouldAddToPreviousMark:NO];
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
        
        [_scribble addMark:singleDot shouldAddToPreviousMark:NO];
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
    if(strokeSize==0){
        _strokeSize=2;
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




@end
