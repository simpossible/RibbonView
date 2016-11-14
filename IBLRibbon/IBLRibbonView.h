//
//  IBLRibbonView.h
//  IBLRibbon
//
//  Created by simpossible on 2016/11/11.
//  Copyright © 2016年 Ahead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBLRibbonView : UIView



/**
 这条线的最大宽度
 */
@property (nonatomic, assign) CGFloat maxLineWidht;


/**
 这条线的最小宽度
 */
@property (nonatomic, assign) CGFloat minLineWidth;

/**
 sin 函数的跨度 默认值 为 3
 */
@property (nonatomic, assign) CGFloat sinWidth;

@property (nonatomic, strong) UIColor *lineColer;

@property (nonatomic, strong) UIColor *fillColer;


/**
 快慢程度，每一帧移动的彩带距离
 */
@property (nonatomic, assign) CGFloat speedPerFPS;


/**
 是否需要渐变效果
 有渐变效果后 lineColor fillColer  将会失效
 */
@property (nonatomic, assign) BOOL needGradient;


/**
 渐变涂层
 如果不提供渐变涂层，将会默认生成
 */
@property (nonatomic, strong) CAGradientLayer *gradientLayer;


/**
 开始动画
 */
- (void)startWave;

- (void)stopWave;


@end
