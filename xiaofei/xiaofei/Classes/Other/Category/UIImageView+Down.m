//
//  UIImageView+Down.m
//  xiaofei
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 刘腾飞. All rights reserved.
//

#import "UIImageView+Down.h"
#import <UIImageView+WebCache.h>
#import "UIImage+Image.h"
@implementation UIImageView (Down)

-(void)xmg_setimageheader:(NSString *)headerurl{
    UIImage *placehoder=[UIImage imageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:headerurl] placeholderImage:placehoder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(!image) return;
        self.image=[image xmg_circleImage];
    }];
}

@end
