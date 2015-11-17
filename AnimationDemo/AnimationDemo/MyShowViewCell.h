//
//  MyShowViewCell.h
//  AnimationDemo
//
//  Created by meiyu on 15/11/17.
//  Copyright © 2015年 meiyuad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyShowViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *cardImageView;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(CGFloat)height;
- (void)imageViewAnimation;
@end
