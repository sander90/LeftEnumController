//
//  SDPopTransition.m
//  NestHouse
//
//  Created by shansander on 2017/5/26.
//  Copyright © 2017年 黄建国. All rights reserved.
//

#import "SDPopTransition.h"
#import "SDBaseTabBarViewController.h"
@implementation SDPopTransition
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
    
    toVc.view.frame = CGRectOffset(finalFrameForVc, bounds.size.width, 0);
    
    
    [[transitionContext containerView] addSubview:toVc.view];
    
    NSLog(@"list - %@", [transitionContext containerView].subviews);
    
    
    SDBaseTabBarViewController * tabbar =  (SDBaseTabBarViewController * )[[UIApplication sharedApplication].delegate window].rootViewController;
    CGRect tabbarFrame = tabbar.tabBar.frame;
    tabbar.tabBar.frame = (CGRect){{bounds.size.width, tabbarFrame.origin.y},tabbarFrame.size};
    
    [UIView animateWithDuration:0.3 animations:^{
        toVc.view.frame = finalFrameForVc;
        fromVc.view.frame = (CGRect){{-bounds.size.width , fromVc.view.frame.origin.y},fromVc.view.frame.size};
        // 这里不能像push那边做
        tabbar.tabBar.frame = (CGRect){{0,tabbarFrame.origin.y},tabbarFrame.size};
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];

}

@end
