//
//  ViewController.h
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "DataService.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    DataService *dataService;
}

@property(nonatomic, strong) NSMutableArray<Post *> *postsArray;

// UITableViewDataSource required method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

// UITableViewDelegate method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

// Custom method
- (void) onPostsLoadedWithNotif:(id)notif;

@end

