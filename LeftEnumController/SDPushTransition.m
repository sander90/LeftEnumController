//
//  SDPushTransition.m
//  NestHouse
//
//  Created by shansander on 2017/5/26.
//  Copyright © 2017年 黄建国. All rights reserved.
//

#import "SDPushTransition.h"
#import "SDBaseTabBarViewController.h"
@implementation SDPushTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    toVc.view.frame = CGRectOffset(finalFrameForVc, - bounds.size.width, 0);
    
    [[transitionContext containerView] addSubview:toVc.view];
    
    [UIView animateWithDuration:0.3 animations:^{
        toVc.view.frame = finalFrameForVc;
        fromVc.view.frame = CGRectMake(bounds.size.width, fromVc.view.frame.origin.y, fromVc.view.frame.size.width, fromVc.view.frame.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    SDBaseTabBarViewController * tabbar =  (SDBaseTabBarViewController * )[[UIApplication sharedApplication].delegate window].rootViewController;
    
    
    CGRect tabbarFrame = tabbar.tabBar.frame;
    CGRect screen_frame = [[UIScreen mainScreen] bounds];
    
    [UIView animateWithDuration:0.3 animations:^{
        tabbar.tabBar.frame = (CGRect){{screen_frame.size.width,tabbarFrame.origin.y},tabbarFrame.size};
    } completion:^(BOOL finished) {
        
    }];
}

@end
