//
//  Post.h
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding>

@property(nonatomic, strong) NSString *imagePath;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *postDescription;

-(id) initWithImagePath:(NSString *)aImagePath title:(NSString *)aTitle description:(NSString *)aDescription;

// NSCoding protocol
- (void) encodeWithCoder:(NSCoder *)aCoder;
- (id)initWithCoder:(NSCoder *)aDecoder;

@end
