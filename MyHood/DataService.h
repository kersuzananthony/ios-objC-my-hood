//
//  DataService.h
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Post.h"

@interface DataService : NSObject

@property(nonatomic, strong) NSMutableArray<Post *> *loadedPosts;

+ (id)sharedInstance;
- (id)init;

- (void)savePosts;
- (void)loadPosts;
- (NSString *)saveImageAndCreatePathWithImage:(UIImage *)image;
- (UIImage *)imageForPathWithString:(NSString *)path;
- (void)addPost:(Post *) post;
- (NSString *)documentsPathForFileName:(NSString *)fileName;
- (void)deletePost:(Post *)post;

@end


