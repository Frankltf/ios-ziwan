//
//  XMGSubTagCell.m
//  xiaofei
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 刘腾飞. All rights reserved.
//

#import "XMGSubTagCell.h"
#import "XMGSubTagItem.h"
#import <UIImageView+WebCache.h>
#import "UIImageView+Down.h"
@interface XMGSubTagCell ()

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIImageView *subImageView;


@end
@implementation XMGSubTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setItem:(XMGSubTagItem *)item{
    _item=item;
    _topLabel.text=item.theme_name;
    [_subImageView xmg_setimageheader:item.image_list];
}
//设置头像

//点击订阅
- (IBAction)toshopCar:(UIButton *)sender {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
