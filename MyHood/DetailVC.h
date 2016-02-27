//
//  DetailVC.h
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "PostImageVC.h"

@interface DetailVC : UIViewController
@property(nonatomic, strong) Post *post;
@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property(nonatomic, weak) IBOutlet UIImageView *postImage;
@property(nonatomic, weak) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blur;

- (void)openPictureWithGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;

@end