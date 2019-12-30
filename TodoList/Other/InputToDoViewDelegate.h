//
//  InputToDoViewDelegate.h
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/30.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#ifndef InputToDoViewDelegate_h
#define InputToDoViewDelegate_h




// MARK: Delegate

@protocol InputToDoViewDelegate <NSObject>

/// 詳細を開く
- (void)openTodoDetail:(NSInteger)row;

/// 編集画面を開く
- (void)openTodoEdit:(NSInteger)row;

/// Todoの削除
- (void)todoDelete:(NSInteger)row;


@end



#endif /* InputToDoViewDelegate_h */
