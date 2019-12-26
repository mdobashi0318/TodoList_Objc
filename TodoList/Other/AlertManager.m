//
//  AlertManager.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/26.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AlertManager : NSObject

@end


@implementation AlertManager : NSObject 

/// 閉じるボタンをつけたアラートを出す
+ (void) alertAction:(UIViewController*)viewController :(NSString*)message  handler:(void(^) (UIAlertAction *action))handler {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:nil
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert
                                          ];
    
    
    
    UIAlertAction* alertAction = [UIAlertAction actionWithTitle:@"閉じる"
                                                           style:UIAlertActionStyleDefault
                                                    handler:handler];
    [alertController addAction:alertAction];
    [viewController presentViewController:alertController animated:true completion:nil];
}

@end
