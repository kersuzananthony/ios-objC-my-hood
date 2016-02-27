//
//  AddPostVC.h
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPostVC : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate> {
    UIImagePickerController *imagePicker;
    UIActivityIndicatorView *activityView;
}

@property(nonatomic, weak) IBOutlet UITextField *titleField;
@property(nonatomic, weak) IBOutlet UITextField *descriptionField;
@property(nonatomic, weak) IBOutlet UIImageView *postImage;
@property(nonatomic, weak) IBOutlet UIButton *addPictureButton;

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo;
- (void)initIndicatorView;
- (void)stopIndicatorView;
@end

