//
//  ViewController.m
//  ExpandUserBackground
//
//  Created by 薛尧 on 16/12/1.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

#import "XYHeaderViewController.h"
#import "XYContentInsetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - headerView实现方法
- (IBAction)headerViewBtnDidClicked:(id)sender {
    XYHeaderViewController *headerVC = [[XYHeaderViewController alloc] init];
    [self.navigationController pushViewController:headerVC animated:YES];
}

#pragma mark - contentInset实现方法
- (IBAction)contentInsetBtnDidClicked:(id)sender {
    XYContentInsetViewController *contentInsetVC = [[XYContentInsetViewController alloc] init];
    [self.navigationController pushViewController:contentInsetVC animated:YES];
}




@end
