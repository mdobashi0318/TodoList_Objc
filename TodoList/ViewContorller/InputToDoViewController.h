//
//  InputToDoViewController.h
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/24.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mode.h"

NS_ASSUME_NONNULL_BEGIN

@interface InputToDoViewController : UIViewController


- (instancetype)initWithMode:(TypeMode)mode;
- (instancetype)initWithsTodo:(TypeMode)mode :(NSInteger)todoId;

@property TypeMode mode;
@property NSInteger todoId;

@end

NS_ASSUME_NONNULL_END
