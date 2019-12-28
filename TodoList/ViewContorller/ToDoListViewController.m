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

@interface ToDoListViewController ()

@end

@implementation ToDoListViewController

// MARK: Properties

ToDoListView *todolist;

NSArray *todoModel;



// MARK: lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightNavigationTap)];
    
    todolist = [[ToDoListView alloc] init];
    todolist.frame = CGRectMake(0,
                                0,
                                UIScreen.mainScreen.bounds.size.width,
                                UIScreen.mainScreen.bounds.size.height
                                );
    
    
    [self.view addSubview:todolist];
    
    
    todoModel = [NSArray arrayWithObjects: @"Test1", @"Test2", @"Test3", @"Test4", nil];
    todolist.todoModel = todoModel;
}



/// ToDoを入力するための画面をふ開く
- (void)rightNavigationTap {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[InputToDoViewController alloc] init]];
    [self presentViewController:navigationController animated:true completion:nil];
    
}

@end
