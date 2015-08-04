//
//  PHTransitionController.h
//  WaterfallFlowDemo
//
//  Created by Kowloon on 15/8/3.
//  Copyright (c) 2015年 Lining. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LNGood;
@interface PHTransitionController : UIViewController


@property(nonatomic, strong)LNGood *good;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;


@property (weak, nonatomic) IBOutlet UILabel *iconLabel;

@end




