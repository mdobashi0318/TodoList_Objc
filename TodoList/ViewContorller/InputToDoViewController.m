//
//  InputToDoViewController.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/24.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "InputToDoViewController.h"
#import "AlertManager.h"

@interface InputToDoViewController ()

@end

@implementation InputToDoViewController


// MARK: lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(leftNavigationTap)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightNavigationTap)];
    
    self.view.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    self.view.backgroundColor = UIColor.blackColor;
}




/// 画面を閉じる
- (void)leftNavigationTap {
    [self.navigationController dismissViewControllerAnimated:true completion:nil];
}


/// ToDoを保存する
- (void)rightNavigationTap {
    
    [AlertManager alertAction:self
                             :@"ToDoを保存しました"
                  handler:^(UIAlertAction *action) {
        [self.navigationController dismissViewControllerAnimated:true completion:nil];
    }];
    
}

@end
