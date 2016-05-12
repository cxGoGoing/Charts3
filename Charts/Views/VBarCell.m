//
//  VBarCell.m
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "VBarCell.h"
#import <PureLayout.h>
@interface VBarCell()
@property (nonatomic,strong)UILabel * descLabel;
@property (nonatomic,strong)UILabel * barLabel;
@end
@implementation VBarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setUpUI];
    }
    return self;
}

- (void)setTextString:(NSString *)textString{
    _textString = textString;
    self.descLabel.text = textString;
}

- (void)setUpUI{
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.descLabel autoPinEdge:ALEdgeLeading toEdge:ALEdgeBottom ofView:self.superview];
    [self.descLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeLeading ofView:self.contentView];
}

- (UILabel*)descLabel{
    if(!_descLabel){
        _descLabel = [[UILabel alloc]init];
    }
    return _descLabel;
}

- (UILabel*)barLabel{
    if(!_barLabel){
        _barLabel = [[UILabel alloc]init];
    }
    return _barLabel;
}

+ (NSString*)cellIdentifier{
    return NSStringFromClass([self class]);
}

@end
