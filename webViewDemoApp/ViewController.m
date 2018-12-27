//
//  ViewController.m
//  webViewDemoApp
//
//  Created by Zsombor on 2018. 12. 27..
//  Copyright © 2018. Zsombor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)goButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *WebViewWindow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"html/sample" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_WebViewWindow loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];
    _urlTextField.text = @"sample";
}


- (IBAction)goButtonPressed:(id)sender {
    [super viewDidLoad];
    NSString *urlString = _urlTextField.text;
    
    if ([urlString rangeOfString:@"http"].location != NSNotFound) {
        NSURL *nsurl=[NSURL URLWithString:_urlTextField.text];
        NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
        [_WebViewWindow loadRequest:nsrequest];
        [self.view addSubview:_WebViewWindow];
    } else {
        NSString *htmlFile = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"html/%@", _urlTextField.text] ofType:@"html"];
        NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        [_WebViewWindow loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];
    }
}

@end
