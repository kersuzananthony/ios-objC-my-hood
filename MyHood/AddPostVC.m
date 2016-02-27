//
//  AddPostVC.m
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "AddPostVC.h"
#import "DataService.h"
#import "Post.h"

@interface AddPostVC ()
@property(nonatomic, strong) UIGestureRecognizer * _Nullable tapGestureRecognizer;
@end

@implementation AddPostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.postImage.layer.cornerRadius = self.postImage.frame.size.width / 2;
    self.postImage.clipsToBounds = YES;
    imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    self.titleField.delegate = self;
    self.descriptionField.delegate = self;
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;

}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    self.postImage.image = image;
    [self.view removeGestureRecognizer:self.tapGestureRecognizer];
    self.tapGestureRecognizer = nil;
}

- (IBAction)addPicBtnPressed:(UIButton *)sender {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Picture source" message:@"Please choose your picture source" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionCamera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction *actionLibrary = [UIAlertAction actionWithTitle:@"Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    
        if (self.postImage.image == nil) {
            [self.addPictureButton setTitle:@"Add picture" forState:UIControlStateNormal];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [actionSheet addAction:actionCamera];
    [actionSheet addAction:actionLibrary];
    [actionSheet addAction:cancelAction];
    
    [self presentViewController:actionSheet animated:YES completion:^{
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeActionSheet:)];
        [self.view addGestureRecognizer:self.tapGestureRecognizer];
    }];

    
    [sender setTitle:@"" forState:UIControlStateNormal];
}

- (void)closeActionSheet:(UIGestureRecognizer *)gestureRecognizer {
    [self.view removeGestureRecognizer:self.tapGestureRecognizer];
    self.tapGestureRecognizer = nil;
    [self.addPictureButton setTitle:@"Add Picture" forState:UIControlStateNormal];
}

- (IBAction)makePostBtnPressed:(id)sender {
    NSString *title = self.titleField.text;
    NSString *description = self.descriptionField.text;
    UIImage *postImage = self.postImage.image;
    [self initIndicatorView];
    
    if (title && description && postImage) {
        NSString *imagePath = [[DataService sharedInstance]saveImageAndCreatePathWithImage:postImage];
        Post *post = [[Post alloc]initWithImagePath:imagePath title:title description:description];
        [[DataService sharedInstance]addPost:post];
        
        [self stopIndicatorView];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self stopIndicatorView];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cannot send message" message:@"Please write a title, a description and add a picture" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)initIndicatorView {
    activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    activityView.center = self.view.center;
    activityView.hidesWhenStopped = YES;
    [self.view addSubview:activityView];
    activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [activityView startAnimating];
    [[UIApplication sharedApplication]beginIgnoringInteractionEvents];
}

- (void)stopIndicatorView {
    [activityView stopAnimating];
    [[UIApplication sharedApplication]endIgnoringInteractionEvents];
}

@end

