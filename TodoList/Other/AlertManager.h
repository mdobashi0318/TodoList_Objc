//
//  AlertManager.h
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/26.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertManager : NSObject

/// 閉じるボタンをつけたアラートを出す
+ (void) alertAction:(UIViewController*)viewController :(NSString*)message handler:(void(^) (UIAlertAction *action))handler;
@end

NS_ASSUME_NONNULL_END
