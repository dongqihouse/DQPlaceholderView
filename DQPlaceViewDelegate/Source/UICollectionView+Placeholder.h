//
//  UICollectionView+Placeholder.h
//  IGO24
//
//  Created by DQ on 16/9/18.
//  Copyright © 2016年 DQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceHolderDelegate.h"

@interface UICollectionView (Placeholder)

@property (weak, nonatomic) id<PlaceHolderDelegate> placeHolderDelegate;
@property (assign, nonatomic) CGFloat dq_headerHeight;

- (void)dq_reloadData:(NSError *)error;

@end
