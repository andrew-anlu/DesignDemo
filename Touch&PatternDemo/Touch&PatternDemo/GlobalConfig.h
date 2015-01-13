//
//  GlobalConfig.h
//  HeiXiuProject
//
//  Created by Andrew on 14-9-12.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#ifndef HeiXiuProject_GlobalConfig_h
#define HeiXiuProject_GlobalConfig_h

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : 0)
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIHT  [UIScreen mainScreen].bounds.size.height


#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define NAVHEIGHT 64
#define TABBAR_HEIGHT 50

#define kRED @"red"
#define kBLUE @"blue"
#define kGREEN @"green"
#define kSIZE @"size"

//顶部背景的颜色
#define TOPBGCOLOR RGBACOLOR(97, 172, 90, 1)
#define COLOR_BGVIEW RGBACOLOR(240, 240, 240, 1)

#endif
