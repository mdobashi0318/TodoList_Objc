//
//  ToDoListView.h
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/17.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputToDoViewDelegate.h"
#import <Realm/Realm.h>
#import "ToDoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoListView : UIView<UITableViewDelegate, UITableViewDataSource>

@property UITableView *todoTableView;

@property (weak, nonatomic) id <InputToDoViewDelegate> delegate;

@property RLMResults<ToDoModel *> *todoModel;

@end

NS_ASSUME_NONNULL_END
