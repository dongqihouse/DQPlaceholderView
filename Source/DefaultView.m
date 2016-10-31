//
//  DefaultView.m
//  DQPlaceViewDelegate
//
//  Created by DQ on 16/10/31.
//  Copyright © 2016年 DQ. All rights reserved.
//

#import "DefaultView.h"
#import "Masonry.h"
#import "PlaceholderMacros.h"


@implementation DefaultView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
- (void)makeUI {
    //标题
    UILabel *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    [self addSubview:titleLabel];
    titleLabel.textColor = RGB(125, 125, 125, 1);
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    //图片
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX .equalTo(self);
        make.bottom.equalTo(titleLabel.mas_top).offset(-50);
    }];
    //按钮
    UIButton *reloadButton = [[UIButton alloc] init];
    _reloadButton = reloadButton;
    [self addSubview:reloadButton];
    reloadButton.layer.cornerRadius = 5;
    reloadButton.layer.borderWidth = 1;
    reloadButton.layer.borderColor = RGB(253, 65, 54, 1).CGColor;
    [reloadButton setTitleColor:RGB(253, 65, 54, 1) forState:UIControlStateNormal];
    reloadButton.hidden = YES;
    [reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kViewWidth*40/75);
        make.height.mas_equalTo(43);
        make.centerX.equalTo(self);
        make.top.equalTo(titleLabel.mas_bottom).offset(40);
    }];
}

@end
