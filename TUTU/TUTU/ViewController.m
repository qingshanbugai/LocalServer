//
//  ViewController.m
//  GameDemo
//
//  Created by 瓦栏 on 2018/1/29.
//  Copyright © 2018年 Qingshan. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "AppDelegate.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface ViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (strong, nonatomic)  WKWebView *webView;

@property (nonatomic, copy) NSString *urlStr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setWebview];
    [self loadLocalHttpServer];
    
}

- (void)setWebview{
    NSString *js = @"document.getElementsByClassName('libao')[0].style.display='none';document.getElementsByClassName('mengceng_1')[0].style.display='none';document.getElementById('icon_7724').style.display='none'";
    //初始化WKUserScript对象
    //WKUserScriptInjectionTimeAtDocumentEnd为网页加载完成时注入
    WKUserScript *script = [[WKUserScript alloc] initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentStart  forMainFrameOnly:YES];
    //根据生成的WKUserScript对象，初始化WKWebViewConfiguration
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    [config.userContentController addUserScript:script];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    
    [self.view addSubview:self.webView];
    
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;

}
- (BOOL)loadLocalHttpServer{
    
    AppDelegate *appd = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *port = appd.port;
    if (nil == port) {
        return NO;
    }
    NSString *str = [NSString stringWithFormat:@"http://localhost:%@", port];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    return YES;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
