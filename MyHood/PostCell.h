//
//  PostCell.h
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostCell : UITableViewCell
@property(nonatomic, weak) IBOutlet UIImageView *postImg;
@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UILabel *descriptionLabel;

- (void) configureCellWithPost:(Post *) aPost;

@end

