//
//  Son+loadInitialize.m
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/12.
//

#import "Son+loadInitialize.h"

@implementation Son (loadInitialize)

+ (void)load {
    NSLog(@"Son category load");
}

+ (void)initialize {
    NSLog(@"Son category initialize");
}


@end
