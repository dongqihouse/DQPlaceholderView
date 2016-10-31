//
//  PlaceHolderDelegate.h
//  IGO24
//
//  Created by DQ on 16/9/9.
//  Copyright © 2016年 DQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PlaceholderMacros.h"

@protocol PlaceHolderDelegate <NSObject>
@optional
//预留的3中样式
/**
 *  图片占位图
 *
 *  @return <#return value description#>
 */
- (UIImage *)placeHolderWithImage;
/**
 *  文字占位图
 *
 *  @return <#return value description#>
 */
- (NSString *)placeHolderWithTitle;
/**
 *  按钮占位
 *
 *  @return <#return value description#>
 */
- (NSString *)placeHolderButtonTitle;
//自定义样式
/**
 *  自定义样式图
 *
 *  @return <#return value description#>
 */
- (UIView *)placeHolderCustomView;

/**
 *  自定义按钮 处理
 */
- (void)placeHolderCustomButtonAction;
/**
 *  重新加载数据
 */
- (void)placeHolderReloadData;
@end
