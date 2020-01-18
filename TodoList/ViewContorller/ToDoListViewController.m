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
#import "AlertManager.h"

@interface ToDoListViewController ()

@property RLMRealm *realm;

@property RLMResults<ToDoModel *> *todoModel;

@end

@implementation ToDoListViewController

// MARK: Properties

ToDoListView *todolist;




// MARK: lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.realm = [RLMRealm defaultRealm];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightNavigationTap)];
    
    todolist = [[ToDoListView alloc] init];
    todolist.frame = CGRectMake(0,
                                0,
                                UIScreen.mainScreen.bounds.size.width,
                                UIScreen.mainScreen.bounds.size.height
                                );
    todolist.delegate = self;
    
    [self.view addSubview:todolist];
    
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    if(self.todoModel != nil){
        self.todoModel = nil;
    }
    self.todoModel = [ToDoModel allObjects];
    todolist.todoModel = self.todoModel;
    [todolist.todoTableView reloadData];
}

/// ToDoを入力するための画面を開く
- (void)rightNavigationTap {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[InputToDoViewController alloc] initWithMode:add]];
    if (@available(iOS 13.0, *)) {
        navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [self presentViewController:navigationController animated:true completion:nil];
    
}




/// MARK: InputToDoViewDelegate



- (void)openTodoDetail:(NSInteger)row {
    [self.navigationController pushViewController:[[InputToDoViewController alloc] initWithsTodo:detail:row] animated:true];
}



/// 編集画面を開く
- (void)openTodoEdit:(NSInteger)row {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[InputToDoViewController alloc] initWithsTodo:edit:row]];
    if (@available(iOS 13.0, *)) {
        navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [self presentViewController:navigationController animated:true completion:nil];
    
}

/// Todoの削除
- (void)todoDelete:(NSInteger)row {
    RLMResults<ToDoModel *> *dToDoModel = [ToDoModel objectsWhere:[NSString stringWithFormat:@"todoId == '%ld'", (NSInteger)row + 1]];
    
    
    
    [self.realm beginWriteTransaction];
    [self.realm deleteObject:dToDoModel.firstObject];
    [self.realm commitWriteTransaction];
    
    [AlertManager alertAction:self
                             :@"ToDoを削除しました"
                      handler:^(UIAlertAction *action) {
        [self.navigationController dismissViewControllerAnimated:true completion:nil];
        [self viewWillAppear:true];
    }];
}

@end
