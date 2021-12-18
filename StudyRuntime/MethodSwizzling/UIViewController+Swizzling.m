//
//  UIViewController+Swizzling.m
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/12.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)

+ (void)load {
    SEL sel1 = @selector(viewWillAppear:);
    SEL sel2 = @selector(swilzing_viewWillAppear:);
    Method m1 = class_getInstanceMethod(self, sel1);
    Method m2 = class_getInstanceMethod(self, sel2);
    BOOL didAddMethod = class_addMethod(self, sel1, method_getImplementation(m2), method_getTypeEncoding(m2));
    if (didAddMethod) {
        class_replaceMethod(self, sel2, method_getImplementation(m1), method_getTypeEncoding(m1));
    } else {
        method_exchangeImplementations(m1, m2);
    }
}

// TODO: 这里有一个疑问
- (void)swilzing_viewWillAppear:(BOOL)animated {
    [self swilzing_viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

@end
