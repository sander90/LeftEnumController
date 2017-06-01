//
//  ViewController.m
//  LeftEnumController
//
//  Created by shansander on 2017/5/31.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "ViewController.h"

#import "SDLeftViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第一个";
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(leftPushController)];
    left.tintColor = [UIColor redColor];
    
    self.navigationItem.leftBarButtonItem = left;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftPushController
{
    NSLog(@"left push Controller 1");
    
    SDLeftViewController * leftViewController = [[SDLeftViewController alloc] init];
    leftViewController.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:leftViewController animated:YES];
}


@end
