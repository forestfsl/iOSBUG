//
//  SLViewController.m
//  NavigationBarBug
//
//  Created by songlin on 2016/12/19.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import "SLViewController.h"
#import "SLSecondViewController.h"
@interface SLViewController ()

@end

@implementation SLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupData {
    self.title = @"测试滑动NavigationBarbug";
    UIButton *pushBtn = [[UIButton alloc]initWithFrame:self.view.frame];
    pushBtn.backgroundColor  = [UIColor blueColor];
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    [pushBtn setTintColor:[UIColor blueColor]];
    [pushBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:pushBtn];

}

-(void)clickBtn {
    SLSecondViewController *secondVC = [[SLSecondViewController alloc]init];
    secondVC.title = @"ShowBug=1就会重现bug的了";
    [self.navigationController pushViewController:secondVC animated:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}



@end
