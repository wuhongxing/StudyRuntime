//
//  Father.h
//  StudyRuntime
//
//  Created by 吴红星 on 2021/12/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Father : NSObject <UITableViewDelegate> {
    int _age;
}

@property (nonatomic, assign) int _int;
@property (nonatomic, copy) NSString *abc;
@property (nonatomic, copy, class) NSString *classABC;

@end

NS_ASSUME_NONNULL_END
