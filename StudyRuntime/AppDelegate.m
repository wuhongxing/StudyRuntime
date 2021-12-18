//
//  AppDelegate.m
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/8.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

struct Stu {
    int age;
    const char *name;
};

typedef struct Stu Stu;
typedef struct Stu *ptrStu;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    struct Stu stu = {.age = 10, .name = "123"};
//    NSLog(@"%d - %s", stu.age, stu.name);
//    struct Stu stu = { .age = 10, .name = "123" };
//    ptrStu ptrStu = &stu;
//    ptrStu->age = 20;
//    ptrStu->name = "456";
//    NSLog(@"%d %s", stu.age, stu.name);
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
