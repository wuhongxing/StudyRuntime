//
//  NSObject+HXKeyValueObserverRegistration.m
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/10.
//

#import "NSObject+HXKeyValueObserverRegistration.h"
#import <objc/runtime.h>


@implementation NSObject (HXKeyValueObserverRegistration)

- (void)hx_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    Class cls = objc_allocateClassPair(self.class, [NSString stringWithFormat: @"KVO_%@", NSStringFromClass(self.class)].UTF8String, 0);
    Method method = class_getInstanceMethod(self.class, @selector(setAbc:));
    class_addMethod(cls, @selector(setAbc:), method_getImplementation(method), method_getTypeEncoding(method));
    objc_registerClassPair(cls);
}

- (void)setAbc:(NSString *)abc {
    NSLog(@"abc: %@", abc);
}

@end
