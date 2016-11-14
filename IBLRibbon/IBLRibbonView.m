//
//  IBLRibbonView.m
//  IBLRibbon
//
//  Created by simpossible on 2016/11/11.
//  Copyright © 2016年 Ahead. All rights reserved.
//

#import "IBLRibbonView.h"


@interface IBLRibbonView ()<CAAnimationDelegate>

@property (nonatomic, strong) UIBezierPath * bezierPathI;

@property (nonatomic, strong) UIBezierPath * bezierPathII;

@property (nonatomic, strong) CAShapeLayer * shapeLayer;

@property (nonatomic, assign) NSInteger flatDegree;

@property (nonatomic, assign) CGFloat startPoint;

@property (nonatomic, strong) CAAnimation * animationI;

@property (nonatomic, strong) CAAnimation * animationII;


@property (nonatomic, assign) BOOL show;

@property (nonatomic, assign) BOOL isback;

@property (nonatomic, assign) NSInteger xOffSet;

@property (nonatomic, strong) CADisplayLink *link;

@end



@implementation IBLRibbonView

- (instancetype)init {
    if (self = [super init]) {
        
        [self initialParameters];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)initialParameters {
    
    _flatDegree = 5;
    _startPoint = 0;
    
    _maxLineWidht = 3;
    _minLineWidth = 0;
    
    _sinWidth = 3;
    
    _lineColer = [UIColor whiteColor];
    _fillColer = [UIColor redColor];
    
    _needGradient = NO;
    
    _speedPerFPS = 5;
  
    _show = YES;
}


/**
 初始化路径
 */
- (void)initialBezierPathAfterlayout {
    
    UIBezierPath *pathI = [UIBezierPath bezierPath];
    self.bezierPathI = pathI;
    
     _shapeLayer = [CAShapeLayer layer];
    
    if (_needGradient) {
        
        if (_gradientLayer) {
            
            [self.layer addSublayer:_gradientLayer];
            _gradientLayer.mask = _shapeLayer;
            
        }else {
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = self.bounds;
            gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor blueColor].CGColor ];
            gradientLayer.startPoint = CGPointMake(0,0);
            gradientLayer.endPoint = CGPointMake(1,0);
            
            [self.layer addSublayer:gradientLayer];
            gradientLayer.mask = _shapeLayer;
        }
        
    }else {
        [self.layer addSublayer:_shapeLayer];
    }
    
    _show = NO;
   
    
}

- (void)animateWave {
    

    NSInteger width = self.bounds.size.width;
    
    [self.bezierPathI removeAllPoints];
    CGFloat height = self.bounds.size.height/2;
    
    
    CGFloat sw = _sinWidth;
    CGFloat h = _maxLineWidht - _minLineWidth;

    for (int x = 0 ; x < width; x ++) {
        
        CGFloat a = sw*M_PI*x/width;
        CGFloat b = _xOffSet*M_PI/375.0;
        CGFloat y = 1.1*10.0*sinf(a+b) +height;
        
        if (x == 0) {
              [self.bezierPathI moveToPoint:CGPointMake(x, y)];
        }
        
        [self.bezierPathI addLineToPoint:CGPointMake(x, y)];
        
    }
    
    
    for (NSInteger i = width; i > -1; i --) {
        
        CGFloat a = sw*M_PI*i/width;
        CGFloat b = _xOffSet*M_PI/width;
        CGFloat y = 1.1*10.0*sinf(a+b) +height;
        
        CGFloat flag = fabs(i - width/2.0f);
        CGFloat currenth = h - h*flag*2/width;
        
        
        [self.bezierPathI addLineToPoint:CGPointMake(i, y + currenth + _minLineWidth)];
    }
    
    [self.bezierPathI closePath];
    
    
    _xOffSet += _speedPerFPS;
    _shapeLayer.path = self.bezierPathI.CGPath;
    _shapeLayer.lineWidth = 0.5;
    _shapeLayer.strokeColor = _lineColer.CGColor;
    _shapeLayer.fillColor = _fillColer.CGColor;
    _shapeLayer.fillRule = @"even-odd";
    
    
}


- (void)startWave {
    
    
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(animateWave)];
    [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];

  
}


- (void)stopWave {
    [_link removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    _link = nil;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */



- (void)drawRect:(CGRect)rect {
    if (_show) {
        [self initialBezierPathAfterlayout];
    }
    // Drawing code
}


- (void)setLineColer:(UIColor *)lineColer {
    if (lineColer) {
        _lineColer = lineColer;
    }
}

- (void)setFillColer:(UIColor *)fillColer {
    if (fillColer) {
        _fillColer = fillColer;
    }
}


#pragma mark -移除

- (void)removeFromSuperview {
    if (_link) {
        [self stopWave];
    }
    [super removeFromSuperview];
}

@end
