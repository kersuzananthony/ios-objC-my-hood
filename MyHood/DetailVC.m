//
//  DetailVC.m
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "DetailVC.h"
#import "Post.h"
#import "DataService.h"

@interface DetailVC ()

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.postImage.layer.cornerRadius = self.postImage.frame.size.width / 2;
    self.postImage.clipsToBounds = YES;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openPictureWithGestureRecognizer:)];
    
    [self.postImage addGestureRecognizer:tapGestureRecognizer];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.titleLabel.text = self.post.title;
    self.descriptionLabel.text = self.post.postDescription;
    self.title = self.post.title;
    
    self.postImage.image = [[DataService sharedInstance]imageForPathWithString:self.post.imagePath];
    self.backgroundImage.image = [[DataService sharedInstance]imageForPathWithString:self.post.imagePath];
    
    self.titleLabel.layer.zPosition = 2;
    self.descriptionLabel.layer.zPosition = 2;
    self.postImage.layer.zPosition = 2;
    
    self.backgroundImage.layer.zPosition = 1;
    self.blur.layer.zPosition = 1;
}

- (void)openPictureWithGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    [self performSegueWithIdentifier:@"PostImage" sender:self.post];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PostImageVC *postImageController = segue.destinationViewController;
    Post *post = (Post *) sender;
    
    if (postImageController && post) {
        postImageController.image = post.imagePath;
    }
}

@end