//
//  InputToDoView.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/24.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "InputToDoView.h"
#import <Realm/Realm.h>

@implementation InputToDoView

UITableView* inputTableView;


// MARK: Properties

static NSString *cellIdentifier = @"todoCell";



// MARK: Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        
        inputTableView = [[UITableView alloc] initWithFrame:self.frame];
        inputTableView.delegate = self;
        inputTableView.dataSource = self;
        inputTableView.separatorInset = UIEdgeInsetsZero;
        [inputTableView registerClass:UITableViewCell.self forCellReuseIdentifier:cellIdentifier];
        inputTableView.rowHeight = 50;
        
        [self addSubview:inputTableView];
        
        
    }
    return self;
}






// MARK: UITableViewDelegate, UITableViewDataSource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    switch (indexPath.section) {
        case 0:
            /// Todoのタイトル
            self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, cell.bounds.size.width, cell.bounds.size.height)];
            self.titleTextField.placeholder = @"タイトルを入力してください";
            
            [cell addSubview:self.titleTextField];
            
        case 1:
            /// Todoの期限
            self.dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, cell.bounds.size.width, cell.bounds.size.height)];
            self.dateTextField.placeholder = @"期限を入力してください";
            self.dateTextField.text = @"期限を入力してください";
            [cell addSubview:self.dateTextField];
            
        case 2:
            self.detailTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, cell.bounds.size.width, cell.bounds.size.height)];
            [cell addSubview:self.detailTextView];
            
        default:
            break;
    }
    
    return cell;
}



/// セクション数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}



/// 行数
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}



/// ヘッダー
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30)];
    headerView.backgroundColor = UIColor.lightGrayColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width, 30)];
    
    switch (section) {
        case 0:
            label.text = @"タイトル";
            break;
        case 1:
            label.text = @"期限";
        case 2:
            label.text = @"詳細";
            
        default:
            break;
    }
    
    [headerView addSubview:label];
    
    return headerView;
}


@end
