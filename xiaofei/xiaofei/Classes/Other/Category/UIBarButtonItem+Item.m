//
//  UIBarButtonItem+Item.m
//  xiaofei
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 刘腾飞. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+(UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action {
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *btnview=[[UIView alloc]initWithFrame:btn.bounds];
    [btnview addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
