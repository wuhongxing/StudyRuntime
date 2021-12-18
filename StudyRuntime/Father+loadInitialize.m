//
//  Father+loadInitialize.m
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/12.
//

#import "Father+loadInitialize.h"

@implementation Father (loadInitialize)

+ (void)load {
    NSLog(@"Father category load");
}

+ (void)initialize {
    if (self == [Father self]) {
        NSLog(@"看看执行了几次");
    }
    NSLog(@"Father category initialize");
}


@end
