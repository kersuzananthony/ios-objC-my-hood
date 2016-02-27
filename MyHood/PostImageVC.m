//
//  PostImageVC.m
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "PostImageVC.h"
#import "DataService.h"

@interface PostImageVC ()

@end

@implementation PostImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goBack:)];
    [self.imageImg addGestureRecognizer:tapGestureRecognizer];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.imageImg.image = [[DataService sharedInstance]imageForPathWithString:self.image];
}

- (void)goBack:(UIGestureRecognizer *)gestureRecognizer {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

