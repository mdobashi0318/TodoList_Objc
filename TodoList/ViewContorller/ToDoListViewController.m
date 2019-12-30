//
//  ToDoListViewController.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/17.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "ToDoListViewController.h"
#import "ToDoListView.h"
#import "InputToDoViewController.h"
#import <Realm/Realm.h>

@interface ToDoListViewController ()

@end

@implementation ToDoListViewController

// MARK: Properties

static RLMRealm *realm;

ToDoListView *todolist;

static RLMResults<ToDoModel *> *todoModel;



// MARK: lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    realm = [RLMRealm defaultRealm];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightNavigationTap)];
    
    todolist = [[ToDoListView alloc] init];
    todolist.frame = CGRectMake(0,
                                0,
                                UIScreen.mainScreen.bounds.size.width,
                                UIScreen.mainScreen.bounds.size.height
                                );
    todolist.delegate = self;
    
    [self.view addSubview:todolist];
    
    
    todoModel = [ToDoModel allObjects];
    todolist.todoModel = todoModel;
}


/// ToDoを入力するための画面を開く
- (void)rightNavigationTap {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[InputToDoViewController alloc] initWithMode:add]];
    [self presentViewController:navigationController animated:true completion:nil];
    
}




/// MARK: InputToDoViewDelegate



- (void)openTodoDetail:(NSInteger)row {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[InputToDoViewController alloc] initWithsTodo:detail:row]];
    [self presentViewController:navigationController animated:true completion:nil];
}



/// 編集画面を開く
- (void)openTodoEdit:(NSInteger)row {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[InputToDoViewController alloc] initWithsTodo:edit:row]];
    [self presentViewController:navigationController animated:true completion:nil];
    
}

/// Todoの削除
- (void)todoDelete:(NSInteger)row {
    
}

@end
