//
//  PaletteViewController.h
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CommandSlider.h"

@interface PaletteViewController : UIViewController

@property (nonatomic,strong)CommandSlider *redSlider;
@property (nonatomic,strong)CommandSlider *greenSlider;
@property (nonatomic,strong)CommandSlider *blueSlider;
@property (nonatomic,strong)CommandSlider *sizeSlider;

/*!
 *  @brief  调色板view
 *
 *  @since <#version number#>
 */
@property (nonatomic,strong)UIView *paletteView;


@end
