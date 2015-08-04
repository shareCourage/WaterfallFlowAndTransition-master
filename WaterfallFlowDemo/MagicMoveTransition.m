//
//  MagicMoveTransition.m
//  KYMagicMove
//
//  Created by Kitten Yang on 1/17/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "MagicMoveTransition.h"
#import "ViewController.h"
#import "PHTransitionController.h"
#import "UIView+MotionBlur.h"
#import "LNWaterfallFlowCell.h"
#import "LNGood.h"
@implementation MagicMoveTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //获取两个VC 和 动画发生的容器
#if 1
    id viewC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *fromViewController = (ViewController *)viewC;
    PHTransitionController *toViewController = (PHTransitionController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the thing cell we're transitioning from
    NSArray *indexPaths = [fromViewController.collectionView indexPathsForSelectedItems];
    NSIndexPath *indexPath = [indexPaths firstObject];
    fromViewController.selectedIndexPath = indexPath;
    LNWaterfallFlowCell *cell = (LNWaterfallFlowCell*)[fromViewController.collectionView cellForItemAtIndexPath:indexPath];
    UIView *cellImageSnapshot = [cell.iconView snapshotViewAfterScreenUpdates:NO];
    cellImageSnapshot.frame = [containerView convertRect:cell.iconView.frame fromView:cell.iconView.superview];
    cell.iconView.hidden = YES;
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.iconView.hidden = YES;

    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        // Fade in the second view controller's view
        toViewController.view.alpha = 1.0;
        
        // Move the cell snapshot so it's over the second view controller's image view
        CGRect frame = [containerView convertRect:toViewController.iconView.frame fromView:toViewController.view];
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        // Clean up
        toViewController.iconView.hidden = NO;
        cell.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
#endif
}


@end









