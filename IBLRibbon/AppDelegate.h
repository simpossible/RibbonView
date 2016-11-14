//
//  AppDelegate.h
//  IBLRibbon
//
//  Created by simpossible on 2016/11/11.
//  Copyright © 2016年 Ahead. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

