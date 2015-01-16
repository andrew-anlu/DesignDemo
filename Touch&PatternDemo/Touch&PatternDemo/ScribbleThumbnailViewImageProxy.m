//
//  ScribbleThumbnailViewImageProxy.m
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/15.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "ScribbleThumbnailViewImageProxy.h"
#import "ScribbleMemento.h"
#import "ScribbleManager.h"

// A private category for a forward loading thread
@interface ScribbleThumbnailViewImageProxy ()

- (void) forwardImageLoadingThread;

@end


@implementation ScribbleThumbnailViewImageProxy
-(Scribble*)scribble{
    if(scribble_==nil){
        NSFileManager *fileManager=[NSFileManager defaultManager];
        NSData *scribbleData=[fileManager contentsAtPath:scribblePath_];
        ScribbleMemento *scribbleMemento=[ScribbleMemento mementoWithData:scribbleData];
        scribble_=[Scribble scribbleWithMemento:scribbleMemento];
    }
    return scribble_;
}

-(UIImage *)image{
    if(realImage_==nil){
        realImage_=[[UIImage alloc]initWithContentsOfFile:self.imagepath];
        
    }
    
    return realImage_;
}

-(void)drawRect:(CGRect)rect{
    if(realImage_==nil){
        CGContextRef context = UIGraphicsGetCurrentContext();

        CGContextSetLineWidth(context, 10.0);
        const CGFloat dashLengths[2] = {10,3};
        CGContextSetLineDash (context, 3, dashLengths, 2);
        CGContextSetStrokeColorWithColor(context, [[UIColor darkGrayColor] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        if(!loadingThreadLanched_){
            [self performSelectorInBackground:@selector(forwardImageLoadingThread) withObject:nil];
            loadingThreadLanched_=YES;
        }
    }else{
        [realImage_ drawInRect:rect];
    }
    
}

#pragma mark touch event handlers
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_touchCommand execute];
}

-(void)forwardImageLoadingThread{
    [self image];
    [self performSelectorInBackground:@selector(setNeedsDisplay) withObject:nil];
}

@end





























