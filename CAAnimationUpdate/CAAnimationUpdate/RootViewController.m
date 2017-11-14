//
//  RootViewController.m
//  CAAnimationUpdate
//
//  Created by malf on 2017/11/14.
//  Copyright © 2017年 DST. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (copy, nonatomic) NSArray *arr;
@end

@implementation RootViewController

- (NSArray  *)arr {
    if (!_arr) {
        _arr=@[@"关键帧动画和动画组练习", @"类似twiter开场动画"];
    }
    return _arr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tablve=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    self.tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView=tablve;
    [self.view addSubview:self.tableView];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier=@"identfier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text=self.arr[indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
