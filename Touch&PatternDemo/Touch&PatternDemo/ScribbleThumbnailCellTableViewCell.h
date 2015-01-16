//
//  ScribbleThumbnailCellTableViewCell.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/16.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScribbleThumbnailCellTableViewCell : UITableViewCell
+(NSInteger)numberOfPlaceHolders;

-(void)addThumbnailView:(UIView *)thumbnailView
                atIndex:(NSInteger)index;
@end
