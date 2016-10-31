//
//  UITableView+Placeholder.h
//  IGO24
//
//  Created by DQ on 16/9/9.
//  Copyright © 2016年 DQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceHolderDelegate.h"

@interface UITableView (Placeholder)
@property (weak, nonatomic) id<PlaceHolderDelegate> placeHolderDelegate;
- (void)dq_reloadData:(NSError *)error;
@end
