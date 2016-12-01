//
//  XYHeaderViewController.m
//  ExpandUserBackground
//
//  Created by 薛尧 on 16/12/1.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "XYHeaderViewController.h"

#define kwidth [UIScreen mainScreen].bounds.size.width

@interface XYHeaderViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITableView     *tableView;
@property(nonatomic, strong)UIImageView     *headerBackView;        // 头像背景图片
@property(nonatomic, strong)UIImageView     *photoImageView;        // 头像图片
@property(nonatomic, strong)UILabel         *userNameLabel;         // 用户名label
@property(nonatomic, strong)UILabel         *introduceLabel;        // 简介label
@property(nonatomic, strong)UIView          *tableViewHeaderView;   // tableView头部视图
@property(nonatomic, assign)NSInteger       imageHeight;            // 背景图片的高度

@end

@implementation XYHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageHeight = 240;// 背景图片的高度
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [self createTableViewHeaderView];
}

#pragma mark - 创建头视图
- (void)createTableViewHeaderView
{
    _tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kwidth, _imageHeight)];
    
    // 背景图
    _headerBackView = [[UIImageView alloc] init];
    _headerBackView.frame = CGRectMake(0, 0, kwidth, _imageHeight);
    _headerBackView.image = [UIImage imageNamed:@"bxjjq"];
    [_tableViewHeaderView addSubview:_headerBackView];
    
    // 头像
    _photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kwidth - 100) / 2, 50, 100, 100)];
    [self.tableViewHeaderView addSubview:self.photoImageView];
    _photoImageView.layer.cornerRadius = 50;
    _photoImageView.layer.masksToBounds = YES;
    _photoImageView.image = [UIImage imageNamed:@"young"];
    
    // 用户名
    _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_photoImageView.frame) + 10, kwidth, 20)];
    _userNameLabel.font = [UIFont systemFontOfSize:16];
    _userNameLabel.text = @"JRS";
    _userNameLabel.textAlignment = 1;
    _userNameLabel.textColor = [UIColor whiteColor];
    [_tableViewHeaderView addSubview:self.userNameLabel];
    
    // 简介
    _introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_userNameLabel.frame) + 10, kwidth, 20)];
    _introduceLabel.alpha = 0.7;
    _introduceLabel.text = @"他强任他强,我干我的羊";
    _introduceLabel.textAlignment = 1;
    _introduceLabel.font = [UIFont systemFontOfSize:12];
    _introduceLabel.textColor = [UIColor whiteColor];
    [_tableViewHeaderView addSubview:_introduceLabel];
    
    self.tableView.tableHeaderView = _tableViewHeaderView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = self.view.frame.size.width;// 图片的宽度
    CGFloat yOffset = scrollView.contentOffset.y;// 偏移的y值
    NSLog(@"%f",yOffset);
    if (yOffset < 0) {
        CGFloat totalOffset = _imageHeight + ABS(yOffset);
        CGFloat f = totalOffset / _imageHeight;
        self.headerBackView.frame = CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalOffset);// 拉伸后的图片的frame应该是同比例缩放
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
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
