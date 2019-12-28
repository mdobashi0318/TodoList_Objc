//
//  ToDoModel.h
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/28.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToDoModel : RLMObject

/// ID
@property NSString *todoId;

/// ToDoのタイトル
@property NSString *title;

/// Todoの期限
@property NSString *todoDate;

/// Todoの詳細
@property NSString *toDoDetail;

@end

NS_ASSUME_NONNULL_END
