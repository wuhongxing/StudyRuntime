//
//  ViewController.m
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/8.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Father.h"
#import "Animal.h"
#import "NSObject+HXKeyValueObserverRegistration.h"
#import "APIUse.h"
#import "APIUse+Associate.h"
#import "Son.h"
#import "KVC.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self kvo];
    [self apiuse];
}

- (void)kvo {
    Father *father = [[Father alloc] init];
    [father hx_addObserver:self forKeyPath:@"abc" options:NSKeyValueObservingOptionNew context:nil];
    father.abc = @"123";
}

- (void)apiuse {
//        APIUse *use = [APIUse new];
    //    use.string = @"123";
    //    NSLog(@"%@", use.string);
    //    (void)[[Son alloc] init];
    
//    (void)[APIUse new];
    
//    Class class = objc_getClass("KVC");
//    id kvc = [[class alloc] init];
//    [kvc setValue:@"abc" forKey:@"private"];
//    NSLog(@"kvc: %@", [kvc valueForKey:@"_private"]);
    KVC *kvc = [[KVC alloc] init];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(kvc.class, &propertyCount);
    for (int i = 0; i < propertyCount; i ++) {
        objc_property_t property = properties[i];
      
    }
    KVC *kvc = [[KVC alloc] init];
    CFTimeInterval begin = CACurrentMediaTime();
    for (int i = 0; i < 1000000; i ++) {
        [kvc setValue:@"123" forKey:@"abc"];
    }
    CFTimeInterval end = CACurrentMediaTime();
    NSLog(@"---%f", end - begin);
    for (int i = 0; i < 1000000; i ++) {
        [kvc setAbc:@"123"];
    }
    CFTimeInterval end1 = CACurrentMediaTime();
    NSLog(@"===%f", end1 - end);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    (void)[APIUse new];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)hx_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

}


@end
