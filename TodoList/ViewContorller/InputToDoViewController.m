//
//  InputToDoViewController.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/24.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "InputToDoViewController.h"
#import "InputToDoView.h"
#import "AlertManager.h"
#import <Realm/Realm.h>
#import "ToDoModel.h"


@interface InputToDoViewController ()

@end

@implementation InputToDoViewController

// MARK: Propertiess

RLMRealm *realm;

InputToDoView *inputToDoView;






- (instancetype)initWithMode:(TypeMode)mode {
    self = [super init];
    self.mode = mode;
    
    return self;
}


// MARK: lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    realm = [RLMRealm defaultRealm];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(leftNavigationTap)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightNavigationTap)];
    
    self.view.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    
    
    
    inputToDoView = [[InputToDoView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    [self.view addSubview:inputToDoView];
}




/// 画面を閉じる
- (void)leftNavigationTap {
    [self.navigationController dismissViewControllerAnimated:true completion:nil];
    
}


/// ToDoを保存する
- (void)rightNavigationTap {
    
    
    if (self.mode == add) {
        ToDoModel* todoModel = [[ToDoModel alloc] init];
        /// RealmのResults
        RLMResults<ToDoModel *> *_todoModel = [ToDoModel allObjects];
        
        
        todoModel.todoId = [NSString stringWithFormat:@"%lu", (unsigned long)_todoModel.count + 1];
        todoModel.title = inputToDoView.todotitle;
        todoModel.todoDate = inputToDoView.tododate;
        todoModel.toDoDetail = inputToDoView.tododetail;
        
        [realm transactionWithBlock:^{
            [realm addObject:todoModel];
        }];
        
        [AlertManager alertAction:self
                                 :@"ToDoを保存しました"
                          handler:^(UIAlertAction *action) {
            [self.navigationController dismissViewControllerAnimated:true completion:nil];
        }];
    } else if (self.mode == edit) {
        
        NSString *todoId = @"0";
        
        RLMResults<ToDoModel *> *_todoModel = [ToDoModel objectsWhere:[NSString stringWithFormat:@"todoId == %@", todoId]];
        
        dispatch_async(dispatch_queue_create("background", 0), ^{
            @autoreleasepool {
                [realm beginWriteTransaction];
                _todoModel[0].title = inputToDoView.todotitle;
                _todoModel[0].todoDate = inputToDoView.tododate;
                _todoModel[0].toDoDetail = inputToDoView.tododetail;
                [realm commitWriteTransaction];
                
            }
        });
        
        
    }
}

@end
