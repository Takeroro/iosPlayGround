//
//  TableViewController.m
//  PlayGround
//
//  Created by Caotingjun on 16/10/31.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "TableViewController.h"
#import "MayExpandTableViewCell.h"

static NSString *cellId = @"MayExpandCell";

@interface TableViewController ()
{
    int _count;
    NSMutableSet *_expandedIndexSet;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.automaticallyAdjustsScrollViewInsets =NO;
    
    [self.tableView registerClass:[MayExpandTableViewCell class] forCellReuseIdentifier:cellId];
    
    UIBarButtonItem * button = [[UIBarButtonItem alloc]initWithTitle:@"add a row" style:UIBarButtonItemStylePlain target:self action:@selector(insert)];
    self.navigationItem.rightBarButtonItem = button;

    _count = 3;
    
    _expandedIndexSet = [NSMutableSet new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MayExpandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [MayExpandTableViewCell initFromNib];
    }
    
    __weak typeof(self) weakSelf = self;
    [cell setClickToExpandBlk:^(){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if ([strongSelf->_expandedIndexSet containsObject:@(indexPath.row)]) {
            [strongSelf->_expandedIndexSet removeObject:@(indexPath.row)];
        } else {
            [strongSelf->_expandedIndexSet addObject:@(indexPath.row)];
        }

        [strongSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

        NSLog(@"index = %d", indexPath.row);
    }];

//    cell.textLabel.text = @(indexPath.row).stringValue;
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_expandedIndexSet containsObject:@(indexPath.row)]) {
        return 100;
    } else {
        return 66;
    }
}

#pragma mark -
- (void)insert
{
    _count++;
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
