//
//  AppDelegate.h
//  GameDemo
//
//  Created by 瓦栏 on 2018/1/29.
//  Copyright © 2018年 Qingshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CVCocoaHTTPServeriOS/CVCocoaHTTPServeriOS-umbrella.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) HTTPServer *localHttpServer;
@property (nonatomic,copy) NSString *port;

@end

