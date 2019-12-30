//
//  InputToDoView.h
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/24.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface InputToDoView : UIView<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>

/// タイトル入力テキストフィールド
@property UITextField *titleTextField;
/// 日付入力テキストフィールド
@property UITextField *dateTextField;
/// 詳細入力テキストフィールド
@property UITextView *detailTextView;

@property NSString *todotitle;
@property NSString *tododate;
@property NSString *tododetail;

@end

NS_ASSUME_NONNULL_END
