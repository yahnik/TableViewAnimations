//
//  TransitioningAnimator.m
//  TableViewAnimations
//
//  Created by Dan on 12/5/16.
//  Copyright © 2016 sketchead. All rights reserved.
//

#import "TransitioningAnimator.h"

@interface TransitioningAnimator ()

@property (nonatomic, assign) CGRect initialFrame;

@end

@implementation TransitioningAnimator

- (instancetype)initWithInitialFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _initialFrame = frame;
    }
    
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];

    // toView's frame is currently its default frame - full screen. Hold on to this
    // as it will be our target frame for the animation.
    CGRect originalFrame = toView.frame;
    
    // The toView will start 'on top of' the table view cell's image view
    toView.frame = self.initialFrame;

    // Clip the detail page's subviews as the frame expands.
    toView.clipsToBounds = YES;
    
    [containerView addSubview:toView];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = originalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
        [fromView removeFromSuperview];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

@end
