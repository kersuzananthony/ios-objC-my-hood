//
//  ViewController.m
//  MyHood
//
//  Created by Kersuzan on 14/02/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "ViewController.h"
#import "DetailVC.h"
#import "PostCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    dataService = [DataService sharedInstance];
    
    [dataService loadPosts];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onPostsLoadedWithNotif:) name:@"postsLoaded" object:nil];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataService.loadedPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Post *post = dataService.loadedPosts[indexPath.row];
    
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    
    if (cell != nil) {
        [cell configureCellWithPost:post];
        return cell;
    } else {
        PostCell *cell = [[PostCell alloc]init];
        [cell configureCellWithPost:post];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Post *post = dataService.loadedPosts[indexPath.row];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"DetailPost" sender:post];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"row %ld", (long)indexPath.row);
        [dataService deletePost:dataService.loadedPosts[indexPath.row]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqual: @"DetailPost"]) {
        DetailVC *detailViewController = segue.destinationViewController;
        Post *post = (Post *) sender;
        
        if (detailViewController && post) {
            detailViewController.post = post;
        }
    }
}

// UITableViewDelegate method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87.0;
}

// Custom method
- (void)onPostsLoadedWithNotif:(id)notif {
    [self.tableView reloadData];
}

@end
