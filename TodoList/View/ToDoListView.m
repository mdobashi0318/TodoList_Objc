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


NSString *cellIdentifier = @"todoCell";


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
        self.todoTableView.rowHeight = 70;
        [self addSubview:self.todoTableView];
    }
    return self;
}



// MARK: UITableViewDelegate, UITableViewDataSource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoModel.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}


@end
