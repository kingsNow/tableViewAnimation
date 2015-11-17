//
//  MyShowViewCell.m
//  AnimationDemo
//
//  Created by meiyu on 15/11/17.
//  Copyright © 2015年 meiyuad. All rights reserved.
//

#import "MyShowViewCell.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation MyShowViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(CGFloat)height
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cardImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
        _cardImageView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.8];
        _cardImageView.contentMode = UIViewContentModeScaleAspectFill;
        _cardImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_cardImageView];
    }
    return self;
}
- (void)imageViewAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.7;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    [self.layer addAnimation:animation forKey:@"key"];
}
@end
