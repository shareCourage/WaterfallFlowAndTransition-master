//
//  PHTransitionController.m
//  WaterfallFlowDemo
//
//  Created by Kowloon on 15/8/3.
//  Copyright (c) 2015年 Lining. All rights reserved.
//

#import "PHTransitionController.h"
#import "ViewController.h"
#import "MagicMoveInverseTransition.h"
#import "LNGood.h"
#import "UIImageView+WebCache.h"
@interface PHTransitionController ()<UINavigationControllerDelegate>

@end

@implementation PHTransitionController
- (void)dealloc
{
    NSLog(@"%@->dealloc",NSStringFromClass([self class]));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.delegate = self;
    self.iconLabel.text = self.good.price;
    NSURL *url = [NSURL URLWithString:self.good.img];
    [self.iconView sd_setImageWithURL:url];
}
#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if ([toVC isKindOfClass:[ViewController class]]) {
        NSLog(@"PHTransitionController -> viewController");
        MagicMoveInverseTransition *inverseTransition = [[MagicMoveInverseTransition alloc]init];
        return inverseTransition;
    }
    return nil;

}

#if 0
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[MagicMoveInverseTransition class]]) {
        return self.percentDrivenTransition;
    }else{
        return nil;
    }
}
#endif
@end





