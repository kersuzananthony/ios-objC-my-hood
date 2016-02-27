//
//  Post.m
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "Post.h"

@implementation Post

-(id) initWithImagePath:(NSString *)aImagePath title:(NSString *)aTitle description:(NSString *)aDescription {
    self = [super init];
    
    if (self) {
        self.imagePath = aImagePath;
        self.title = aTitle;
        self.postDescription = aDescription;
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_imagePath forKey:@"imagePath"];
    [aCoder encodeObject:_postDescription forKey:@"description"];
    [aCoder encodeObject:_title forKey:@"title"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.imagePath = (NSString *) [aDecoder decodeObjectForKey:@"imagePath"];
        self.title = (NSString *) [aDecoder decodeObjectForKey:@"title"];
        self.postDescription = (NSString *) [aDecoder decodeObjectForKey:@"description"];
    }
    
    return self;
}

@end
