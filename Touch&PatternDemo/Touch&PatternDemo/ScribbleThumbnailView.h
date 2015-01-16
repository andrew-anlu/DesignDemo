//
//  ScribbleThumbnailView.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/15.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "ScribbleSource.h"

@interface ScribbleThumbnailView  : UIView<ScribbleSource>
{
@protected
    NSString *imgagePath_;
    NSString *scribblePath_;
}
@property (nonatomic,readonly)UIImage *image;
@property (nonatomic,readonly)Scribble *scribble;
@property  (nonatomic,strong)NSString *imagepath;
@property (nonatomic,strong)NSString *scribblePath;

@end
