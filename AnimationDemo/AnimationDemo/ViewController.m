//
//  ViewController.m
//  AnimationDemo
//
//  Created by meiyu on 15/11/17.
//  Copyright © 2015年 meiyuad. All rights reserved.
//

#import "ViewController.h"
#import "MyShowViewCell.h"

static NSString *identifier = @"CellIdentifier";
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define CELL_HEIGHT SCREEN_WIDTH*0.56

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *mainlistTableView;
@property (nonatomic, assign) long Old_Index;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _Old_Index = -1;
    _dataArr = [NSMutableArray arrayWithArray:@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg",]];
    _mainlistTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _mainlistTableView.delegate = self;
    _mainlistTableView.dataSource = self;
    _mainlistTableView.showsVerticalScrollIndicator = NO;
    _mainlistTableView.separatorStyle = NO;
    [self.view addSubview:_mainlistTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyShowViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MyShowViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier and:CELL_HEIGHT];
        cell.cardImageView.image = [UIImage imageNamed:[_dataArr objectAtIndex:indexPath.row]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    if (_Old_Index < indexPath.row) {
        [cell imageViewAnimation];
    }
    _Old_Index = indexPath.row;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
