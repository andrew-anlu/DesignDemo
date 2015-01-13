//
//  Scribble.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/13.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface Scribble : NSObject
{
    id<Mark> parentMark_;
    id<Mark> incrementalMark_;
}




// methods for Mark management
- (void) addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void) removeMark:(id <Mark>)aMark;
@end
