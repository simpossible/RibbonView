//
//  ViewController.m
//  IBLRibbon
//
//  Created by simpossible on 2016/11/11.
//  Copyright © 2016年 Ahead. All rights reserved.
//

#import "ViewController.h"
#import "IBLRibbonView.h"

@interface ViewController ()

@property (nonatomic, strong) IBLRibbonView * rview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rview = [[IBLRibbonView alloc] init];
    self.rview.frame = CGRectMake(0, 50, self.view.bounds.size.width, 50);
    
    self.rview.sinWidth = 2;
    self.rview.minLineWidth = 0;
    self.rview.speedPerFPS = 20;
    
    [self.rview startWave];
    
    [self.view addSubview:self.rview];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
