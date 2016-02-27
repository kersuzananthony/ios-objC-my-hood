//
//  PostImageVC.h
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostImageVC : UIViewController
@property(nonatomic, strong) NSString *image;
@property(nonatomic, weak) IBOutlet UIImageView *imageImg;

- (void)goBack:(UIGestureRecognizer *)gestureRecognizer;

@end
