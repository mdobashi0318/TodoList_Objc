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

/// タイトル入力テキストフィールド
UITextField *titleTextField;

/// 日付入力テキストフィールド
UITextField *dateTextField;

/// 詳細入力テキストフィールド
UITextView *detailTextView;




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
            titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, cell.bounds.size.width, cell.bounds.size.height)];
            titleTextField.placeholder = @"タイトルを入力してください";
            titleTextField.tag = 1;
            [titleTextField addTarget:self
                               action:@selector(didChangeTextField:)
                     forControlEvents:UIControlEventEditingChanged
             ];
            [cell addSubview:titleTextField];
            break;
            
        case 1:
            /// Todoの期限
            dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, cell.bounds.size.width, cell.bounds.size.height)];
            dateTextField.placeholder = @"期限を入力してください";
            dateTextField.tag = 2;
            [dateTextField addTarget:self
                               action:@selector(didChangeTextField:)
                     forControlEvents:UIControlEventEditingChanged
             ];
            [cell addSubview:dateTextField];
            break;
            
        case 2:
            detailTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, cell.bounds.size.width, cell.bounds.size.height)];
            detailTextView.delegate = self;
            [cell addSubview:detailTextView];
            break;
            
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
            break;
        case 2:
            label.text = @"詳細";
            break;
            
        default:
            break;
    }
    
    [headerView addSubview:label];
    
    return headerView;
}





// MARK: UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    self.tododetail = textView.text;
}





// MARK: TextField

- (void)didChangeTextField:(UITextField *)textField {
    
    if (textField.tag == 1) {
        self.todotitle = textField.text;
        
    } else {
        self.tododate = textField.text;
    }
    
}

@end
