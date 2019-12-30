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

/// Realmのインスタンス
static RLMRealm *realm;

/// 詳細、編集で開いたTodo
RLMResults<ToDoModel *> *openTodo;

/// Todoを入力するためのView
InputToDoView *inputToDoView;




// MARK: Init

- (instancetype)initWithMode:(TypeMode)mode {
    self = [super init];
    self.mode = mode;
    
    return self;
}



- (instancetype)initWithsTodo:(TypeMode)mode :(NSInteger)todoId {
    self = [super init];
    self.mode = mode;
    self.todoId = todoId;
    
    openTodo = [ToDoModel objectsWhere:[NSString stringWithFormat:@"todoId == '%ld'", (NSInteger)self.todoId]];
    
    
    return self;
    
}


// MARK: lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    realm = [RLMRealm defaultRealm];
    
    if(self.mode != detail) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(leftNavigationTap)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightNavigationTap)];
    }
    self.view.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    
    inputToDoView = [[InputToDoView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    [self.view addSubview:inputToDoView];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if(openTodo != nil) {
        inputToDoView.titleTextField.text = [NSString stringWithFormat:@"%1$@", openTodo.firstObject.title];
        inputToDoView.dateTextField.text = [NSString stringWithFormat:@"%1$@", openTodo.firstObject.todoDate];
        inputToDoView.detailTextView.text = [NSString stringWithFormat:@"%1$@", openTodo.firstObject.toDoDetail];
        
    }
    
    
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
        
        
        
        
        dispatch_async(dispatch_queue_create("background", 0), ^{
            @autoreleasepool {
                [realm beginWriteTransaction];
                openTodo[0].title = inputToDoView.todotitle;
                openTodo[0].todoDate = inputToDoView.tododate;
                openTodo[0].toDoDetail = inputToDoView.tododetail;
                [realm commitWriteTransaction];
                
            }
        });
        
        
    }
}

@end
