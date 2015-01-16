//
//  Scribble.h
//  Touch&PatternDemo
//
//  Created by Andrew on 15/1/13.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"
@interface Scribble : NSObject
{
    id<Mark> parentMark_;
    id<Mark> incrementalMark_;
}

// methods for Mark management
- (void) addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void) removeMark:(id <Mark>)aMark;

//methods for memento
-(id)initWithMemenTo:(ScribbleMemento *)aMemento;
+(Scribble *)scribbleWithMemento:(ScribbleMemento *)aMemento;
-(ScribbleMemento *)scribbleMemento;
-(ScribbleMemento *)scribbleMementoWithCompleteSanpshot:(BOOL)hasCompleteSnapshot;
-(void)attachStateFromMemento:(ScribbleMemento *)memento;
@end
























