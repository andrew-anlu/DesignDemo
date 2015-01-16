//
//  ScribbleThumbnailViewImageProxy.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/15.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "ScribbleSource.h"
#import "ScribbleThumbnailView.h"
#import "Comman.h"
@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView
{
    @private
    Scribble *scribble_;
    UIImage *realImage_;
    BOOL loadingThreadLanched_;
}

@property (nonatomic,readonly)UIImage *image;
@property (nonatomic,readonly)Scribble *scribble;
@property (nonatomic,strong)Comman *touchCommand;
@end




























