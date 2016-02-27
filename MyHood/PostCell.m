//
//  PostCell.m
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "PostCell.h"
#import "DataService.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.postImg.layer.cornerRadius = self.postImg.frame.size.width / 2;
    self.postImg.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) configureCellWithPost:(Post *)aPost {
    self.titleLabel.text = aPost.title;
    self.descriptionLabel.text = aPost.postDescription;
    self.postImg.image = [[DataService sharedInstance] imageForPathWithString:aPost.imagePath];
}

@end
