//
//  MagicMoveInverseTransition.m
//  KYMagicMove
//
//  Created by Kitten Yang on 1/19/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "MagicMoveInverseTransition.h"
#import "UIView+MotionBlur.h"
#import "ViewController.h"
#import "PHTransitionController.h"
#import "LNWaterfallFlowCell.h"
@implementation MagicMoveInverseTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    PHTransitionController *fromViewController = (PHTransitionController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toViewController = (ViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the image view
    UIView *imageSnapshot = [fromViewController.iconView snapshotViewAfterScreenUpdates:NO];
    imageSnapshot.frame = [containerView convertRect:fromViewController.iconView.frame fromView:fromViewController.iconView.superview];
    NSLog(@"imageSnapshot.frame->%@",NSStringFromCGRect(imageSnapshot.frame));
    fromViewController.iconView.hidden = YES;
    
    // Get the cell we'll animate to
    
    LNWaterfallFlowCell *cell = (LNWaterfallFlowCell *)[toViewController.collectionView cellForItemAtIndexPath:toViewController.selectedIndexPath];
    cell.iconView.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    [containerView addSubview:imageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        // Fade out the source view controller
        fromViewController.view.alpha = 0.0;
        
        // Move the image view
        CGRect frame = [containerView convertRect:cell.iconView.frame fromView:cell.iconView.superview];
        NSLog(@"frame->%@",NSStringFromCGRect(frame));
        imageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        // Clean up
        [imageSnapshot removeFromSuperview];
        fromViewController.iconView.hidden = NO;
        cell.iconView.hidden = NO;
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}
@end
