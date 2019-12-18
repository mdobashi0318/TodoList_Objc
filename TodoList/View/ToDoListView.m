//
//  ToDoListView.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/17.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "ToDoListView.h"

@implementation ToDoListView



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
        [self.todoTableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"Cell"];
        
        [self addSubview:self.todoTableView];
    }
    return self;
}



// MARK: UITableViewDelegate, UITableViewDataSource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.todoModel[indexPath.row];
    
    return cell;
}



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoModel.count;
}



@end
