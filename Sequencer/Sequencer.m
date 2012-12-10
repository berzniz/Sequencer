//
//  Sequencer.m
//  Sequencer
//
//  Created by Tal Bereznitskey on 12/8/12.
//  Copyright (c) 2012 Tal Bereznitskey. All rights reserved.
//

#import "Sequencer.h"

@implementation Sequencer

- (id)init
{
    self = [super init];
    if (self) {
        steps = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)run
{
    [self runNextStepWithResult:nil];
}

- (void)enqueueStep:(SequencerStep)step
{
    [steps addObject:[step copy]];
}

- (SequencerStep)dequeueNextStep
{
    SequencerStep step = [steps objectAtIndex:0];
    [steps removeObjectAtIndex:0];
    return step;
}

- (void)runNextStepWithResult:(id)result
{
    if ([steps count] <= 0) {
        return;
    }
    
    SequencerStep step = [self dequeueNextStep];
    
    step(result, ^(id nextRresult){
        [self runNextStepWithResult:nextRresult];
    });
}

@end
