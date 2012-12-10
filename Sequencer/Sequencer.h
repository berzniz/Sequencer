//
//  Sequencer.h
//  Sequencer
//
//  Created by Tal Bereznitskey on 12/8/12.
//  Copyright (c) 2012 Tal Bereznitskey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SequencerCompletion)(id result);
typedef void(^SequencerStep)(id result, SequencerCompletion completion);

@interface Sequencer : NSObject
{
    NSMutableArray *steps;
}

- (void)run;
- (void)enqueueStep:(SequencerStep)step;

@end
