//
//  ToDoListView.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/17.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "ToDoListView.h"
#import "ToDoTableViewCell.h"

@implementation ToDoListView


static NSString *cellIdentifier = @"todoCell";


// MARK: init

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.todoTableView = [[UITableView alloc] init];
        self.todoTableView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
        self.todoTableView.delegate = self;
        self.todoTableView.dataSource = self;
        self.todoTableView.separatorInset = UIEdgeInsetsZero;
        [self.todoTableView registerClass:ToDoTableViewCell.self forCellReuseIdentifier:cellIdentifier];
        self.todoTableView.rowHeight = 60;
        [self addSubview:self.todoTableView];
    }
    return self;
}



// MARK: UITableViewDelegate, UITableViewDataSource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(self.todoModel.count == 0){
        cell.textLabel.text = @"Todoが登録されていません";
    } else {
        
        
        [cell setValue:self.todoModel[indexPath.row].title
                      :self.todoModel[indexPath.row].todoDate
                      :self.todoModel[indexPath.row].toDoDetail
         ];
    }
    return cell;
}



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(self.todoModel.count == 0){
        return 1;
    }
    return self.todoModel.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
       [self.delegate openTodoDetail:indexPath.row];
}





@end
