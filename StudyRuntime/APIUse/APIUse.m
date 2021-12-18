//
//  APIUse.m
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/11.
//

#import "APIUse.h"
#import <objc/runtime.h>

@implementation APIUse

- (instancetype)init {
    if (self = [super init]) {
//        [self objc_];
        [self class_];
    }
    return self;
}

// 主要是宏观层面的，为类与协议的空间分配，注册，注销等操作
- (void)objc_ {
    Class cls = objc_getClass("Father");
    Class cls1 = objc_getClass("Father1");
    NSLog(@"cls: %@ %p, cls1: %@", cls, cls, cls1);
    
    Protocol *protocol = objc_getProtocol("UITableViewDelegate");
    NSLog(@"protocol: %@", protocol);
    
    Class metaCls = objc_getMetaClass("Father");
    NSLog(@"metaCls: %@ %p", metaCls, metaCls);
    
    // 其他的后期再看看吧 ...
    Class objcSon = objc_allocateClassPair(cls, "objcSon", 0);
    objc_registerClassPair(objcSon);
    NSObject *son = [[objcSon alloc] init];
    [son performSelector:@selector(setAbc:) withObject:@"123"];
    NSLog(@"%@", [son performSelector:@selector(abc)]);
}

- (void)class_ {
    unsigned int count = 0;
    Class father = objc_getClass("Father");
    Class son = objc_getClass("Son");
    Class NSObject = objc_getClass("NSObject");
    Method *methods = class_copyMethodList(father, &count);
    for (int i = 0; i < count; i ++) {
        Method method = methods[i];
        NSLog(@"method: %s", sel_getName(method_getName(method)));
    }
    free(methods);
    
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList(father, &ivarCount);
    for (int i = 0; i < ivarCount; i ++) {
        Ivar ivar = ivars[i];
        NSLog(@"ivar: %s", ivar_getName(ivar));
    }
    free(ivars);
    
    unsigned int propertyCount = 0;
    // father
    /*
     property: _int
     2021-12-16 10:36:40.876239+0800 StudyRuntime[75708:664821] property: abc
     2021-12-16 10:36:40.876281+0800 StudyRuntime[75708:664821] property: hash
     2021-12-16 10:36:40.876356+0800 StudyRuntime[75708:664821] property: superclass
     2021-12-16 10:36:40.876436+0800 StudyRuntime[75708:664821] property: description
     2021-12-16 10:36:40.876509+0800 StudyRuntime[75708:664821] property: debugDescription
     */
    // son
    // 无结果
    /*
     
     */
    objc_property_t *propertys = class_copyPropertyList(NSObject, &propertyCount);
    for (int i = 0; i < propertyCount; i ++) {
        objc_property_t property = propertys[i];
        NSLog(@"property: %s", property_getName(property));
    }
    free(propertys);
    
    unsigned int protocolCount = 0;
    Protocol *__unsafe_unretained *protocols = class_copyProtocolList(father, &protocolCount);
    for (int i = 0; i < protocolCount; i ++) {
        const char *protocol = protocol_getName(protocols[i]);
        NSLog(@"protocol: %s", protocol);
    }
    free(protocols);
}

- (NSString *)string {
    return @"我为子类实现了";
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
