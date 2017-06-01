//
//  SDBaseNavigationViewController.m
//  LeftEnumController
//
//  Created by shansander on 2017/5/31.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDBaseNavigationViewController.h"

#import "SDPopTransition.h"
#import "SDPushTransition.h"
#import "SDLeftViewController.h"
#import "ViewController.h"

@interface SDBaseNavigationViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong)SDPopTransition * popTransition;

@property (nonatomic, strong) SDPushTransition * pushTransition;

@end

@implementation SDBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        if ([fromVC isKindOfClass:[ViewController class]] && [toVC isKindOfClass:[SDLeftViewController class]]) {
            return self.pushTransition;
        }
    }else if (operation == UINavigationControllerOperationPop){
        if ([fromVC isKindOfClass:[SDLeftViewController class]] && [toVC isKindOfClass:[ViewController class]]) {
            return self.popTransition;
        }
    }
    return nil;
}


#pragma mark - lazy

- (SDPopTransition *)popTransition
{
    if (!_popTransition) {
        _popTransition = [[SDPopTransition alloc] init];
    }
    return _popTransition;
}
- (SDPushTransition *)pushTransition
{
    if (!_pushTransition) {
        _pushTransition = [[SDPushTransition alloc] init];
    }
    return _pushTransition;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
