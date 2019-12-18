//
//  ToDoListViewController.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/17.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "ToDoListViewController.h"
#import "ToDoListView.h"

@interface ToDoListViewController ()

@end

@implementation ToDoListViewController


ToDoListView *todolist;

NSArray *todoModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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


@end
