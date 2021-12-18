//
//  Father.m
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/9.
//

#import "Father.h"

@interface Father ()

@end

@implementation Father

+ (void)load {
    NSLog(@"Father load");
}

+ (void)initialize {
    NSLog(@"Father initialize");
}

- (void)doSomething {
    NSLog(@"Father doSomething");
}

- (void)love {
    NSLog(@"Father love");
}


@end
