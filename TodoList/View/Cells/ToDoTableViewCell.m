//
//  ToDoTableViewCell.m
//  TodoList
//
//  Created by 土橋正晴 on 2019/12/22.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

#import "ToDoTableViewCell.h"


// MARK: - ToDoTableViewCell

@implementation ToDoTableViewCell

// MARK: Properties

/// タイトルラベル
UILabel *todoLabel;

/// 日付ラベル
UILabel *dateLabel;

/// 詳細ラベル
UILabel *detailLabel;

NSString *titleText;


// MARK: Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    todoLabel = [[UILabel alloc] init];
    todoLabel.frame = CGRectMake(5, self.bounds.origin.y + 5, 0, 20);
    
    [self addSubview:todoLabel];
    
    dateLabel = [[UILabel alloc] init];
    dateLabel.frame = CGRectMake(5, todoLabel.bounds.size.height + todoLabel.bounds.origin.y + 5, 0, 20);
    
    
    [self addSubview:dateLabel];
    
    detailLabel = [[UILabel alloc] init];
    detailLabel.frame = CGRectMake(5, dateLabel.frame.size.height + dateLabel.frame.origin.y, 0, 20);
    
    [self addSubview:detailLabel];
    
    return self;
}



- (void)setValue:(NSString*)title :(NSString*)date :(NSString*)detail {
    todoLabel.text = title;
    [todoLabel sizeToFit];
    
    dateLabel.text = date;
    [dateLabel sizeToFit];
    
    detailLabel.text = detail;
    [detailLabel sizeToFit];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
