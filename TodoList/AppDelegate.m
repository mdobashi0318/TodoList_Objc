//
//  AppDelegate.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/16.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    ToDoListViewController *toDoListViewController = [[ToDoListViewController alloc] init];

    // 最初に表示したいViewControllerを指定してインスタンス生成する
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:toDoListViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}


@end
