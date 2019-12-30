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

@property TypeMode mode;

@end

NS_ASSUME_NONNULL_END
