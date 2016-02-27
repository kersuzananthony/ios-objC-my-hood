//
//  DataService.m
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "DataService.h"

@implementation DataService

NSString * const KEY_POSTS = @"posts";

-(id) init {
    if (self = [super init]) {
        _loadedPosts = [[NSMutableArray alloc]init];
    }
    
    return self;
}

+(id) sharedInstance {
    static DataService *sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[self alloc] init];
    });
    return sharedService;
}

-(void) savePosts {
    NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:self.loadedPosts];
    [[NSUserDefaults standardUserDefaults] setObject:postsData forKey:KEY_POSTS];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void) loadPosts {
    NSData *postData = [[NSUserDefaults standardUserDefaults] objectForKey:KEY_POSTS];
    
    if (postData) {
        NSMutableArray<Post *> *postsArray = (NSMutableArray<Post *>*)[NSKeyedUnarchiver unarchiveObjectWithData:postData];
        
        if (postsArray) {
            self.loadedPosts = postsArray;
        } else {
            NSLog(@"No post array");
        }
    } else {
        NSLog(@"No post data");
    }
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"postsLoaded" object:nil]];
}

-(NSString *) saveImageAndCreatePathWithImage:(UIImage *)image {
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    NSString *imagePath = [NSString stringWithFormat:@"image%f.png", [NSDate timeIntervalSinceReferenceDate]];
    NSString *fullPath = [self documentsPathForFileName:imagePath];
    
    if (imageData) {
        [imageData writeToFile:fullPath atomically:true];
    }
    
    return imagePath;
}

-(UIImage *) imageForPathWithString:(NSString *)path {
    NSString *fullPath = [self documentsPathForFileName:path];
    UIImage *image = [UIImage imageNamed:fullPath];
    
    return image;
}

-(void) addPost:(Post *) post {
    [self.loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];
}

-(NSString *) documentsPathForFileName:(NSString *)fileName {
    NSArray<NSString *> *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    NSString *fullPath = paths[0];
    return [fullPath stringByAppendingPathComponent:fileName];
    
}

- (void)deletePost:(Post *)post {
    NSInteger index = [self.loadedPosts indexOfObject:post];
    [self.loadedPosts removeObjectAtIndex:index];
    [self savePosts];
    [self loadPosts];
}

@end
