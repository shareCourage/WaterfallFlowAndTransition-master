//
//  LNWaterfallFlowCell.h
//  WaterfallFlowDemo
//
//  Created by Lining on 15/5/3.
//  Copyright (c) 2015年 Lining. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LNGood;
@interface LNWaterfallFlowCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (nonatomic, strong) LNGood *good;
@end
