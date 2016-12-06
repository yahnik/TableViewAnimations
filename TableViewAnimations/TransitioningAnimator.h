//
//  TransitioningAnimator.h
//  TableViewAnimations
//
//  Created by Dan on 12/5/16.
//  Copyright © 2016 sketchead. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@interface TransitioningAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 * 'frame' is the frame from which the presented view controller will expand out of.
 * Its frame of reference should be the window.
 */
- (instancetype)initWithInitialFrame:(CGRect)frame;

@end
