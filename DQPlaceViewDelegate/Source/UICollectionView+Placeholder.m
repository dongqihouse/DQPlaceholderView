//
//  UICollectionView+Placeholder.m
//  IGO24
//
//  Created by DQ on 16/9/18.
//  Copyright © 2016年 DQ. All rights reserved.
//

#import "UICollectionView+Placeholder.h"
#import "DefaultView.h"
#import "Masonry.h"
#import <objc/runtime.h>

@implementation UICollectionView (Placeholder)

- (void)dq_reloadData:(NSError *)error {
    [self reloadData];
    [self dq_checkEmpty:error];
}
- (void)dq_checkEmpty:(NSError *)error {
    BOOL isEmpty = YES;
    id<UICollectionViewDataSource > dataSource = self.dataSource;
    NSInteger sections = 1;
    if ([dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        sections = [dataSource numberOfSectionsInCollectionView:self];
        for (int index = 0; index < sections; index ++) {
            // tableView: numberOfRowsInSection: 是必须实现的
            NSInteger rows = [dataSource collectionView:self numberOfItemsInSection:index];
            if (rows) {
                isEmpty = NO;
            }
        }
    }

    [self.placeHolderView removeFromSuperview];

    if (isEmpty) {
        //header
        if ([self.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
            ((UICollectionViewFlowLayout *)
             self.collectionViewLayout).headerReferenceSize = CGSizeMake(0, 0);
        }
        //检测
        [self dq_layoutSubviews:error];
    }else {
        if ([self.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]] && self.dq_headerHeight != 0) {
            ((UICollectionViewFlowLayout *)
             self.collectionViewLayout).headerReferenceSize = CGSizeMake(kViewWidth, self.dq_headerHeight);
        }
    }
    
    
}
- (void)dq_layoutSubviews:(NSError *)error {
    id<PlaceHolderDelegate>placeHolderDelegate = self.placeHolderDelegate;
    DefaultView *placeHolderView = [[DefaultView alloc] initWithFrame:CGRectMake(0, -64, kViewWidth, kScreenHeight)];
    [self addSubview:placeHolderView];
    [self setPlaceHolderView:placeHolderView];



    if (error != nil) {
        placeHolderView.titleLabel.text = @"网络开了一会小差QAQ";
        placeHolderView.imageView.image = [UIImage imageNamed:@"weikong-meiwang"];
        [placeHolderView.reloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [placeHolderView.reloadButton addTarget:self action:@selector(placeHoderReloadData) forControlEvents:UIControlEventTouchUpInside];

    }else {

        if ([self.placeHolderDelegate respondsToSelector:@selector(placeHolderCustomView)]) {
            UIView *customView = [self.placeHolderDelegate placeHolderCustomView];
            [placeHolderView addSubview:customView];
            [customView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(placeHolderView);
            }];

        }else {
            if ([self.placeHolderDelegate respondsToSelector:@selector(placeHolderWithTitle)]) {
                placeHolderView.titleLabel.text = [self.placeHolderDelegate placeHolderWithTitle];

                if ([self.placeHolderDelegate respondsToSelector:@selector(placeHolderWithImage)]) {
                    placeHolderView.imageView.image = [placeHolderDelegate placeHolderWithImage];

                }
                if ([self.placeHolderDelegate respondsToSelector:@selector(placeHolderButtonTitle)]) {
                    [placeHolderView.reloadButton addTarget:self action:@selector(placeHolderCustomButtonAction) forControlEvents:UIControlEventTouchUpInside];
                    [placeHolderView.reloadButton setTitle:[self.placeHolderDelegate placeHolderButtonTitle] forState:UIControlStateNormal];
                }else {
                    placeHolderView.reloadButton.hidden = YES;
                }

            }
        }
    }
}
- (void)placeHolderCustomButtonAction {
    if ([self.placeHolderDelegate respondsToSelector:@selector(placeHolderCustomButtonAction)]) {
        [self.placeHolderDelegate placeHolderCustomButtonAction];
    }
}
- (void)placeHoderReloadData {
    if ([self.placeHolderDelegate respondsToSelector:@selector(placeHolderReloadData)]) {
        [self.placeHolderDelegate placeHolderReloadData];
    }
}
#pragma mark -- set get
- (id<PlaceHolderDelegate>)placeHolderDelegate{
    return  objc_getAssociatedObject(self, @selector(placeHolderDelegate));

}
- (void)setPlaceHolderDelegate:(id<PlaceHolderDelegate>)delegate {
    objc_setAssociatedObject(self, @selector(placeHolderDelegate), delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)placeHolderView {
    return objc_getAssociatedObject(self, @selector(placeHolderView));
}
- (void)setPlaceHolderView:(UIView *)view {
    objc_setAssociatedObject(self, @selector(placeHolderView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat )dq_headerHeight {
    return [objc_getAssociatedObject(self, @selector(dq_headerHeight)) floatValue];
}
- (void)setDq_headerHeight:(CGFloat )height {
    objc_setAssociatedObject(self, @selector(dq_headerHeight), @(height), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
