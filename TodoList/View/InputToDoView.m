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

UIDatePicker *datePicker;


// MARK: Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        
        inputTableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStyleGrouped];
        inputTableView.delegate = self;
        inputTableView.dataSource = self;
        inputTableView.separatorInset = UIEdgeInsetsZero;
        [inputTableView registerClass:UITableViewCell.self forCellReuseIdentifier:cellIdentifier];
        inputTableView.rowHeight = 50;
        inputTableView.allowsSelection = false;
        
        [self addSubview:inputTableView];
        
        
        datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,
                                                                    0, UIScreen.mainScreen.bounds.size.width,
                                                                    300)];
        [datePicker addTarget:self action:@selector(onDidChangeDate:) forControlEvents:UIControlEventValueChanged];
        
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
            self.titleTextField.tag = 1;
            [self.titleTextField addTarget:self
                               action:@selector(didChangeTextField:)
                     forControlEvents:UIControlEventEditingChanged
             ];
            [cell addSubview:self.titleTextField];
            break;
            
        case 1:
            /// Todoの期限
            self.dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, cell.bounds.size.width, cell.bounds.size.height)];
            self.dateTextField.placeholder = @"期限を入力してください";
            self.dateTextField.tag = 2;
            [self.dateTextField addTarget:self
                               action:@selector(didChangeTextField:)
                     forControlEvents:UIControlEventEditingChanged
             ];
            self.dateTextField.inputView = datePicker;
            [cell addSubview:self.dateTextField];
            break;
            
        case 2:
            self.detailTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, cell.bounds.size.width, cell.bounds.size.height)];
            self.detailTextView.delegate = self;
            [cell addSubview:self.detailTextView];
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


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
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


- (void)onDidChangeDate:(UIDatePicker*)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd hh:mm";
    self.dateTextField.text = [NSString stringWithFormat:@"%@", sender.date];
    self.tododate = [NSString stringWithFormat:@"%@", sender.date];
    
}

@end
