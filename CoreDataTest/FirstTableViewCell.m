//
//  FirstTableViewCell.m
//  CoreDataTest
//
//  Created by  evafan2003 on 16/5/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fire) name:@"cell fire" object:nil];
    _count = 100;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) fire {

    if (_count <0) {
        _detail.text = @"到点了";
    } else {
        _detail.text = [NSString stringWithFormat:@"倒计时 %d",_count];
        _count--;
    }

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
