//
//  AppDelegate.m
//  GameDemo
//
//  Created by 瓦栏 on 2018/1/29.
//  Copyright © 2018年 Qingshan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self configLocalHttpServer];
    return YES;
}
#pragma mark - 搭建本地服务器 并且启动
- (void)configLocalHttpServer{
    self.localHttpServer = [[HTTPServer alloc] init];
    [self.localHttpServer setType:@"_http.tcp"];
    
    //指定服务器的目录，以后请求资源就在这个目录里，这个目录拖拽进来的时候要选Create folder references,是一个蓝色文件夹
    NSString * webLocalPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"5"];
    [self.localHttpServer setDocumentRoot:webLocalPath];
    
    [self startServer];
}
- (void)startServer
{
    NSError *error;
    if([self.localHttpServer start:&error]){
        self.port = [NSString stringWithFormat:@"%d",[self.localHttpServer listeningPort]];
    }
    else{

    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
